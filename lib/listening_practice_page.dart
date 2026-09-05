// ============================================================
// LISTENING PRACTICE
// Pick one or more lessons, then a 30-round session: the word is
// only SPOKEN (flutter_tts) — never shown in English — and the
// user must pick its Persian meaning from 4 options. Wrong answers
// are recorded in the shared Mistake Notebook.
//
// Now pools words across every selected lesson and draws the 30
// questions with a fair shuffle-bag so nothing repeats too soon.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'mistake_notebook.dart';
import 'lesson_picker.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);
const _kRounds = 30;

class ListeningPracticePage extends StatefulWidget {
  // Kept for backward compatibility with call sites that still pass a
  // single lesson (e.g. opening practice from inside one lesson).
  final Lesson? initialLesson;
  // Preferred going forward: pre-select several lessons at once.
  final List<Lesson>? initialLessons;
  const ListeningPracticePage({super.key, this.initialLesson, this.initialLessons});
  @override
  State<ListeningPracticePage> createState() => _ListeningPracticePageState();
}

class _ListeningPracticePageState extends State<ListeningPracticePage> {
  List<Lesson> selectedLessons = [];
  late FlutterTts _tts;
  List<Word> roundWords = [];
  int round = 0;
  int score = 0;
  List<String> options = [];
  String? selected;
  bool? lastCorrect;
  bool sessionDone = false;

  @override
  void initState() {
    super.initState();
    _tts = FlutterTts();
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.42);
    selectedLessons = widget.initialLessons ??
        (widget.initialLesson != null ? [widget.initialLesson!] : [lessons.first]);
    _startSession();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _changeLessons() async {
    final picked = await Navigator.push<List<Lesson>>(
      context,
      MaterialPageRoute(builder: (_) => MultiLessonPickerPage(initialSelected: selectedLessons)),
    );
    if (picked != null && picked.isNotEmpty) {
      setState(() => selectedLessons = picked);
      _startSession();
    }
  }

  void _startSession() {
    if (selectedLessons.isEmpty) return;
    final pool = selectedLessons.expand((l) => l.words).toList();
    setState(() {
      roundWords = pickShuffledQuestions(pool, _kRounds);
      round = 0;
      score = 0;
      sessionDone = false;
    });
    _prepareRound();
  }

  void _prepareRound() {
    if (round >= roundWords.length) {
      setState(() => sessionDone = true);
      return;
    }
    final current = roundWords[round];
    final pool = selectedLessons.expand((l) => l.words).where((w) => w.word != current.word).toList()
      ..shuffle(Random());
    final distractors = pool.take(3).map((w) => w.meaning).toList();
    final opts = [current.meaning, ...distractors]..shuffle(Random());
    setState(() {
      options = opts;
      selected = null;
      lastCorrect = null;
    });
    Future.delayed(const Duration(milliseconds: 300), () => _tts.speak(current.word));
  }

  void _answer(String opt) {
    if (selected != null) return;
    final current = roundWords[round];
    final correct = opt == current.meaning;
    setState(() {
      selected = opt;
      lastCorrect = correct;
      if (correct) score++;
    });
    if (correct) {
      AppState.instance.addReward(5, 1);
    } else {
      MistakeService.recordMistake(current);
    }
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() => round++);
      _prepareRound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('تمرین شنیداری')),
        actions: [
          IconButton(
            tooltip: 'تغییر درس‌ها',
            onPressed: _changeLessons,
            icon: const Icon(Icons.swap_horiz_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: _changeLessons,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _neon.withOpacity(.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu_book_rounded, color: _neon, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            selectedLessons.length == 1
                                ? selectedLessons.first.subtitle
                                : '${selectedLessons.length} درس انتخاب شده',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const Icon(Icons.edit_rounded, color: Colors.white38, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (sessionDone) ...[
                  const SizedBox(height: 40),
                  Text('نتیجه: $score از ${roundWords.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: _neon, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _startSession, child: const Text('دوباره تمرین کن')),
                ] else if (roundWords.isNotEmpty) ...[
                  Text('سؤال ${round + 1} از ${roundWords.length}   •   امتیاز: $score',
                      style: const TextStyle(color: Colors.white54)),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => _tts.speak(roundWords[round].word),
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _neon.withOpacity(.12),
                          border: Border.all(color: _neon, width: 2),
                        ),
                        child: const Icon(Icons.volume_up_rounded, color: _neon, size: 46),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('برای شنیدن دوباره روی دایره بزن',
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize: 12)),
                  const SizedBox(height: 30),
                  ...options.map((opt) {
                    Color bg = Colors.white.withOpacity(.05);
                    Color border = _neon.withOpacity(.2);
                    if (selected == opt) {
                      bg = (lastCorrect ?? false) ? Colors.green.withOpacity(.25) : Colors.red.withOpacity(.25);
                      border = (lastCorrect ?? false) ? Colors.greenAccent : Colors.redAccent;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () => _answer(opt),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: border),
                          ),
                          child: Text(opt, style: const TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    );
                  }),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
