import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'models.dart';
import 'lessons_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'dart:typed_data';
import 'notifications_service.dart';
import 'grammar_reference.dart';
import 'pronunciation_practice.dart';
import 'mnemonics_data.dart';
import 'chain_story_page.dart';
import 'speed_duel_page.dart';
import 'listening_practice_page.dart';
import 'reverse_recall_page.dart';
import 'mistake_notebook.dart';
import 'update_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  await AppState.instance.load();
  await AppStorage.loadProfileInto(profileNotifier);
  profileNotifier.addListener(() => AppStorage.saveProfile(profileNotifier.value));
  await NotificationService.init();
  await NotificationService.rescheduleFromSavedSettings();
  runApp(const EnglishQuest());
}

// ============================================================
// PERSISTENCE — همه چیز (پروفایل، امتیاز، پیشرفت، دفترچه، چت) روی گوشی ذخیره میشه
// ============================================================
class AppStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveProfile(UserProfile p) async {
    await _prefs.setString('profile_name', p.name);
    await _prefs.setString('profile_avatar', p.avatar);
  }

  static Future<void> loadProfileInto(ValueNotifier<UserProfile> notifier) async {
    final name = _prefs.getString('profile_name');
    final avatar = _prefs.getString('profile_avatar');
    if (name != null && avatar != null) {
      notifier.value = UserProfile(name: name, avatar: avatar);
    }
  }

  static Future<void> saveInt(String key, int value) async => _prefs.setInt(key, value);
  static int getInt(String key, int fallback) => _prefs.getInt(key) ?? fallback;

  static Future<void> saveStringList(String key, List<String> value) async => _prefs.setStringList(key, value);
  static List<String> getStringList(String key) => _prefs.getStringList(key) ?? [];

  static Future<void> saveJournal(List<JournalEntry> entries) async {
    final encoded = entries
        .map((e) => jsonEncode({'title': e.title, 'content': e.content, 'date': e.date.toIso8601String()}))
        .toList();
    await _prefs.setStringList('journal_entries', encoded);
  }

  static List<JournalEntry> loadJournal() {
    final raw = _prefs.getStringList('journal_entries') ?? [];
    return raw.map((s) {
      final m = jsonDecode(s) as Map<String, dynamic>;
      return JournalEntry(title: m['title'], content: m['content'], date: DateTime.parse(m['date']));
    }).toList();
  }

  static Future<void> saveChat(List<ChatMessage> messages) async {
    final encoded = messages.map((m) => jsonEncode({'text': m.text, 'isUser': m.isUser})).toList();
    await _prefs.setStringList('tutor_chat', encoded);
  }

  static List<ChatMessage> loadChat() {
    final raw = _prefs.getStringList('tutor_chat') ?? [];
    return raw.map((s) {
      final m = jsonDecode(s) as Map<String, dynamic>;
      return ChatMessage(m['text'], m['isUser']);
    }).toList();
  }

  // --- Friend chat (room-based, relayed through ntfy.sh) ---
  static Future<void> saveRoomCode(String code) async => _prefs.setString('friend_room_code', code);
  static String? loadRoomCode() => _prefs.getString('friend_room_code');

  static Future<void> saveFriendChat(String room, List<FriendMessage> msgs) async {
    final encoded = msgs.map((m) => jsonEncode({'sender': m.sender, 'text': m.text, 'time': m.time})).toList();
    await _prefs.setStringList('friend_chat_$room', encoded);
  }

  static List<FriendMessage> loadFriendChat(String room) {
    final raw = _prefs.getStringList('friend_chat_$room') ?? [];
    return raw.map((s) {
      final m = jsonDecode(s) as Map<String, dynamic>;
      return FriendMessage(sender: m['sender'], text: m['text'], time: m['time']);
    }).toList();
  }

  static Future<void> saveLastSeenTime(String room, int time) async => _prefs.setInt('friend_chat_lastseen_$room', time);
  static int getLastSeenTime(String room) => _prefs.getInt('friend_chat_lastseen_$room') ?? 0;

  // The shared secret passphrase never leaves this device — it's only used
  // locally to encrypt/decrypt messages, and is never sent over the network.
  static Future<void> saveSecret(String room, String secret) async => _prefs.setString('friend_secret_$room', secret);
  static String? loadSecret(String room) => _prefs.getString('friend_secret_$room');
}

// ============================================================
// END-TO-END ENCRYPTION for friend chat — AES-256, key derived
// from the shared passphrase via SHA-256. The relay server (ntfy.sh)
// only ever sees the encrypted blob, never the plaintext.
// ============================================================
enc.Key _deriveChatKey(String passphrase) {
  final digest = sha256.convert(utf8.encode(passphrase));
  return enc.Key(Uint8List.fromList(digest.bytes));
}

String encryptChatPayload(String passphrase, Map<String, dynamic> payload) {
  final key = _deriveChatKey(passphrase);
  final iv = enc.IV.fromSecureRandom(16);
  final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
  final encrypted = encrypter.encrypt(jsonEncode(payload), iv: iv);
  return '${iv.base64}:${encrypted.base64}';
}

Map<String, dynamic>? decryptChatPayload(String passphrase, String raw) {
  try {
    final parts = raw.split(':');
    if (parts.length != 2) return null;
    final key = _deriveChatKey(passphrase);
    final iv = enc.IV.fromBase64(parts[0]);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final decrypted = encrypter.decrypt64(parts[1], iv: iv);
    return jsonDecode(decrypted) as Map<String, dynamic>;
  } catch (_) {
    return null; // wrong passphrase, or not one of our encrypted messages
  }
}

// ============================================================
// APP STATE — امتیاز، سکه، و پیشرفتِ هر درس (کوییز/کلمات/جملات)
// این‌ها با هم تعیین می‌کنن که درس بعدی باز میشه یا نه
// ============================================================
class AppState extends ChangeNotifier {
  AppState._();
  static final AppState instance = AppState._();

  int xp = 0;
  int coins = 0;
  Set<String> completedActivities = {};

  Future<void> load() async {
    xp = AppStorage.getInt('xp', 120);
    coins = AppStorage.getInt('coins', 350);
    completedActivities = AppStorage.getStringList('completed_activities').toSet();
    notifyListeners();
  }

  Future<void> _persist() async {
    await AppStorage.saveInt('xp', xp);
    await AppStorage.saveInt('coins', coins);
    await AppStorage.saveStringList('completed_activities', completedActivities.toList());
  }

  void addReward(int xpGain, int coinGain) {
    xp += xpGain;
    coins += coinGain;
    _persist();
    notifyListeners();
  }

  // activity is one of: 'quiz', 'words', 'sentences'
  void markActivityComplete(int lessonId, String activity) {
    completedActivities.add('${lessonId}_$activity');
    _persist();
    notifyListeners();
  }

  bool isActivityComplete(int lessonId, String activity) => completedActivities.contains('${lessonId}_$activity');

  bool isLessonFullyComplete(int lessonId) =>
      isActivityComplete(lessonId, 'quiz') && isActivityComplete(lessonId, 'words') && isActivityComplete(lessonId, 'sentences');

  // Lessons are no longer locked — every lesson is open from the start.
  // (Kept isLessonFullyComplete/activity tracking so the ✅ badge and XP still work.)
  bool isLessonUnlocked(int lessonId) => true;
}

// ============================================================
// USER PROFILE — نام و آواتار کاربر، به‌صورت سراسری در کل اپ
// ============================================================
class UserProfile {
  final String name;
  final String avatar;
  const UserProfile({required this.name, required this.avatar});
}

const List<String> kAvatarOptions = [
  '🦁', '🐼', '🦊', '🐸', '🐨', '🦉', '🐵', '🐯', '🐰', '🐱', '🐶', '🦄',
];

// Global, in-memory profile shared across the whole app.
// (Resets on app restart — add shared_preferences later for persistence.)
final ValueNotifier<UserProfile> profileNotifier = ValueNotifier(
  const UserProfile(name: 'کاربر', avatar: '🦁'),
);

String medalForXp(int xp) {
  if (xp >= 2400) return '💎';
  if (xp >= 1200) return '🥇';
  if (xp >= 600) return '🥈';
  if (xp >= 100) return '🥉';
  return '🎯';
}

// Lets any widget push a new route on top of the whole app, even
// from inside the global floating notebook button below.
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class EnglishQuest extends StatelessWidget {
  const EnglishQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'English Quest A1',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050816),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C8FF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const AppShell(),
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            const _GlobalNotebookButton(),
          ],
        );
      },
    );
  }
}

// ============================================================
// GLOBAL FLOATING NOTEBOOK BUTTON — stays on screen across every
// page in the app (drag it anywhere; tap opens the Mistake Notebook).
// ============================================================
class _GlobalNotebookButton extends StatefulWidget {
  const _GlobalNotebookButton();
  @override
  State<_GlobalNotebookButton> createState() => _GlobalNotebookButtonState();
}

