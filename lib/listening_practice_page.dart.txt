// ============================================================
// LISTENING PRACTICE
// Pick a lesson, then a 10-round session: the word is only
// SPOKEN (flutter_tts) — never shown in English — and the user
// must pick its Persian meaning from 4 options. Wrong answers
// are recorded in the shared Mistake Notebook.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'mistake_notebook.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);
const _kRounds = 10;

class ListeningPracticePage extends StatefulWidget {
  final Lesson? initialLesson;
  const ListeningPracticePage({super.key, this.initialLesson});
  @override
  State<ListeningPracticePage> createState() => _ListeningPracticePageState();
}

class _ListeningPracticePageState extends State<ListeningPracticePage> {
  Lesson? selectedLesson;
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
    selectedLesson = widget.initialLesson ?? lessons.first;
    _startSession();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  void _startSession() {
    if (selectedLesson == null) return;
    final pool = List<Word>.from(selectedLesson!.words)..shuffle(Random());
    setState(() {
      roundWords = pool.take(min(_kRounds, pool.length)).toList();
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
    final others = selectedLesson!.words.where((w) => w.word != current.word).toList()..shuffle(Random());
    final distractors = others.take(3).map((w) => w.meaning).toList();
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
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<Lesson>(
                  value: selectedLesson,
                  dropdownColor: const Color(0xFF10182E),
                  decoration: InputDecoration(
                    labelText: 'درس',
                    labelStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(.05),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: const TextStyle(color: Colors.white),
                  items: lessons.map((l) => DropdownMenuItem(value: l, child: Text(l.subtitle))).toList(),
                  onChanged: (l) {
                    setState(() => selectedLesson = l);
                    _startSession();
                  },
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
