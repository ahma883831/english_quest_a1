// ============================================================
// LISTENING PRACTICE
// Pick one or more lessons, then a 30-round session pooled and
// shuffled across all of them: a grammar example SENTENCE is only
// SPOKEN (flutter_tts) — never shown in English — and the user
// must pick its Persian meaning from 4 options.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);
const _kRounds = 30;

class _Sentence {
  final String english;
  final String meaning;
  const _Sentence(this.english, this.meaning);
}

List<_Sentence> _sentencesOf(Lesson l) {
  final all = [...l.examples, ...l.negativeExamples, ...l.questionExamples];
  return all.map((raw) {
    final parts = raw.split(' — ');
    final english = parts.isNotEmpty ? parts[0] : raw;
    final meaning = parts.length > 1 ? parts[1] : '';
    return _Sentence(english, meaning);
  }).where((s) => s.meaning.isNotEmpty).toList();
}

class ListeningPracticePage extends StatefulWidget {
  final List<Lesson>? initialLessons;
  const ListeningPracticePage({super.key, this.initialLessons});
  @override
  State<ListeningPracticePage> createState() => _ListeningPracticePageState();
}

class _ListeningPracticePageState extends State<ListeningPracticePage> {
  List<Lesson> currentLessons = [];
  late FlutterTts _tts;
  List<_Sentence> roundSentences = [];
  List<_Sentence> distractorPool = [];
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
    currentLessons = widget.initialLessons ?? [lessons.first];
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
      MaterialPageRoute(builder: (_) => const MultiLessonPickerPage()),
    );
    if (picked != null && picked.isNotEmpty) {
      setState(() {
        currentLessons = picked;
        _startSession();
      });
    }
  }

  void _startSession() {
    distractorPool = currentLessons.expand(_sentencesOf).toList();
    final pool = List<_Sentence>.from(distractorPool)..shuffle(Random());
    setState(() {
      roundSentences = pool.take(min(_kRounds, pool.length)).toList();
      round = 0;
      score = 0;
      sessionDone = false;
    });
    _prepareRound();
  }

  void _prepareRound() {
    if (round >= roundSentences.length) {
      setState(() => sessionDone = true);
      return;
    }
    final current = roundSentences[round];
    final others = distractorPool.where((s) => s.english != current.english).toList()..shuffle(Random());
    final distractors = others.take(3).map((s) => s.meaning).toList();
    final opts = [current.meaning, ...distractors]..shuffle(Random());
    setState(() {
      options = opts;
      selected = null;
      lastCorrect = null;
    });
    Future.delayed(const Duration(milliseconds: 300), () => _tts.speak(current.english));
  }

  void _answer(String opt) {
    if (selected != null) return;
    final current = roundSentences[round];
    final correct = opt == current.meaning;
    setState(() {
      selected = opt;
      lastCorrect = correct;
      if (correct) score++;
    });
    if (correct) {
      AppState.instance.addReward(5, 1);
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
                Text('درس‌های انتخاب‌شده: ${currentLessons.map((l) => l.subtitle).join('، ')}',
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
                const SizedBox(height: 16),
                if (sessionDone) ...[
                  const SizedBox(height: 40),
                  Text('نتیجه: $score از ${roundSentences.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: _neon, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _startSession, child: const Text('دوباره تمرین کن (سؤالات جدید)')),
                ] else if (roundSentences.isNotEmpty) ...[
                  Text('سؤال ${round + 1} از ${roundSentences.length} • امتیاز: $score',
                      style: const TextStyle(color: Colors.white54)),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => _tts.speak(roundSentences[round].english),
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
                ] else ...[
                  const SizedBox(height: 40),
                  const Text('این درس مثال کافی برای تمرین شنیداری نداره.',
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.white54)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
