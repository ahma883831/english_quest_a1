// ============================================================
// SPEED DUEL
// Step 1 (LessonPickerForDuelPage): pick which lessons to pull
// questions from.
// Step 2 (SpeedDuelGamePage): 60-second timer, random questions
// from the selected lessons' Question banks (a fresh shuffle
// every playthrough), tap the right answer to score points.
// Best score is saved locally via shared_preferences.
//
// Usage:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => const LessonPickerForDuelPage(),
//   ));
// ============================================================
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';
import 'lessons_data.dart';

const _neon = Color(0xFF00E5FF);
const _bestScoreKey = 'speed_duel_best_score';

class LessonPickerForDuelPage extends StatefulWidget {
  const LessonPickerForDuelPage({super.key});
  @override
  State<LessonPickerForDuelPage> createState() => _LessonPickerForDuelPageState();
}

class _LessonPickerForDuelPageState extends State<LessonPickerForDuelPage> {
  final Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('انتخاب درس‌ها برای دوئل'),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => setState(() => selected.addAll(lessons.map((l) => l.id))),
                      child: const Text('انتخاب همه'),
                    ),
                    TextButton(
                      onPressed: () => setState(() => selected.clear()),
                      child: const Text('پاک کردن'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: lessons.length,
                  itemBuilder: (context, i) {
                    final l = lessons[i];
                    final isOn = selected.contains(l.id);
                    return CheckboxListTile(
                      value: isOn,
                      onChanged: (v) => setState(() {
                        if (v == true) {
                          selected.add(l.id);
                        } else {
                          selected.remove(l.id);
                        }
                      }),
                      activeColor: _neon,
                      title: Text(l.subtitle, style: const TextStyle(color: Colors.white)),
                      subtitle: Text(l.title, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selected.isEmpty
                        ? null
                        : () {
                            final chosen = lessons.where((l) => selected.contains(l.id)).toList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SpeedDuelGamePage(lessons: chosen)),
                            );
                          },
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(selected.isEmpty ? 'حداقل یک درس انتخاب کن' : 'شروع دوئل (۶۰ ثانیه)'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeedDuelGamePage extends StatefulWidget {
  final List<Lesson> lessons;
  const SpeedDuelGamePage({super.key, required this.lessons});

  @override
  State<SpeedDuelGamePage> createState() => _SpeedDuelGamePageState();
}

class _SpeedDuelGamePageState extends State<SpeedDuelGamePage> {
  late List<Question> pool;
  int poolIndex = 0;
  int score = 0;
  int timeLeft = 60;
  Timer? _timer;
  bool finished = false;
  int bestScore = 0;
  String? selectedOption;
  bool? lastCorrect;

  @override
  void initState() {
    super.initState();
    pool = widget.lessons.expand((l) => l.questions).toList();
    pool.shuffle(Random());
    _loadBest();
    _startTimer();
  }

  Future<void> _loadBest() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => bestScore = prefs.getInt(_bestScoreKey) ?? 0);
  }

  Future<void> _saveBestIfNeeded() async {
    if (score > bestScore) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_bestScoreKey, score);
      setState(() => bestScore = score);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft <= 1) {
        t.cancel();
        setState(() {
          timeLeft = 0;
          finished = true;
        });
        _saveBestIfNeeded();
      } else {
        setState(() => timeLeft -= 1);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _answer(String option) {
    if (finished || pool.isEmpty) return;
    final q = pool[poolIndex % pool.length];
    final correct = option == q.answer;
    setState(() {
      selectedOption = option;
      lastCorrect = correct;
      if (correct) score += 10;
    });
    Future.delayed(const Duration(milliseconds: 350), () {
      if (!mounted || finished) return;
      setState(() {
        poolIndex++;
        selectedOption = null;
        lastCorrect = null;
        if (poolIndex % pool.length == 0) pool.shuffle(Random());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pool.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFF0A0F1F),
        body: const Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('این درس‌ها سؤال ندارن.', style: TextStyle(color: Colors.white70)),
          ),
        ),
      );
    }

    if (finished) {
      final isRecord = score >= bestScore && score > 0;
      return Scaffold(
        backgroundColor: const Color(0xFF0A0F1F),
        body: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(isRecord ? '🏆 رکورد جدید!' : 'زمان تمام شد!',
                    style: const TextStyle(color: _neon, fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('امتیاز: $score', style: const TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 6),
                Text('بهترین امتیاز: $bestScore', style: const TextStyle(color: Colors.white54)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('بازگشت'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final q = pool[poolIndex % pool.length];
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('⏱ $timeLeft ثانیه',
                        style: TextStyle(
                            color: timeLeft <= 10 ? Colors.redAccent : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('امتیاز: $score', style: const TextStyle(color: _neon, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    q.text,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 24),
                ...q.options.map((opt) {
                  Color bg = Colors.white.withOpacity(.05);
                  Color border = _neon.withOpacity(.2);
                  if (selectedOption == opt) {
                    bg = (lastCorrect ?? false)
                        ? Colors.green.withOpacity(.25)
                        : Colors.red.withOpacity(.25);
                    border = (lastCorrect ?? false) ? Colors.greenAccent : Colors.redAccent;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: selectedOption == null ? () => _answer(opt) : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: border),
                        ),
                        child: Text(opt,
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
