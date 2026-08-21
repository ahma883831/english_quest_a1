
import 'package:flutter/material.dart';

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

class Word {
  final String word, meaning, pronunciation, emoji;
  const Word(this.word, this.meaning, this.pronunciation, this.emoji);
}

class Question {
  final String text;
  final List<String> options;
  final String answer;
  const Question(this.text, this.options, this.answer);
}

class Lesson {
  final int id;
  final String title, subtitle, explanation, formula;
  final List<Word> words;
  final List<String> examples;
  final List<Question> questions;

  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.explanation,
    required this.formula,
    required this.words,
    required this.examples,
    required this.questions,
  });
}

const baseWords = <Word>[
  Word('happy','خوشحال','HA-pee','😊'),
  Word('sad','غمگین','sad','😢'),
  Word('student','دانش‌آموز','STOO-dent','🎓'),
  Word('teacher','معلم','TEE-cher','👨‍🏫'),
  Word('friend','دوست','frend','🤝'),
  Word('family','خانواده','FAM-uh-lee','👨‍👩‍👧'),
  Word('home','خانه','hohm','🏠'),
  Word('school','مدرسه','skool','🏫'),
  Word('city','شهر','SIT-ee','🌆'),
  Word('country','کشور','KUN-tree','🌍'),
  Word('young','جوان','yung','🧑'),
  Word('old','پیر / قدیمی','ohld','🕰️'),
  Word('good','خوب','good','👍'),
  Word('bad','بد','bad','👎'),
  Word('busy','مشغول','BIZ-ee','⏰'),
  Word('tired','خسته','TY-erd','😴'),
  Word('ready','آماده','RED-ee','🚀'),
  Word('right','درست','rite','✅'),
  Word('wrong','غلط','rong','❌'),
  Word('here','اینجا','heer','📍'),
  Word('there','آنجا','thair','📍'),
  Word('from','از','frum','🧭'),
  Word('name','نام','naym','🏷️'),
  Word('age','سن','ayj','🎂'),
  Word('nice','دلپذیر','nise','✨'),
  Word('kind','مهربان','kynd','❤️'),
  Word('strong','قوی','strong','💪'),
  Word('smart','باهوش','smart','🧠'),
  Word('late','دیر','layt','🌙'),
  Word('early','زود','ER-lee','🌅'),
];

const lessonTitles = <String>[
  'Verb To Be',
  'Personal Pronouns',
  'A / An',
  'Plural Nouns',
  'This / That',
  'Possessive Adjectives',
  'Have / Has',
  'There Is / There Are',
  'Prepositions',
  'Can / Can’t',
  'Question Words',
  'Present Simple',
  'Adverbs of Frequency',
  'How Often',
  'Present Continuous',
  'Simple Past',
  'Past Time Expressions',
  'Was / Were',
  'Going To',
  'Will',
  'Countable / Uncountable',
  'Some / Any',
  'Much / Many',
  'Comparatives',
  'Superlatives',
  'Must / Mustn’t',
  'Have To',
  'Present Perfect',
  'Ever / Never / Yet',
  'First Conditional',
];

const lessonSubtitles = <String>[
  'am • is • are',
  'I • you • he • she • we • they',
  'Articles',
  'book → books',
  'near and far',
  'my • your • his • her',
  'I have • she has',
  'Places and things',
  'in • on • under',
  'ability and permission',
  'what • where • when • why',
  'daily routines',
  'always • usually • never',
  'frequency questions',
  'now and around now',
  'finished actions',
  'yesterday • last week',
  'was • were',
  'future plans',
  'future predictions',
  'things we can count',
  'positive and negative quantities',
  'how much / how many',
  'bigger • faster • better',
  'the biggest • the best',
  'rules and necessity',
  'obligation',
  'life experience',
  'ever • never • just • yet',
  'if + present, will',
];

List<Word> wordsFor(int id) {
  // The app is structured for 30 words per lesson. This starter dataset
  // keeps the project dependency-free; replace/expand the bank later.
  return List.generate(30, (i) => baseWords[(i + id - 1) % baseWords.length]);
}

List<String> examplesFor(int id) {
  final examples = <String>[
    'I am a student.',
    'You are my friend.',
    'He is happy.',
    'She is at home.',
    'We are ready.',
    'They are good students.',
    'I have a book.',
    'There is a school here.',
    'The phone is on the table.',
    'I can speak English.',
  ];
  return List.generate(6, (i) => examples[(i + id) % examples.length]);
}