class _GlobalNotebookButtonState extends State<_GlobalNotebookButton> {
  Offset? position;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pos = position ?? Offset(size.width - 68, size.height - 170);
    return Positioned(
      left: pos.dx.clamp(8, size.width - 60),
      top: pos.dy.clamp(40, size.height - 60),
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position = (position ?? pos) + details.delta;
          });
        },
        onTap: () {
          appNavigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => const MistakeNotebookPage()),
          );
        },
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF10182E).withOpacity(.92),
            border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.6), width: 1.5),
            boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 3))],
          ),
          child: const Center(child: Text('📓', style: TextStyle(fontSize: 24))),
        ),
      ),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int tab = 0;
  int streak = 7;

  int get xp => AppState.instance.xp;
  int get coins => AppState.instance.coins;

  @override
  void initState() {
    super.initState();
    AppState.instance.addListener(_onAppStateChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => checkForUpdateAndPrompt(context));
  }

  @override
  void dispose() {
    AppState.instance.removeListener(_onAppStateChanged);
    super.dispose();
  }

  void _onAppStateChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(xp: xp, coins: coins, streak: streak),
      ProgressPage(xp: xp),
      const TutorPage(),
      ProfilePage(xp: xp),
    ];
    return Scaffold(
      drawer: AppDrawer(xp: xp, coins: coins),
      body: Stack(children: [
        const NeonBackground(),
        SafeArea(child: IndexedStack(index: tab, children: pages)),
      ]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.rocket_launch_outlined), selectedIcon: Icon(Icons.rocket_launch), label: 'Quest'),
          NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'Tutor'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final int xp, coins;
  const AppDrawer({super.key, required this.xp, required this.coins});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: const Color(0xFF080D1F),
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage(xp: xp)));
                    },
                    child: ValueListenableBuilder<UserProfile>(
                      valueListenable: profileNotifier,
                      builder: (_, profile, __) => Row(children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(colors: [Color(0xFF0066FF), Color(0xFF00C8FF)]),
                          ),
                          alignment: Alignment.center,
                          child: Text(profile.avatar, style: const TextStyle(fontSize: 26)),
                        ),
                        const SizedBox(width: 14),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(profile.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('$xp XP • $coins سکه', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                        ]),
                      ]),
                    ),
                  ),
                ),
                const Divider(color: Colors.white12),
                _drawerItem(context, Icons.account_circle_rounded, 'پروفایل من', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage(xp: xp)));
                }),
                _drawerItem(context, Icons.menu_book_rounded, 'همه‌ی درس‌ها', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LessonsListPage(xp: xp)));
                }),
                _drawerItem(context, Icons.style_rounded, 'بانک کلمات', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const WordsBankPage()));
                }),
                _drawerItem(context, Icons.auto_stories_rounded, 'داستان زنجیره‌ای', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ChainStoryPage()));
                }),
                _drawerItem(context, Icons.bolt_rounded, 'دوئل سریع', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LessonPickerForDuelPage()));
                }),
                _drawerItem(context, Icons.headphones_rounded, 'تمرین شنیداری', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ListeningPracticePage()));
                }),
                _drawerItem(context, Icons.keyboard_rounded, 'ترجمه‌ی معکوس', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ReverseRecallPage()));
                }),
                _drawerItem(context, Icons.error_outline_rounded, 'دفترچه‌ی اشتباهات', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MistakeNotebookPage()));
                }),
                _drawerItem(context, Icons.menu_book_outlined, 'مرجع گرامر', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const GrammarReferencePage()));
                }),
                _drawerItem(context, Icons.alarm_rounded, 'یادآوری روزانه', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ReminderSettingsPage()));
                }),
                _drawerItem(context, Icons.edit_note_rounded, 'دفتر انگلیسی من', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const JournalPage()));
                }),
                _drawerItem(context, Icons.chat_bubble_rounded, 'چت با رفیق', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const FriendChatPage()));
                }),
                _drawerItem(context, Icons.emoji_events_rounded, 'دستاوردها', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AchievementsPage(xp: xp, coins: coins, streak: 7)));
                }),
                _drawerItem(context, Icons.map_rounded, 'نقشه ماجراجویی', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AdventureMapPage(xp: xp)));
                }),
                _drawerItem(context, Icons.info_outline_rounded, 'درباره‌ی اپ', () {
                  Navigator.pop(context);
                  showAboutDialog(
                    context: context,
                    applicationName: 'English Quest A1',
                    applicationVersion: '1.0.0',
                  );
                }),
              ],
            ),
          ),
        ),
      );

  Widget _drawerItem(BuildContext context, IconData icon, String label, VoidCallback onTap) => ListTile(
        leading: Icon(icon, color: const Color(0xFF00E5FF)),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        onTap: onTap,
      );
}

class NeonBackground extends StatelessWidget {
  const NeonBackground({super.key});
  @override
  Widget build(BuildContext context) => Positioned.fill(
        child: IgnorePointer(
          child: Stack(children: [
            Positioned(
              top: -120, left: -100,
              child: _Glow(size: 280, color: const Color(0xFF0066FF)),
            ),
            Positioned(
              bottom: -140, right: -100,
              child: _Glow(size: 300, color: const Color(0xFF00E5FF)),
            ),
          ]),
        ),
      );
}

class _Glow extends StatelessWidget {
  final double size;
  final Color color;
  const _Glow({required this.size, required this.color});
  @override
  Widget build(BuildContext context) => Container(
        width: size, height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: color.withOpacity(.20), blurRadius: 130, spreadRadius: 45)],
        ),
      );
}

class HomePage extends StatelessWidget {
  final int xp, coins, streak;
  const HomePage({super.key, required this.xp, required this.coins, required this.streak});

  @override
  Widget build(BuildContext context) {
    final level = xp ~/ 300 + 1; // rough level from xp (300xp per level)
    final totalPossibleXp = lessons.length * 100;
    final overallProgress = (xp / totalPossibleXp).clamp(0.0, 1.0);

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 30),
      children: [
        // Header: hamburger + title + points badge
        Row(children: [
          Builder(
            builder: (ctx) => IconButton(
              onPressed: () => Scaffold.of(ctx).openDrawer(),
              icon: const Icon(Icons.menu_rounded, size: 26),
            ),
          ),
          const Expanded(
            child: Text('English Quest', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFF241A0A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withOpacity(.4)),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text('👑', style: TextStyle(fontSize: 15)),
              const SizedBox(width: 5),
              Text('$coins', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
            ]),
          ),
        ]),
        const SizedBox(height: 18),

        // Avatar + name + level + medal
        Center(
          child: ValueListenableBuilder<UserProfile>(
            valueListenable: profileNotifier,
            builder: (_, profile, __) => GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage(xp: xp))),
              child: Column(children: [
                Stack(alignment: Alignment.center, children: [
                  SizedBox(
                    width: 110, height: 110,
                    child: CircularProgressIndicator(
                      value: overallProgress,
                      strokeWidth: 5,
                      backgroundColor: Colors.white12,
                      valueColor: const AlwaysStoppedAnimation(Color(0xFF00E5FF)),
                    ),
                  ),
                  Container(
                    width: 88, height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(colors: [Color(0xFF0066FF), Color(0xFF00C8FF)]),
                      boxShadow: [BoxShadow(color: const Color(0xFF00C8FF).withOpacity(.35), blurRadius: 24)],
                    ),
                    child: Center(child: Text(profile.avatar, style: const TextStyle(fontSize: 42))),
                  ),
                ]),
                const SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(medalForXp(xp), style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 6),
                    Text(profile.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  ]),
                ),
                const SizedBox(height: 4),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('سطح شما: A$level', style: const TextStyle(fontSize: 13, color: Colors.white54)),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 18),

        // Overall progress bar
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(children: [
            const Expanded(child: Text('پیشرفت کلی', style: TextStyle(fontWeight: FontWeight.bold))),
            Text('${(overallProgress * 100).round()}%', style: const TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold)),
          ]),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(value: overallProgress, minHeight: 10, backgroundColor: Colors.white12),
        ),
        const SizedBox(height: 24),

        // 2x2 menu grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
          children: [
            MenuCard(
              icon: Icons.menu_book_rounded,
              titleFa: 'درس‌ها',
              subtitleFa: 'گرامر و کلمات',
              color: const Color(0xFF00C8FF),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonsListPage(xp: xp))),
            ),
            MenuCard(
              icon: Icons.fitness_center_rounded,
              titleFa: 'تمرین',
              subtitleFa: 'تمرین کلمات و جملات',
              color: const Color(0xFF7C4DFF),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PracticeHubPage())),
            ),
            MenuCard(
              icon: Icons.style_rounded,
              titleFa: 'کلمات',
              subtitleFa: '${lessons.fold<int>(0, (sum, l) => sum + l.words.length)} کلمه',
              color: const Color(0xFF00E5A0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WordsBankPage())),
            ),
            MenuCard(
              icon: Icons.emoji_events_rounded,
              titleFa: 'دستاوردها',
              subtitleFa: 'مدال‌ها و جوایز',
              color: Colors.amber,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AchievementsPage(xp: xp, coins: coins, streak: streak))),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const DailyQuestCard(),
        const SizedBox(height: 14),
        _JournalEntryCard(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JournalPage()))),
        const SizedBox(height: 14),
        _HomeShortcutCard(
          emoji: '💬',
          titleFa: 'چت با رفیق',
          subtitleFa: 'با اسم اتاق مشترک، با رفیقت چت کن',
          color: const Color(0xFF00E5A0),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FriendChatPage())),
        ),
      ],
    );
  }
}

class _HomeShortcutCard extends StatelessWidget {
  final String emoji, titleFa, subtitleFa;
  final Color color;
  final VoidCallback onTap;
  const _HomeShortcutCard({
    required this.emoji,
    required this.titleFa,
    required this.subtitleFa,
    required this.color,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(colors: [color.withOpacity(.16), const Color(0xFF10182E)]),
            border: Border.all(color: color.withOpacity(.3)),
          ),
          child: Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 14),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(titleFa, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 3),
                  Text(subtitleFa, style: const TextStyle(fontSize: 12, color: Colors.white54)),
                ]),
              ),
            ),
            const Icon(Icons.chevron_left_rounded, color: Colors.white38),
          ]),
        ),
      );
}

