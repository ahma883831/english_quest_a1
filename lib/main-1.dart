import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const EnglishQuest());

class EnglishQuest extends StatelessWidget {
  const EnglishQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int xp = 120;
  int coins = 350;
  int streak = 7;

  void reward() => setState(() {
        xp += 100;
        coins += 20;
      });

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(xp: xp, coins: coins, streak: streak, onReward: reward),
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
                  child: Row(children: [
                    const NeonBadge(icon: Icons.person),
                    const SizedBox(width: 14),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('احمد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('$xp XP • $coins سکه', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    ]),
                  ]),
                ),
                const Divider(color: Colors.white12),
                _drawerItem(context, Icons.menu_book_rounded, 'همه‌ی درس‌ها', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LessonsListPage(onReward: () {})));
                }),
                _drawerItem(context, Icons.style_rounded, 'بانک کلمات', () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const WordsBankPage()));
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
  final VoidCallback onReward;
  const HomePage({super.key, required this.xp, required this.coins, required this.streak, required this.onReward});

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

        // Avatar + level
        Center(
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
                child: const Icon(Icons.person_rounded, size: 46, color: Colors.white),
              ),
            ]),
            const SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text('سطح شما: A$level', style: const TextStyle(fontSize: 15, color: Colors.white70)),
            ),
          ]),
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonsListPage(onReward: onReward))),
            ),
            MenuCard(
              icon: Icons.fitness_center_rounded,
              titleFa: 'تمرین',
              subtitleFa: 'تمرین و آزمون',
              color: const Color(0xFF7C4DFF),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonsListPage(onReward: onReward))),
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
      ],
    );
  }
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

class LessonsListPage extends StatelessWidget {
  final VoidCallback onReward;
  const LessonsListPage({super.key, required this.onReward});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('درس‌ها')),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          const NeonBackground(),
          ListView(
            padding: const EdgeInsets.all(18),
            children: lessons.map((lesson) => LessonCard(lesson: lesson, onReward: onReward)).toList(),
          ),
        ]),
      );
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
                    trailing: IconButton(
                      onPressed: () => tts.speak(w.word),
                      icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
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
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => LessonsListPage(onReward: () {})))),
      _MapNodeData(emoji: '📚', titleFa: 'کلمات', subtitleFa: '$learnedWords/$totalWords', current: learnedWords, total: totalWords, align: 0.72, decorative: false, locked: false,
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const WordsBankPage()))),
      _MapNodeData(emoji: '🎯', titleFa: 'تمرین', subtitleFa: '$answeredQuestions/$totalQuestions', current: answeredQuestions, total: totalQuestions, align: 0.28, decorative: false, locked: false,
          onTap: (ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (_) => LessonsListPage(onReward: () {})))),
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
  final VoidCallback onReward;
  const LessonCard({super.key, required this.lesson, required this.onReward});

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
                child: LessonPage(lesson: lesson, onReward: onReward),
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
  final VoidCallback onReward;
  const LessonPage({super.key, required this.lesson, required this.onReward});
  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int tab = 0, score = 0;
  final Set<int> answered = {};
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.42);
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
                _TabButton('Quiz', 3),
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
      default: return _quiz();
    }
  }

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

  Widget _quiz() => ListView(
        key: const ValueKey('quiz'),
        padding: const EdgeInsets.all(18),
        children: [
          _Panel(child: Row(children: [
            const Icon(Icons.emoji_events_rounded, color: Colors.amber),
            const SizedBox(width: 10),
            Text('Score: $score / ${widget.lesson.questions.length}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(height: 12),
          ...widget.lesson.questions.asMap().entries.map((e) {
            final i = e.key; final q = e.value; final done = answered.contains(i);
            return Card(
              color: Colors.white.withOpacity(.035),
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${i + 1}. ${q.text}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(spacing: 7, runSpacing: 7, children: q.options.map((a) => OutlinedButton(
                    onPressed: done ? null : () {
                      final ok = a == q.answer;
                      setState(() { answered.add(i); if (ok) score++; });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? '✅ Correct!' : '❌ Answer: ${q.answer}')));
                    },
                    child: Text(a),
                  )).toList()),
                ]),
              ),
            );
          }),
          const SizedBox(height: 6),
          ElevatedButton.icon(
            onPressed: () {
              widget.onReward();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('🎉 Lesson completed! +100 XP • +20 Coins')));
            },
            icon: const Icon(Icons.bolt_rounded),
            label: const Padding(padding: EdgeInsets.all(12), child: Text('COMPLETE LESSON', style: TextStyle(fontWeight: FontWeight.w900))),
          ),
        ],
      );
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
    final level = xp ~/ 100 + 1;
    final p = (xp % 100) / 100;
    return ListView(padding: const EdgeInsets.all(20), children: [
      const Text('YOUR PROGRESS', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF00E5FF))),
      const SizedBox(height: 20),
      _Panel(child: Column(children: [
        Text('LEVEL $level', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
        const SizedBox(height: 16),
        ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: p, minHeight: 13)),
        const SizedBox(height: 10),
        Text('$xp XP total'),
      ])),
      const SizedBox(height: 16),
      _ProgressRow(label: 'Grammar', value: p),
      _ProgressRow(label: 'Vocabulary', value: (p * .8).clamp(0, 1)),
      _ProgressRow(label: 'Quiz', value: (p * .65).clamp(0, 1)),
    ]);
  }
}

class _ProgressRow extends StatelessWidget {
  final String label;
  final double value;
  const _ProgressRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(.035), borderRadius: BorderRadius.circular(18)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))), Text('${(value * 100).round()}%')]),
          const SizedBox(height: 8),
          ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: value, minHeight: 8)),
        ]),
      );
}

class TutorPage extends StatelessWidget {
  const TutorPage({super.key});
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.auto_awesome_rounded, size: 82, color: Color(0xFF00E5FF)),
            const SizedBox(height: 18),
            const Text('AI TUTOR', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF00E5FF))),
            const SizedBox(height: 12),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text('اینجا می‌توانیم بعداً مکالمه، تمرین تلفظ و چت آموزشی را اضافه کنیم.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.6)),
            ),
          ]),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  final int xp;
  const ProfilePage({super.key, required this.xp});
  @override
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const NeonBadge(icon: Icons.person),
          const SizedBox(height: 18),
          const Text('ENGLISH QUEST PLAYER', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text('$xp XP', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 18)),
        ]),
      );
}