List<Question> questionsFor(int id) {
  const q = <Question>[
    Question('I ___ Ahmad.', ['am','is','are'], 'am'),
    Question('She ___ happy.', ['am','is','are'], 'is'),
    Question('They ___ friends.', ['am','is','are'], 'are'),
    Question('We ___ ready.', ['am','is','are'], 'are'),
    Question('He ___ a student.', ['am','is','are'], 'is'),
    Question('You ___ my friend.', ['am','is','are'], 'are'),
    Question('It ___ good.', ['am','is','are'], 'is'),
    Question('I ___ tired.', ['am','is','are'], 'am'),
  ];
  return List.generate(8, (i) => q[(i + id) % q.length]);
}

List<Lesson> buildLessons() => List.generate(30, (i) {
  final id = i + 1;
  return Lesson(
    id: id,
    title: lessonTitles[i],
    subtitle: lessonSubtitles[i],
    explanation: 'در این درس مفهوم ${lessonTitles[i]} را با مثال‌های ساده و تمرین مرحله‌ای یاد می‌گیری.',
    formula: i == 0
        ? 'I → am\nHe / She / It → is\nYou / We / They → are'
        : '${lessonTitles[i]}\nLearn → Practice → Quiz → XP',
    words: wordsFor(id),
    examples: examplesFor(id),
    questions: questionsFor(id),
  );
});

final lessons = buildLessons();

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
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),
        children: [
          Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('ENGLISH QUEST', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 2, color: Color(0xFF00E5FF))),
              SizedBox(height: 4),
              Text('Your English adventure starts now 🚀', style: TextStyle(color: Colors.white60)),
            ])),
            const NeonBadge(icon: Icons.person),
          ]),
          const SizedBox(height: 22),
          Row(children: [
            StatCard(icon: '⭐', value: '$xp', label: 'XP'),
            const SizedBox(width: 9),
            StatCard(icon: '🔥', value: '$streak', label: 'STREAK'),
            const SizedBox(width: 9),
            StatCard(icon: '🪙', value: '$coins', label: 'COINS'),
          ]),
          const SizedBox(height: 28),
          const Row(children: [
            Expanded(child: Text('A1 Grammar Quest', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))),
            Text('30 LESSONS', style: TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold, fontSize: 11)),
          ]),
          const SizedBox(height: 12),
          ...lessons.map((lesson) => LessonCard(lesson: lesson, onReward: onReward)),
          const SizedBox(height: 12),
          const DailyQuestCard(),
        ],
      );
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

class StatCard extends StatelessWidget {
  final String icon, value, label;
  const StatCard({super.key, required this.icon, required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF0A1224),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E9DFF).withOpacity(.18)),
          ),
          child: Column(children: [
            Text(icon, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 3),
            Text(value, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 9, color: Colors.white54, letterSpacing: 1)),
          ]),
        ),
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
                Text(lesson.subtitle, style: const TextStyle(color: Color(0xFF00E5FF))),
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
          Text(widget.lesson.subtitle, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          const SizedBox(height: 16),
          _Panel(child: Text(widget.lesson.explanation, style: const TextStyle(fontSize: 17, height: 1.7))),
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
                subtitle: Text('${w.meaning}  •  ${w.pronunciation}', style: const TextStyle(color: Color(0xFF00E5FF))),
                trailing: IconButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${w.word}  /${w.pronunciation}/'))),
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
        children: widget.lesson.examples.asMap().entries.map((e) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.035),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E9DFF).withOpacity(.18)),
          ),
          child: Row(children: [
            const Icon(Icons.check_circle_rounded, color: Color(0xFF00E5FF)),
            const SizedBox(width: 12),
            Expanded(child: Text(e.value, style: const TextStyle(fontSize: 17))),
          ]),
        )).toList(),
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(Icons.auto_awesome_rounded, size: 82, color: Color(0xFF00E5FF)),
            SizedBox(height: 18),
            Text('AI TUTOR', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF00E5FF))),
            SizedBox(height: 12),
            Text('اینجا می‌توانیم بعداً مکالمه، تمرین تلفظ و چت آموزشی را اضافه کنیم.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.6)),
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