class _JournalEntryCard extends StatelessWidget {
  final VoidCallback onTap;
  const _JournalEntryCard({required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(colors: [Colors.pinkAccent.withOpacity(.16), const Color(0xFF10182E)]),
            border: Border.all(color: Colors.pinkAccent.withOpacity(.3)),
          ),
          child: Row(children: [
            const Text('✍️', style: TextStyle(fontSize: 32)),
            const SizedBox(width: 14),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('دفتر انگلیسی من', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Text('هر چی دلت خواست به انگلیسی بنویس', style: TextStyle(fontSize: 12, color: Colors.white54)),
                ]),
              ),
            ),
            const Icon(Icons.chevron_left_rounded, color: Colors.white38),
          ]),
        ),
      );
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String titleFa, subtitleFa;
  final Color color;
  final VoidCallback onTap;
  const MenuCard({
    super.key,
    required this.icon,
    required this.titleFa,
    required this.subtitleFa,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(.18), const Color(0xFF10182E)],
            ),
            border: Border.all(color: color.withOpacity(.35)),
            boxShadow: [BoxShadow(color: color.withOpacity(.12), blurRadius: 18)],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(.16), borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: color, size: 26),
            ),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(titleFa, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 3),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(subtitleFa, style: const TextStyle(fontSize: 11, color: Colors.white54)),
            ),
          ]),
        ),
      );
}

const List<String> kLessonIslandEmojis = [
  '🏝️', '⛰️', '🌋', '🏔️', '🌴', '🏜️', '🗻', '🏞️', '🌊', '🪨',
];

class LessonsListPage extends StatelessWidget {
  final int xp;
  const LessonsListPage({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    final nodes = <_MapNodeData>[];
    for (int i = 0; i < lessons.length; i++) {
      final lesson = lessons[i];
      final unlocked = AppState.instance.isLessonUnlocked(lesson.id);
      final fullyDone = AppState.instance.isLessonFullyComplete(lesson.id);
      final align = (i % 2 == 0) ? 0.28 : 0.72;
      nodes.add(_MapNodeData(
        emoji: fullyDone ? '✅' : kLessonIslandEmojis[i % kLessonIslandEmojis.length],
        titleFa: lesson.title,
        subtitleFa: 'درس ${lesson.id}',
        current: unlocked ? 1 : 0,
        total: 1,
        align: align,
        decorative: false,
        locked: !unlocked,
        onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => LessonPage(lesson: lesson))),
      ));
    }

    const segmentHeight = 150.0;
    final mapHeight = segmentHeight * nodes.length;

    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('درس‌ها')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            height: mapHeight,
            child: Stack(children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _PathPainter(nodeCount: nodes.length, segmentHeight: segmentHeight, aligns: nodes.map((n) => n.align).toList()),
                ),
              ),
              for (int i = 0; i < nodes.length; i++)
                Positioned(
                  top: i * segmentHeight,
                  left: 0,
                  right: 0,
                  height: segmentHeight,
                  child: Align(
                    alignment: Alignment(nodes[i].align * 2 - 1, 0),
                    child: _MapNodeWidget(data: nodes[i]),
                  ),
                ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class WordsBankPage extends StatefulWidget {
  const WordsBankPage({super.key});
  @override
  State<WordsBankPage> createState() => _WordsBankPageState();
}

class _WordsBankPageState extends State<WordsBankPage> {
  final TextEditingController search = TextEditingController();
  final FlutterTts tts = FlutterTts();
  String query = '';

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
  }

  @override
  Widget build(BuildContext context) {
    final allWords = lessons.expand((l) => l.words).toList();
    final filtered = query.isEmpty
        ? allWords
        : allWords.where((w) => w.word.toLowerCase().contains(query.toLowerCase()) || w.meaning.contains(query)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('بانک کلمات')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              controller: search,
              textDirection: TextDirection.rtl,
              onChanged: (v) => setState(() => query = v),
              decoration: InputDecoration(
                hintText: 'جستجوی کلمه...',
                filled: true,
                fillColor: Colors.white.withOpacity(.06),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('اگه صدا پخش نشد، روی 🔊 دو بار کلیک کن', style: TextStyle(fontSize: 11, color: Colors.white38)),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final w = filtered[i];
                return Card(
                  color: Colors.white.withOpacity(.035),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Text(w.emoji, style: const TextStyle(fontSize: 26)),
                    title: Text(w.word, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('${w.meaning} • ${w.pronunciation}', style: const TextStyle(color: Color(0xFF00E5FF))),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'تصویر ذهنی',
                          onPressed: () {
                            final joke = mnemonics[w.word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '')];
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                backgroundColor: const Color(0xFF10182E),
                                content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    joke ?? 'تصویر ذهنی‌ای برای این کلمه ثبت نشده.',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                ),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('باشه')),
                                ],
                              ),
                            );
                          },
                          icon: const Text('🧠', style: TextStyle(fontSize: 18)),
                        ),
                        IconButton(
                          onPressed: () => tts.speak(w.word),
                          icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ]),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  final int xp, coins, streak;
  const AchievementsPage({super.key, required this.xp, required this.coins, required this.streak});

  @override
  Widget build(BuildContext context) {
    final badges = [
      _Badge('🚀', 'شروع سفر', 'اولین قدم رو برداشتی', true),
      _Badge('⭐', '۵۰۰ امتیاز', 'به ۵۰۰ XP برس', xp >= 500),
      _Badge('🏆', '۱۰۰۰ امتیاز', 'به ۱۰۰۰ XP برس', xp >= 1000),
      _Badge('🔥', '۷ روز متوالی', 'یک هفته پشت‌سرهم تمرین کن', streak >= 7),
      _Badge('🪙', 'کلکسیونر', '۵۰۰ سکه جمع کن', coins >= 500),
      _Badge('👑', 'استاد گرامر', 'همه‌ی درس‌ها رو کامل کن', xp >= lessons.length * 100),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('دستاوردها')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.95,
          children: badges.map((b) => _BadgeCard(badge: b)).toList(),
        ),
      ]),
    );
  }
}

class _Badge {
  final String emoji, title, desc;
  final bool unlocked;
  _Badge(this.emoji, this.title, this.desc, this.unlocked);
}

class _BadgeCard extends StatelessWidget {
  final _Badge badge;
  const _BadgeCard({required this.badge});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(.035),
          border: Border.all(color: (badge.unlocked ? Colors.amber : Colors.white24).withOpacity(.4)),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Opacity(
            opacity: badge.unlocked ? 1 : .3,
            child: Text(badge.emoji, style: const TextStyle(fontSize: 40)),
          ),
          const SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(badge.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 4),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(badge.desc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.white54)),
          ),
          if (!badge.unlocked) ...[
            const SizedBox(height: 6),
            const Icon(Icons.lock_outline_rounded, size: 16, color: Colors.white38),
          ],
        ]),
      );
}

class AdventureMapPage extends StatelessWidget {
  final int xp;
  const AdventureMapPage({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    final totalLessons = lessons.length;
    final completedLessons = (xp ~/ 100).clamp(0, totalLessons);
    final wordsPerLesson = lessons.isNotEmpty ? lessons.first.words.length : 0;
    final questionsPerLesson = lessons.isNotEmpty ? lessons.first.questions.length : 0;
    final totalWords = totalLessons * wordsPerLesson;
    final totalQuestions = totalLessons * questionsPerLesson;
    final learnedWords = completedLessons * wordsPerLesson;
    final answeredQuestions = completedLessons * questionsPerLesson;
    final finalExamUnlocked = completedLessons >= totalLessons;

    final nodes = <_MapNodeData>[
      _MapNodeData(emoji: '🏰', titleFa: 'شروع ماجراجویی', subtitleFa: 'سطح A1', current: 0, total: 0, align: 0.5, decorative: true, locked: false),
      _MapNodeData(emoji: '📘', titleFa: 'گرامر', subtitleFa: '$completedLessons/$totalLessons', current: completedLessons, total: totalLessons, align: 0.28, decorative: false, locked: false,
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => LessonsListPage(xp: xp)))),
      _MapNodeData(emoji: '📚', titleFa: 'کلمات', subtitleFa: '$learnedWords/$totalWords', current: learnedWords, total: totalWords, align: 0.72, decorative: false, locked: false,
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const WordsBankPage()))),
      _MapNodeData(emoji: '🎯', titleFa: 'تمرین', subtitleFa: '$answeredQuestions/$totalQuestions', current: answeredQuestions, total: totalQuestions, align: 0.28, decorative: false, locked: false,
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const PracticeHubPage()))),
      _MapNodeData(emoji: '🎁', titleFa: 'آزمون نهایی', subtitleFa: finalExamUnlocked ? 'آماده‌ی شروع' : '${completedLessons * 100}/${totalLessons * 100}', current: completedLessons, total: totalLessons, align: 0.5, decorative: false, locked: !finalExamUnlocked),
    ];

    const segmentHeight = 170.0;
    final mapHeight = segmentHeight * nodes.length;

    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('نقشه ماجراجویی')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            height: mapHeight,
            child: Stack(children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _PathPainter(nodeCount: nodes.length, segmentHeight: segmentHeight, aligns: nodes.map((n) => n.align).toList()),
                ),
              ),
              for (int i = 0; i < nodes.length; i++)
                Positioned(
                  top: i * segmentHeight,
                  left: 0,
                  right: 0,
                  height: segmentHeight,
                  child: Align(
                    alignment: Alignment(nodes[i].align * 2 - 1, 0),
                    child: _MapNodeWidget(data: nodes[i]),
                  ),
                ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _MapNodeData {
  final String emoji, titleFa, subtitleFa;
  final int current, total;
  final double align; // 0..1 horizontal position fraction
  final bool decorative, locked;
  final void Function(BuildContext)? onTap;
  _MapNodeData({
    required this.emoji,
    required this.titleFa,
    required this.subtitleFa,
    required this.current,
    required this.total,
    required this.align,
    required this.decorative,
    required this.locked,
    this.onTap,
  });
}

class _PathPainter extends CustomPainter {
  final int nodeCount;
  final double segmentHeight;
  final List<double> aligns;
  _PathPainter({required this.nodeCount, required this.segmentHeight, required this.aligns});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(.35)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    for (int i = 0; i < nodeCount; i++) {
      final x = size.width * aligns[i];
      final y = segmentHeight * i + segmentHeight / 2;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevX = size.width * aligns[i - 1];
        final prevY = segmentHeight * (i - 1) + segmentHeight / 2;
        final midY = (prevY + y) / 2;
        path.cubicTo(prevX, midY, x, midY, x, y);
      }
    }

    // draw as dashes
    const dashWidth = 10.0;
    const dashSpace = 8.0;
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final len = dashWidth.clamp(0, metric.length - distance);
        canvas.drawPath(metric.extractPath(distance, distance + len), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PathPainter oldDelegate) => false;
}

class _MapNodeWidget extends StatelessWidget {
  final _MapNodeData data;
  const _MapNodeWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final progress = data.total > 0 ? (data.current / data.total).clamp(0.0, 1.0) : 0.0;
    final size = data.decorative ? 78.0 : 68.0;

    return GestureDetector(
      onTap: data.locked ? null : () => data.onTap?.call(context),
      child: Column(children: [
        Stack(alignment: Alignment.center, children: [
          if (!data.decorative)
            SizedBox(
              width: size + 14,
              height: size + 14,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 4,
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation(data.locked ? Colors.white24 : const Color(0xFF00E5FF)),
              ),
            ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: data.locked
                  ? [Colors.white24, Colors.white12]
                  : [const Color(0xFF0066FF), const Color(0xFF00C8FF)]),
              boxShadow: data.locked ? [] : [BoxShadow(color: const Color(0xFF00C8FF).withOpacity(.35), blurRadius: 20)],
            ),
            child: Center(
              child: data.locked
                  ? const Icon(Icons.lock_rounded, color: Colors.white54, size: 26)
                  : Text(data.emoji, style: const TextStyle(fontSize: 30)),
            ),
          ),
        ]),
        const SizedBox(height: 8),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(data.titleFa, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(data.subtitleFa, style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 11)),
        ),
      ]),
    );
  }
}

class NeonBadge extends StatelessWidget {
  final IconData icon;
  const NeonBadge({super.key, required this.icon});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF07182E),
          border: Border.all(color: const Color(0xFF00D9FF).withOpacity(.45)),
          boxShadow: [BoxShadow(color: const Color(0xFF00D9FF).withOpacity(.15), blurRadius: 20)],
        ),
        child: Icon(icon, color: const Color(0xFF00E5FF)),
      );
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
        tween: Tween(begin: .0, end: 1),
        duration: Duration(milliseconds: 350 + lesson.id * 20),
        builder: (_, v, child) => Opacity(
          opacity: v,
          child: Transform.translate(offset: Offset(0, 16 * (1 - v)), child: child),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 450),
              pageBuilder: (_, a, __) => FadeTransition(
                opacity: a,
                child: LessonPage(lesson: lesson),
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(colors: [Color(0xFF092D4B), Color(0xFF10182E)]),
              border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.28)),
              boxShadow: [BoxShadow(color: const Color(0xFF0066FF).withOpacity(.10), blurRadius: 24)],
            ),
            child: Row(children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 56, height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF00BFFF).withOpacity(.12),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Center(child: Text('${lesson.id}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
              ),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(lesson.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(lesson.subtitle, style: const TextStyle(color: Color(0xFF00E5FF))),
                ),
                const SizedBox(height: 6),
                Text('30 words • examples • quiz', style: const TextStyle(color: Colors.white54, fontSize: 11)),
              ])),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF00E5FF)),
            ]),
          ),
        ),
      );
}

class DailyQuestCard extends StatelessWidget {
  const DailyQuestCard({super.key});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(colors: [Color(0xFF241A0A), Color(0xFF11182A)]),
          border: Border.all(color: Colors.orangeAccent.withOpacity(.25)),
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('🔥 DAILY QUEST', style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: 9),
          Text('Complete one lesson today!', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          Text('+100 XP • +20 Coins', style: TextStyle(color: Colors.white54)),
        ]),
      );
}

class LessonPage extends StatefulWidget {
  final Lesson lesson;
  const LessonPage({super.key, required this.lesson});
  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int tab = 0, score = 0;
  int quizIndex = 0;
  int lives = 3;
  int wrongCount = 0;
  bool feedbackPlayed = false;
  bool rewardClaimed = false;
  String? selectedAnswer;
  final FlutterTts tts = FlutterTts();
  late List<Question> quizQuestions;
  late List<List<String>> shuffledOptions;

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.42);
    _startQuiz();
  }

  // Reshuffles question order AND each question's option order,
  // so the quiz feels different every time it's opened or retried.
  void _startQuiz() {
    quizQuestions = List<Question>.from(widget.lesson.questions)..shuffle();
    shuffledOptions = quizQuestions.map((q) {
      return List<String>.from(q.options)..shuffle();
    }).toList();
  }

  Future<void> _playFeedbackSound(bool passed) async {
    if (passed) {
      SystemSound.play(SystemSoundType.click);
      await tts.speak('Congratulations! Great job!');
    } else {
      SystemSound.play(SystemSoundType.alert);
      await tts.speak('Oops! Let\'s try again.');
    }
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.lesson.title),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Center(child: Text('⭐ $score', style: const TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold))),
            )
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 52,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                _TabButton('Learn', 0),
                _TabButton('Words', 1),
                _TabButton('Examples', 2),
                _TabButton('Practice', 3),
                _TabButton('Quiz', 4),
              ]),
            ),
          ),
          Expanded(child: AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: _content())),
        ]),
      );

  Widget _TabButton(String label, int index) {
    final active = tab == index;
    return GestureDetector(
      onTap: () => setState(() => tab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF00C8FF).withOpacity(.16) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: active ? const Color(0xFF00E5FF).withOpacity(.35) : Colors.transparent),
        ),
        child: Text(label, style: TextStyle(color: active ? const Color(0xFF00E5FF) : Colors.white54, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _content() {
    switch (tab) {
      case 0: return _learn();
      case 1: return _words();
      case 2: return _examples();
      case 3: return _practice();
      default: return _quiz();
    }
  }

  Widget _practice() => Padding(
        key: const ValueKey('practice'),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          _PracticeOptionCard(
            emoji: '🔤',
            titleFa: 'تمرین کلمات این درس',
            subtitleFa: 'بازی ساخت کلمه از روی معنی و تلفظ',
            color: const Color(0xFF00E5A0),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WordBuilderPage(lesson: widget.lesson))),
          ),
          const SizedBox(height: 16),
          _PracticeOptionCard(
            emoji: '📝',
            titleFa: 'تمرین جملات این درس',
            subtitleFa: 'جمله‌ی انگلیسی رو از روی معنی بساز',
            color: const Color(0xFF7C4DFF),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SentenceBuilderPage(lesson: widget.lesson))),
          ),
          const SizedBox(height: 16),
          _PracticeOptionCard(
            emoji: '🎤',
            titleFa: 'تمرین تلفظ کلمات و جملات',
            subtitleFa: 'با میکروفون تلفظت رو ضبط کن و امتیاز بگیر',
            color: const Color(0xFFFF7A59),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PronunciationPracticePage(lesson: widget.lesson))),
          ),
        ]),
      );

  Widget _learn() => ListView(
        key: const ValueKey('learn'),
        padding: const EdgeInsets.all(20),
        children: [
          const Text('MISSION START', style: TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.w900, letterSpacing: 2)),
          const SizedBox(height: 8),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(widget.lesson.subtitle, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          ),
          const SizedBox(height: 16),
          _Panel(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(widget.lesson.explanation, style: const TextStyle(fontSize: 17, height: 1.8)),
            ),
          ),
          const SizedBox(height: 16),
          const Text('FORMULA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          _Panel(child: Text(widget.lesson.formula, style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 18, height: 1.7))),
          const SizedBox(height: 18),
          const _PulseOrb(),
        ],
      );

  Widget _words() => ListView.builder(
        key: const ValueKey('words'),
        padding: const EdgeInsets.all(12),
        itemCount: widget.lesson.words.length,
        itemBuilder: (_, i) {
          final w = widget.lesson.words[i];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 180 + i * 12),
            builder: (_, v, child) => Opacity(opacity: v, child: Transform.translate(offset: Offset(18 * (1 - v), 0), child: child)),
            child: Card(
              color: Colors.white.withOpacity(.035),
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Text(w.emoji, style: const TextStyle(fontSize: 29)),
                title: Text(w.word, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                subtitle: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('${w.meaning}  •  ${w.pronunciation}', style: const TextStyle(color: Color(0xFF00E5FF))),
                ),
                trailing: IconButton(
                  onPressed: () => tts.speak(w.word),
                  icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
                ),
              ),
            ),
          );
        },
      );

  Widget _examples() => ListView(
        key: const ValueKey('examples'),
        padding: const EdgeInsets.all(18),
        children: widget.lesson.examples.asMap().entries.map((e) {
          final parts = e.value.split(' — ');
          final english = parts.isNotEmpty ? parts[0] : e.value;
          final persian = parts.length > 1 ? parts[1] : '';
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.035),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF1E9DFF).withOpacity(.18)),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                onPressed: () => tts.speak(english),
                icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(english, style: const TextStyle(fontSize: 17)),
                  if (persian.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(persian, style: const TextStyle(fontSize: 14, color: Colors.white54)),
                    ),
                  ],
                ]),
              ),
            ]),
          );
        }).toList(),
      );

  Widget _quiz() {
    final total = quizQuestions.length;
    if (quizIndex >= total) return _quizComplete();

    final q = quizQuestions[quizIndex];
    final options = shuffledOptions[quizIndex];

    return Padding(
      key: const ValueKey('quiz'),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: quizIndex / total,
                minHeight: 10,
                backgroundColor: Colors.white12,
                valueColor: const AlwaysStoppedAnimation(Color(0xFF00E5FF)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Row(children: [
            const Icon(Icons.favorite_rounded, color: Colors.redAccent, size: 20),
            const SizedBox(width: 4),
            Text('$lives', style: const TextStyle(fontWeight: FontWeight.bold)),
          ]),
        ]),
        const SizedBox(height: 6),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text('${quizIndex + 1} / $total', style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ),
        const SizedBox(height: 26),
        Text(q.text, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, height: 1.5)),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            children: options.map((opt) {
              final isSelected = selectedAnswer == opt;
              final isCorrect = opt == q.answer;
              Color borderColor = Colors.white24;
              Color? fillColor;
              IconData iconData = Icons.circle_outlined;
              Color iconColor = Colors.white38;
              if (selectedAnswer != null) {
                if (isSelected && isCorrect) {
                  borderColor = Colors.greenAccent;
                  fillColor = Colors.greenAccent.withOpacity(.12);
                  iconData = Icons.check_circle_rounded;
                  iconColor = Colors.greenAccent;
                } else if (isSelected && !isCorrect) {
                  borderColor = Colors.redAccent;
                  fillColor = Colors.redAccent.withOpacity(.12);
                  iconData = Icons.cancel_rounded;
                  iconColor = Colors.redAccent;
                } else if (isCorrect) {
                  borderColor = Colors.greenAccent.withOpacity(.5);
                }
              }
              return GestureDetector(
                onTap: selectedAnswer != null
                    ? null
                    : () {
                        setState(() {
                          selectedAnswer = opt;
                          if (opt == q.answer) {
                            score++;
                          } else {
                            lives = (lives - 1).clamp(0, 3);
                            wrongCount++;
                          }
                        });
                      },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: fillColor ?? Colors.white.withOpacity(.035),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 1.6),
                  ),
                  child: Row(children: [
                    Icon(iconData, color: iconColor),
                    const SizedBox(width: 12),
                    Expanded(child: Text(opt, style: const TextStyle(fontSize: 16))),
                  ]),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: selectedAnswer == null
                ? null
                : () {
                    setState(() {
                      if (wrongCount >= 3) {
                        quizIndex = total; // stop the quiz early — 3 wrong answers reached
                      } else {
                        quizIndex++;
                      }
                      selectedAnswer = null;
                    });
                  },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                (wrongCount >= 3 || quizIndex + 1 >= total) ? 'پایان آزمون' : 'بعدی',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _quizComplete() {
    final passed = wrongCount < 3;

    // Save progress the instant the pass/fail screen appears — not only
    // when the "ادامه" button is tapped, so leaving early never loses it.
    if (!feedbackPlayed) {
      feedbackPlayed = true;
      if (passed) {
        AppState.instance.markActivityComplete(widget.lesson.id, 'quiz');
        AppState.instance.addReward(50, 10);
        rewardClaimed = true;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) => _playFeedbackSound(passed));
    }

    return Stack(
      key: const ValueKey('quizComplete'),
      children: [
        if (passed) Positioned.fill(child: CustomPaint(painter: _ConfettiPainter())),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 700),
                curve: Curves.elasticOut,
                builder: (_, v, child) => Transform.scale(scale: v, child: child),
                child: Text(passed ? '🏆' : '💡', style: const TextStyle(fontSize: 84)),
              ),
              const SizedBox(height: 18),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  passed ? 'تبریک!' : 'اشتباه بود!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: passed ? Colors.amber : Colors.redAccent),
                ),
              ),
              const SizedBox(height: 8),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  passed ? 'درس را با موفقیت کامل کردی' : 'سه سوال رو اشتباه زدی، درس رو مرور کن و دوباره امتحان کن',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 6),
              Text('Score: $score / ${quizQuestions.length}', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 14)),
              const SizedBox(height: 22),
              if (passed)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF241A0A),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.amber.withOpacity(.5)),
                  ),
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('💎', style: TextStyle(fontSize: 22)),
                    SizedBox(width: 8),
                    Text('+50 XP', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.amber)),
                  ]),
                ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: passed
                      ? () => Navigator.of(context).pop()
                      : () {
                          setState(() {
                            quizIndex = 0;
                            score = 0;
                            wrongCount = 0;
                            lives = 3;
                            selectedAnswer = null;
                            feedbackPlayed = false;
                            _startQuiz(); // fresh shuffled order for the retry
                          });
                        },
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      passed ? 'ادامه' : 'تلاش دوباره',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text('بازگشت به درس‌ها', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colors = [Colors.amber, const Color(0xFF00E5FF), Colors.pinkAccent, const Color(0xFF00E5A0), Colors.purpleAccent];
    final rnd = List.generate(40, (i) => i);
    for (final i in rnd) {
      final dx = (size.width * ((i * 37) % 100)) / 100;
      final dy = (size.height * ((i * 53) % 100)) / 100;
      final paint = Paint()..color = colors[i % colors.length].withOpacity(.55);
      final rectSize = 6.0 + (i % 3) * 2;
      canvas.save();
      canvas.translate(dx, dy);
      canvas.rotate((i * 0.4));
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: rectSize, height: rectSize * 1.6), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) => false;
}

class _Panel extends StatelessWidget {
  final Widget child;
  const _Panel({required this.child});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.035),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.18)),
        ),
        child: child,
      );
}

class _PulseOrb extends StatefulWidget {
  const _PulseOrb();
  @override
  State<_PulseOrb> createState() => _PulseOrbState();
}

class _PulseOrbState extends State<_PulseOrb> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  @override
  void dispose() { c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: c,
        builder: (_, __) => Center(
          child: Container(
            width: 70 + c.value * 12,
            height: 70 + c.value * 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF00C8FF).withOpacity(.08),
              border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.45)),
              boxShadow: [BoxShadow(color: const Color(0xFF00C8FF).withOpacity(.22), blurRadius: 30 + c.value * 20)],
            ),
            child: const Icon(Icons.auto_awesome_rounded, color: Color(0xFF00E5FF), size: 32),
          ),
        ),
      );
}

class ProgressPage extends StatelessWidget {
  final int xp;
  const ProgressPage({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    final totalLessons = lessons.length;
    final completedLessons = (xp ~/ 100).clamp(0, totalLessons);
    final wordsPerLesson = lessons.isNotEmpty ? lessons.first.words.length : 0;
    final learnedWords = completedLessons * wordsPerLesson;
    final totalWords = totalLessons * wordsPerLesson;
    final overall = totalLessons > 0 ? completedLessons / totalLessons : 0.0;

    // Illustrative 7-day trend leading up to current overall progress.
    final weekLabels = ['شنبه', 'یکشنبه', 'دوشنبه', 'سه‌شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه'];
    final weekValues = List.generate(7, (i) => (overall * (i + 1) / 7).clamp(0.0, 1.0));

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('آمار و پیشرفت', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFF00E5FF))),
        ),
        const SizedBox(height: 20),

        // Circular percent + stat cards row
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(alignment: Alignment.center, children: [
            SizedBox(
              width: 100, height: 100,
              child: CircularProgressIndicator(
                value: overall,
                strokeWidth: 9,
                backgroundColor: Colors.white12,
                valueColor: const AlwaysStoppedAnimation(Color(0xFF00E5A0)),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('${(overall * 100).round()}%', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                const Text('پیشرفت کلی', style: TextStyle(fontSize: 10, color: Colors.white54)),
              ]),
            ),
          ]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(children: [
              _StatMiniCard(icon: Icons.menu_book_rounded, label: 'درس‌های کامل‌شده', value: '$completedLessons/$totalLessons'),
              const SizedBox(height: 10),
              _StatMiniCard(icon: Icons.style_rounded, label: 'کلمات آموخته‌شده', value: '$learnedWords/$totalWords'),
            ]),
          ),
        ]),
        const SizedBox(height: 24),

        // 7-day trend chart
        Directionality(
          textDirection: TextDirection.rtl,
          child: const Text('پیشرفت در ۷ روز اخیر', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        const SizedBox(height: 10),
        _Panel(
          child: SizedBox(
            height: 140,
            child: CustomPaint(
              size: Size.infinite,
              painter: _TrendChartPainter(values: weekValues),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekLabels.map((d) => Text(d, style: const TextStyle(fontSize: 9, color: Colors.white38))).toList(),
        ),
        const SizedBox(height: 24),

        // Per-lesson performance
        const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('عملکرد در درس‌ها', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        const SizedBox(height: 10),
        ...lessons.map((l) {
          final done = l.id <= completedLessons;
          final value = done ? 1.0 : (l.id == completedLessons + 1 ? 0.0 : 0.0);
          return _LessonProgressRow(title: '${l.id} - ${l.title}', value: value);
        }),
      ],
    );
  }
}

class _StatMiniCard extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _StatMiniCard({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.035),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.15)),
        ),
        child: Row(children: [
          Icon(icon, color: const Color(0xFF00E5FF), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(label, style: const TextStyle(fontSize: 10, color: Colors.white54)),
              ]),
            ),
          ),
        ]),
      );
}

class _TrendChartPainter extends CustomPainter {
  final List<double> values; // 0..1
  _TrendChartPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;
    final linePaint = Paint()
      ..color = const Color(0xFF00E5A0)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF00E5A0).withOpacity(.28), const Color(0xFF00E5A0).withOpacity(0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final stepX = size.width / (values.length - 1);
    final points = <Offset>[
      for (int i = 0; i < values.length; i++) Offset(stepX * i, size.height - values[i] * (size.height - 10) - 5),
    ];

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      final prev = points[i - 1];
      final curr = points[i];
      final midX = (prev.dx + curr.dx) / 2;
      linePath.cubicTo(midX, prev.dy, midX, curr.dy, curr.dx, curr.dy);
    }

    final fillPath = Path.from(linePath)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, linePaint);

    final dotPaint = Paint()..color = const Color(0xFF00E5A0);
    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _TrendChartPainter oldDelegate) => oldDelegate.values != values;
}

class _LessonProgressRow extends StatelessWidget {
  final String title;
  final double value;
  const _LessonProgressRow({required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white.withOpacity(.035), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            Text('${(value * 100).round()}%', style: const TextStyle(fontSize: 12, color: Color(0xFF00E5FF))),
          ]),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(value: value, minHeight: 7, backgroundColor: Colors.white12),
          ),
        ]),
      );
}

// 🔑 کلید API از پنل GapGPT (gapgpt.app):
const String gapgptApiKey = 'sk-ijmrxgC8YKYn7n8TyptKM8cC6SePgl7lzY8VbO68xe3GNKDb';

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage(this.text, this.isUser);
}

class TutorPage extends StatefulWidget {
  const TutorPage({super.key});
  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  final List<ChatMessage> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    final saved = AppStorage.loadChat();
    if (saved.isNotEmpty) {
      messages.addAll(saved);
    } else {
      final name = profileNotifier.value.name;
      messages.add(ChatMessage(
        'سلام $name! من دستیار هوش‌مصنوعی تو برای یادگیری انگلیسی هستم. هر سوالی درباره گرامر، کلمات یا جمله‌سازی داری بپرس!',
        false,
      ));
    }
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty || loading) return;

    setState(() {
      messages.add(ChatMessage(text, true));
      loading = true;
      controller.clear();
    });
    AppStorage.saveChat(messages);
    _scrollToBottom();

    try {
      final studentName = profileNotifier.value.name;
      final url = Uri.parse('https://api.gapgpt.app/v1/chat/completions');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $gapgptApiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'gpt-4o-mini',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a friendly English tutor helping a Persian-speaking A1 student named $studentName. '
                  'Answer briefly and simply, mixing simple English with Persian explanations when helpful.'
            },
            {'role': 'user', 'content': text}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final reply = data['choices'][0]['message']['content'] as String;
        setState(() {
          messages.add(ChatMessage(reply.trim(), false));
        });
      } else {
        setState(() {
          messages.add(ChatMessage('خطا در دریافت پاسخ (کد ${response.statusCode}): ${response.body}', false));
        });
      }
    } catch (e) {
      setState(() {
        messages.add(ChatMessage('خطا: $e', false));
      });
    } finally {
      setState(() => loading = false);
      AppStorage.saveChat(messages);
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tutor'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(14),
              itemCount: messages.length,
              itemBuilder: (_, i) {
                final m = messages[i];
                return Align(
                  alignment: m.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: m.isUser ? const Color(0xFF00C8FF).withOpacity(.18) : Colors.white.withOpacity(.06),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: m.isUser ? const Color(0xFF00E5FF).withOpacity(.4) : Colors.white24,
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(m.text, style: const TextStyle(fontSize: 15, height: 1.5)),
                    ),
                  ),
                );
              },
            ),
          ),
          if (loading)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF00E5FF)),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'سوالت رو بپرس...',
                      filled: true,
                      fillColor: Colors.white.withOpacity(.06),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: loading ? null : sendMessage,
                  icon: const Icon(Icons.send_rounded, color: Color(0xFF00E5FF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final int xp;
  const ProfilePage({super.key, required this.xp});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameCtrl;
  late String selectedAvatar;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: profileNotifier.value.name);
    selectedAvatar = profileNotifier.value.avatar;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final name = nameCtrl.text.trim();
    profileNotifier.value = UserProfile(
      name: name.isEmpty ? 'کاربر' : name,
      avatar: selectedAvatar,
    );
    setState(() => saved = true);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('پروفایل من')),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          const NeonBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [Color(0xFF0066FF), Color(0xFF00C8FF)]),
                    boxShadow: [BoxShadow(color: const Color(0xFF00C8FF).withOpacity(.35), blurRadius: 24)],
                  ),
                  alignment: Alignment.center,
                  child: Text(selectedAvatar, style: const TextStyle(fontSize: 50)),
                ),
                const SizedBox(height: 10),
                Text('${medalForXp(widget.xp)}  ${widget.xp} XP', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 26),

                Align(alignment: Alignment.centerRight, child: const Text('اسمت رو انتخاب کن', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                const SizedBox(height: 10),
                TextField(
                  controller: nameCtrl,
                  textDirection: TextDirection.rtl,
                  onChanged: (_) => setState(() => saved = false),
                  decoration: InputDecoration(
                    hintText: 'اسم خودت رو بنویس',
                    filled: true,
                    fillColor: Colors.white.withOpacity(.06),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 26),

                Align(alignment: Alignment.centerRight, child: const Text('یه آواتار انتخاب کن', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: kAvatarOptions.map((a) {
                    final selected = a == selectedAvatar;
                    return GestureDetector(
                      onTap: () => setState(() {
                        selectedAvatar = a;
                        saved = false;
                      }),
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected ? const Color(0xFF00C8FF).withOpacity(.25) : Colors.white.withOpacity(.05),
                          border: Border.all(color: selected ? const Color(0xFF00E5FF) : Colors.white24, width: selected ? 2.4 : 1.2),
                        ),
                        alignment: Alignment.center,
                        child: Text(a, style: const TextStyle(fontSize: 26)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: Text(saved ? 'ذخیره شد ✅' : 'ذخیره‌ی پروفایل', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      );
}

// ============================================================
// PRACTICE HUB — تمرین کلمات و جملات (separate from Lessons/Quiz)
// ============================================================

class PracticeHubPage extends StatelessWidget {
  const PracticeHubPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('تمرین')),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          const NeonBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              _PracticeOptionCard(
                emoji: '🔤',
                titleFa: 'تمرین کلمات',
                subtitleFa: 'بازی ساخت کلمه از روی معنی و تلفظ',
                color: const Color(0xFF00E5A0),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WordBuilderPage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '📝',
                titleFa: 'تمرین جملات',
                subtitleFa: 'جمله‌ی انگلیسی رو از روی معنی بساز',
                color: const Color(0xFF7C4DFF),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SentenceBuilderPage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '🎧',
                titleFa: 'تمرین شنیداری',
                subtitleFa: 'فقط صدا رو بشنو و معنی رو انتخاب کن',
                color: const Color(0xFF29B6F6),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ListeningPracticePage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '⌨️',
                titleFa: 'ترجمه‌ی معکوس',
                subtitleFa: 'معنی فارسی رو ببین، کلمه‌ی انگلیسی رو تایپ کن',
                color: const Color(0xFFFFB300),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReverseRecallPage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '📖',
                titleFa: 'داستان زنجیره‌ای',
                subtitleFa: 'با چند کلمه‌ی تصادفی یک داستان کوتاه بساز',
                color: const Color(0xFF66BB6A),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChainStoryPage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '⚡',
                titleFa: 'دوئل سریع',
                subtitleFa: 'درس‌ها رو انتخاب کن و ۶۰ ثانیه مسابقه بده',
                color: const Color(0xFFEF5350),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LessonPickerForDuelPage())),
              ),
              const SizedBox(height: 16),
              _PracticeOptionCard(
                emoji: '📓',
                titleFa: 'دفترچه‌ی اشتباهات',
                subtitleFa: 'مرور کلماتی که قبلاً اشتباه زدی',
                color: const Color(0xFFAB47BC),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MistakeNotebookPage())),
              ),
            ]),
          ),
        ]),
      );
}

class _PracticeOptionCard extends StatelessWidget {
  final String emoji, titleFa, subtitleFa;
  final Color color;
  final VoidCallback onTap;
  const _PracticeOptionCard({
    required this.emoji,
    required this.titleFa,
    required this.subtitleFa,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [color.withOpacity(.18), const Color(0xFF10182E)]),
            border: Border.all(color: color.withOpacity(.35)),
          ),
          child: Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 40)),
            const SizedBox(width: 16),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(titleFa, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitleFa, style: const TextStyle(fontSize: 12, color: Colors.white54)),
                ]),
              ),
            ),
            const Icon(Icons.chevron_left_rounded, color: Colors.white38),
          ]),
        ),
      );
}

// --- Word building game: shows meaning + pronunciation, user taps
// scrambled letters in order to spell the English word. ---
class WordBuilderPage extends StatefulWidget {
  final Lesson? lesson;
  const WordBuilderPage({super.key, this.lesson});
  @override
  State<WordBuilderPage> createState() => _WordBuilderPageState();
}

class _WordBuilderPageState extends State<WordBuilderPage> {
  late List<Word> pool;
  int round = 0;
  int correctCount = 0;
  final FlutterTts tts = FlutterTts();
  List<String> letters = [];
  List<int> pickedIndexes = [];
  bool? isCorrect;

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.42);
    pool = widget.lesson != null
        ? (List<Word>.from(widget.lesson!.words)..shuffle())
        : (lessons.expand((l) => l.words).toList()..shuffle());
    if (pool.length > 12) pool = pool.sublist(0, 12);
    if (pool.isNotEmpty) _setupRound();
  }

  void _setupRound() {
    isCorrect = null;
    pickedIndexes = [];
    final word = current.word.toUpperCase();
    final shuffled = word.split('')..shuffle(Random());
    if (shuffled.join() == word && shuffled.length > 1) {
      final tmp = shuffled.removeAt(0);
      shuffled.add(tmp);
    }
    letters = shuffled;
  }

  Word get current => pool[round];

  void _pick(int i) {
    if (isCorrect != null || pickedIndexes.contains(i)) return;
    setState(() => pickedIndexes.add(i));
    final built = pickedIndexes.map((idx) => letters[idx]).join();
    if (built.length == current.word.length) {
      final correct = built.toUpperCase() == current.word.toUpperCase();
      setState(() => isCorrect = correct);
      if (correct) correctCount++;
    }
  }

  void _removeLast() {
    if (isCorrect != null || pickedIndexes.isEmpty) return;
    setState(() => pickedIndexes.removeLast());
  }

  void _next() {
    if (round + 1 >= pool.length) {
      if (widget.lesson != null) {
        AppState.instance.markActivityComplete(widget.lesson!.id, 'words');
        AppState.instance.addReward(20, 5);
      }
      Navigator.pop(context);
      return;
    }
    setState(() => round++);
    _setupRound();
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pool.isEmpty) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Stack(children: [
          const NeonBackground(),
          const Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('برای این درس کلمه‌ای ثبت نشده', style: TextStyle(color: Colors.white54)),
            ),
          ),
        ]),
      );
    }
    final built = pickedIndexes.map((idx) => letters[idx]).join();
    return Scaffold(
      appBar: AppBar(
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text('ساخت کلمه  •  ${round + 1}/${pool.length}'),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(current.emoji, style: const TextStyle(fontSize: 50)),
            const SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(current.meaning, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 6),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(current.pronunciation, style: const TextStyle(color: Colors.white54, fontSize: 14)),
              IconButton(
                onPressed: () => tts.speak(current.word),
                icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
              ),
            ]),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text('اگه صدا پخش نشد، روی آیکون دوبار کلیک کن', style: TextStyle(fontSize: 11, color: Colors.white38)),
            ),
            const SizedBox(height: 26),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCorrect == null ? Colors.white24 : (isCorrect! ? Colors.greenAccent : Colors.redAccent),
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(built, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 3)),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: List.generate(letters.length, (i) {
                final used = pickedIndexes.contains(i);
                return GestureDetector(
                  onTap: () => _pick(i),
                  child: Opacity(
                    opacity: used ? 0.25 : 1,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10182E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.4)),
                      ),
                      alignment: Alignment.center,
                      child: Text(letters[i], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 14),
            if (isCorrect == null && pickedIndexes.isNotEmpty)
              TextButton(onPressed: _removeLast, child: const Text('حذف آخرین حرف')),
            if (isCorrect != null) ...[
              const SizedBox(height: 6),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  isCorrect! ? '✅ آفرین، درست بود!' : '❌ درست نبود، کلمه‌ی درست: ${current.word}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isCorrect! ? Colors.greenAccent : Colors.redAccent),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(round + 1 >= pool.length ? 'پایان' : 'بعدی', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ]),
        ),
      ]),
    );
  }
}

// --- Sentence building game: shows the Persian meaning, user taps
// scrambled English words in order to build the sentence. ---
class SentenceBuilderPage extends StatefulWidget {
  final Lesson? lesson;
  const SentenceBuilderPage({super.key, this.lesson});
  @override
  State<SentenceBuilderPage> createState() => _SentenceBuilderPageState();
}

class _SentenceBuilderPageState extends State<SentenceBuilderPage> {
  late List<String> englishSentences;
  late List<String> persianMeanings;
  int round = 0;
  final FlutterTts tts = FlutterTts();
  List<String> wordChips = [];
  List<int> pickedIndexes = [];
  bool? isCorrect;

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.4);
    final allExamples = widget.lesson != null
        ? (List<String>.from(widget.lesson!.examples)..shuffle())
        : (lessons.expand((l) => l.examples).toList()..shuffle());
    final limited = allExamples.length > 10 ? allExamples.sublist(0, 10) : allExamples;
    englishSentences = [];
    persianMeanings = [];
    for (final ex in limited) {
      final parts = ex.split(' — ');
      englishSentences.add(parts.isNotEmpty ? parts[0] : ex);
      persianMeanings.add(parts.length > 1 ? parts[1] : '');
    }
    if (englishSentences.isNotEmpty) _setupRound();
  }

  void _setupRound() {
    isCorrect = null;
    pickedIndexes = [];
    final clean = englishSentences[round].replaceAll('.', '').trim();
    final shuffled = clean.split(' ')..shuffle(Random());
    if (shuffled.join(' ') == clean && shuffled.length > 1) {
      final tmp = shuffled.removeAt(0);
      shuffled.add(tmp);
    }
    wordChips = shuffled;
  }

  void _pick(int i) {
    if (isCorrect != null || pickedIndexes.contains(i)) return;
    setState(() => pickedIndexes.add(i));
    if (pickedIndexes.length == wordChips.length) {
      final built = pickedIndexes.map((idx) => wordChips[idx]).join(' ');
      final target = englishSentences[round].replaceAll('.', '').trim();
      final correct = built.toLowerCase() == target.toLowerCase();
      setState(() => isCorrect = correct);
    }
  }

  void _removeLast() {
    if (isCorrect != null || pickedIndexes.isEmpty) return;
    setState(() => pickedIndexes.removeLast());
  }

  void _next() {
    if (round + 1 >= englishSentences.length) {
      if (widget.lesson != null) {
        AppState.instance.markActivityComplete(widget.lesson!.id, 'sentences');
        AppState.instance.addReward(20, 5);
      }
      Navigator.pop(context);
      return;
    }
    setState(() => round++);
    _setupRound();
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (englishSentences.isEmpty) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Stack(children: [
          const NeonBackground(),
          const Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('برای این درس جمله‌ای ثبت نشده', style: TextStyle(color: Colors.white54)),
            ),
          ),
        ]),
      );
    }
    final built = pickedIndexes.map((idx) => wordChips[idx]).join(' ');
    return Scaffold(
      appBar: AppBar(
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text('ساخت جمله  •  ${round + 1}/${englishSentences.length}'),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(persianMeanings[round], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 6),
            IconButton(
              onPressed: () => tts.speak(englishSentences[round]),
              icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text('اگه صدا پخش نشد، روی آیکون دوبار کلیک کن', style: TextStyle(fontSize: 11, color: Colors.white38)),
            ),
            const SizedBox(height: 18),
            Container(
              constraints: const BoxConstraints(minHeight: 60),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCorrect == null ? Colors.white24 : (isCorrect! ? Colors.greenAccent : Colors.redAccent),
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(built, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: List.generate(wordChips.length, (i) {
                final used = pickedIndexes.contains(i);
                return GestureDetector(
                  onTap: () => _pick(i),
                  child: Opacity(
                    opacity: used ? 0.25 : 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10182E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.4)),
                      ),
                      child: Text(wordChips[i], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 14),
            if (isCorrect == null && pickedIndexes.isNotEmpty)
              TextButton(onPressed: _removeLast, child: const Text('حذف آخرین کلمه')),
            if (isCorrect != null) ...[
              const SizedBox(height: 6),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  isCorrect! ? '✅ عالی بود!' : '❌ جمله‌ی درست: ${englishSentences[round]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isCorrect! ? Colors.greenAccent : Colors.redAccent),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(round + 1 >= englishSentences.length ? 'پایان' : 'بعدی', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ]),
        ),
      ]),
    );
  }
}

// ============================================================
// ENGLISH JOURNAL — ✍️ دفتر انگلیسی من
// ============================================================

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});
  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final List<JournalEntry> entries = [];

  @override
  void initState() {
    super.initState();
    entries.addAll(AppStorage.loadJournal());
  }

  void _persist() => AppStorage.saveJournal(entries);

  void _openEditor({JournalEntry? existing, int? index}) {
    final titleCtrl = TextEditingController(text: existing?.title ?? '');
    final contentCtrl = TextEditingController(text: existing?.content ?? '');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0B1226),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom, left: 18, right: 18, top: 18),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(existing == null ? 'نوشته‌ی جدید' : 'ویرایش نوشته', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: 14),
            TextField(
              controller: titleCtrl,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'عنوان (مثلا: روز من)',
                filled: true,
                fillColor: Colors.white.withOpacity(.06),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentCtrl,
              maxLines: 6,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                hintText: 'Write in English here...',
                filled: true,
                fillColor: Colors.white.withOpacity(.06),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (contentCtrl.text.trim().isEmpty) return;
                  setState(() {
                    final entry = JournalEntry(
                      title: titleCtrl.text.trim().isEmpty ? 'بدون عنوان' : titleCtrl.text.trim(),
                      content: contentCtrl.text.trim(),
                      date: DateTime.now(),
                    );
                    if (index != null) {
                      entries[index] = entry;
                    } else {
                      entries.insert(0, entry);
                    }
                  });
                  _persist();
                  Navigator.pop(ctx);
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('ذخیره', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }

  void _delete(int index) {
    setState(() => entries.removeAt(index));
    _persist();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('دفتر انگلیسی من')),
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _openEditor(),
          icon: const Icon(Icons.edit_rounded),
          label: const Directionality(textDirection: TextDirection.rtl, child: Text('نوشته‌ی جدید')),
        ),
        body: Stack(children: [
          const NeonBackground(),
          entries.isEmpty
              ? Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
                      Text('📓', style: TextStyle(fontSize: 60)),
                      SizedBox(height: 12),
                      Text('هنوز چیزی ننوشتی', style: TextStyle(fontSize: 16, color: Colors.white54)),
                      SizedBox(height: 4),
                      Text('با دکمه‌ی پایین اولین نوشته‌ات رو به انگلیسی بنویس', style: TextStyle(fontSize: 12, color: Colors.white38)),
                    ]),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                  itemCount: entries.length,
                  itemBuilder: (_, i) {
                    final e = entries[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.035),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.18)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(e.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _openEditor(existing: e, index: i),
                            icon: const Icon(Icons.edit_outlined, size: 18, color: Colors.white54),
                          ),
                          IconButton(
                            onPressed: () => _delete(i),
                            icon: const Icon(Icons.delete_outline_rounded, size: 18, color: Colors.white54),
                          ),
                        ]),
                        const SizedBox(height: 6),
                        Text(e.content, style: const TextStyle(fontSize: 14, height: 1.5)),
                        const SizedBox(height: 8),
                        Text('${e.date.year}/${e.date.month}/${e.date.day}', style: const TextStyle(fontSize: 10, color: Colors.white38)),
                      ]),
                    );
                  },
                ),
        ]),
      );
}

// ============================================================
// FRIEND CHAT — 💬 چت با رفیق (پیام‌ها با استفاده از سرویس رایگان
// ntfy.sh رد و بدل میشن. برای اینکه فقط تو و رفیقت پیام‌ها رو ببینید،
// یه اسم اتاق خاص و طولانی انتخاب کنید — این یعنی امنیت واقعی/رمزنگاری
// نداره، فقط تا وقتی کسی اسم اتاق رو حدس نزنه خصوصیه.
// ============================================================

class FriendMessage {
  final String sender;
  final String text;
  final int time;
  final bool locked; // true if this message couldn't be decrypted (wrong/missing passphrase)
  FriendMessage({required this.sender, required this.text, required this.time, this.locked = false});
}

class FriendChatPage extends StatefulWidget {
  const FriendChatPage({super.key});
  @override
  State<FriendChatPage> createState() => _FriendChatPageState();
}

class _FriendChatPageState extends State<FriendChatPage> {
  String? roomCode;
  String? secret;
  final List<FriendMessage> messages = [];
  final TextEditingController textCtrl = TextEditingController();
  final TextEditingController roomCtrl = TextEditingController();
  final TextEditingController secretCtrl = TextEditingController();
  final ScrollController scrollCtrl = ScrollController();
  Timer? pollTimer;
  bool sending = false;
  bool obscureSecret = true;

  @override
  void initState() {
    super.initState();
    roomCode = AppStorage.loadRoomCode();
    if (roomCode != null) {
      secret = AppStorage.loadSecret(roomCode!);
      messages.addAll(AppStorage.loadFriendChat(roomCode!));
      if (secret != null) _startPolling();
    }
  }

  @override
  void dispose() {
    pollTimer?.cancel();
    textCtrl.dispose();
    roomCtrl.dispose();
    secretCtrl.dispose();
    super.dispose();
  }

  void _joinRoom(String code, String pass) {
    final trimmedRoom = code.trim();
    final trimmedPass = pass.trim();
    if (trimmedRoom.isEmpty || trimmedPass.isEmpty) return;
    setState(() {
      roomCode = trimmedRoom;
      secret = trimmedPass;
      messages.clear();
      messages.addAll(AppStorage.loadFriendChat(trimmedRoom));
    });
    AppStorage.saveRoomCode(trimmedRoom);
    AppStorage.saveSecret(trimmedRoom, trimmedPass);
    _startPolling();
  }

  void _leaveRoom() {
    pollTimer?.cancel();
    setState(() {
      roomCode = null;
      secret = null;
      messages.clear();
    });
  }

  void _startPolling() {
    pollTimer?.cancel();
    _poll();
    pollTimer = Timer.periodic(const Duration(seconds: 4), (_) => _poll());
  }

  Future<void> _poll() async {
    if (roomCode == null || secret == null) return;
    try {
      final since = AppStorage.getLastSeenTime(roomCode!);
      final url = Uri.parse('https://ntfy.sh/$roomCode/json?poll=1&since=$since');
      final response = await http.get(url);
      if (response.statusCode != 200) return;

      final lines = utf8.decode(response.bodyBytes).trim().split('\n').where((l) => l.trim().isNotEmpty);
      int maxTime = since;
      bool added = false;

      for (final line in lines) {
        final data = jsonDecode(line);
        if (data['event'] != 'message') continue;
        final time = (data['time'] as num).toInt();
        if (time > maxTime) maxTime = time;

        final raw = data['message'] as String? ?? '';
        final decoded = decryptChatPayload(secret!, raw);
        final sender = decoded != null ? (decoded['sender'] ?? 'دوست') as String : 'نامشخص';
        final text = decoded != null ? (decoded['text'] ?? '') as String : '🔒 پیام رمزگذاری‌شده (رمز فعلی بازش نمی‌کنه)';

        final exists = messages.any((m) => m.time == time);
        if (!exists) {
          messages.add(FriendMessage(sender: sender, text: text, time: time, locked: decoded == null));
          added = true;
        }
      }

      if (added) {
        messages.sort((a, b) => a.time.compareTo(b.time));
        setState(() {});
        AppStorage.saveFriendChat(roomCode!, messages);
        _scrollToBottom();
      }
      if (maxTime > since) AppStorage.saveLastSeenTime(roomCode!, maxTime);
    } catch (_) {
      // network hiccup — will just retry on the next poll tick
    }
  }

  Future<void> _send() async {
    final text = textCtrl.text.trim();
    if (text.isEmpty || roomCode == null || secret == null || sending) return;
    setState(() => sending = true);
    final name = profileNotifier.value.name.isEmpty ? 'من' : profileNotifier.value.name;
    try {
      final encrypted = encryptChatPayload(secret!, {'sender': name, 'text': text});
      await http.post(
        Uri.parse('https://ntfy.sh/$roomCode'),
        body: utf8.encode(encrypted),
      );
      textCtrl.clear();
      await _poll();
    } catch (_) {
    } finally {
      if (mounted) setState(() => sending = false);
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollCtrl.hasClients) {
        scrollCtrl.animateTo(
          scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (roomCode == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('چت با رفیق')),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          const NeonBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('🔒', style: TextStyle(fontSize: 60)),
                  const SizedBox(height: 16),
                  const Text('چت رمزگذاری‌شده با رفیقت', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'یه اسم اتاق و یه رمز مشترک انتخاب کن و همون دو تا رو به رفیقت بده. پیام‌ها فقط با این رمز باز میشن؛ حتی سرورِ واسطه هم نمی‌تونه بخونتشون.',
                    style: TextStyle(fontSize: 12, color: Colors.white54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: roomCtrl,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'اسم اتاق (مثلا: ali_sara_room)',
                      filled: true,
                      fillColor: Colors.white.withOpacity(.06),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: secretCtrl,
                    obscureText: obscureSecret,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'رمز مشترک (فقط بین شما دوتا)',
                      filled: true,
                      fillColor: Colors.white.withOpacity(.06),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: Icon(obscureSecret ? Icons.visibility_off_rounded : Icons.visibility_rounded, size: 20, color: Colors.white38),
                        onPressed: () => setState(() => obscureSecret = !obscureSecret),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('⚠️ رمز رو فقط حضوری یا از یه راه امن به رفیقت بده، نه توی همین چت', style: TextStyle(fontSize: 10, color: Colors.orangeAccent)),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _joinRoom(roomCtrl.text, secretCtrl.text),
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      child: const Text('ورود به اتاق', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      );
    }

    final myName = profileNotifier.value.name.isEmpty ? 'من' : profileNotifier.value.name;

    return Scaffold(
      appBar: AppBar(
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.lock_rounded, size: 16, color: Color(0xFF00E5A0)),
            const SizedBox(width: 6),
            Text('چت • $roomCode'),
          ]),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: _leaveRoom, icon: const Icon(Icons.logout_rounded)),
        ],
      ),
      body: Stack(children: [
        const NeonBackground(),
        Column(children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
                        Text('👋', style: TextStyle(fontSize: 50)),
                        SizedBox(height: 10),
                        Text('هنوز پیامی نیست، اولین پیام رو بفرست', style: TextStyle(color: Colors.white54, fontSize: 13)),
                      ]),
                    ),
                  )
                : ListView.builder(
                    controller: scrollCtrl,
                    padding: const EdgeInsets.all(14),
                    itemCount: messages.length,
                    itemBuilder: (_, i) {
                      final m = messages[i];
                      final isMe = !m.locked && m.sender == myName;
                      return Align(
                        alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .72),
                          decoration: BoxDecoration(
                            color: m.locked
                                ? Colors.redAccent.withOpacity(.08)
                                : (isMe ? const Color(0xFF00C8FF).withOpacity(.18) : Colors.white.withOpacity(.06)),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: m.locked
                                  ? Colors.redAccent.withOpacity(.3)
                                  : (isMe ? const Color(0xFF00E5FF).withOpacity(.4) : Colors.white24),
                            ),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              if (!isMe && !m.locked)
                                Text(m.sender, style: const TextStyle(fontSize: 11, color: Color(0xFF00E5FF), fontWeight: FontWeight.bold)),
                              Text(m.text, style: TextStyle(fontSize: 14, color: m.locked ? Colors.white54 : Colors.white)),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: textCtrl,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: 'پیام بنویس...',
                    filled: true,
                    fillColor: Colors.white.withOpacity(.06),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onSubmitted: (_) => _send(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: sending ? null : _send,
                icon: sending
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.send_rounded, color: Color(0xFF00E5FF)),
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}
