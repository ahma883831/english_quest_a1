// ============================================================
// REVERSE RECALL
// Pick one or more lessons; the Persian meaning is shown from a
// 30-round pool mixed across all of them, and the user must type
// the English word from memory. Wrong answers go into the shared
// Mistake Notebook.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'mistake_notebook.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);
const _kRounds = 30;

class ReverseRecallPage extends StatefulWidget {
  final List<Lesson>? initialLessons;
  const ReverseRecallPage({super.key, this.initialLessons});
  @override
  State<ReverseRecallPage> createState() => _ReverseRecallPageState();
}

class _ReverseRecallPageState extends State<ReverseRecallPage> {
  List<Lesson> currentLessons = [];
  late FlutterTts _tts;
  final TextEditingController _controller = TextEditingController();
  List<Word> roundWords = [];
  int round = 0;
  int score = 0;
  bool? lastCorrect;
  bool sessionDone = false;
  bool checked = false;

  @override
  void initState() {
    super.initState();
    _tts = FlutterTts();
    _tts.setLanguage('en-US');
    currentLessons = widget.initialLessons ?? [lessons.first];
    _startSession();
  }

  @override
  void dispose() {
    _controller.dispose();
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
    final pool = currentLessons.expand((l) => l.words).toList()..shuffle(Random());
    setState(() {
      roundWords = pool.take(min(_kRounds, pool.length)).toList();
      round = 0;
      score = 0;
      sessionDone = false;
      checked = false;
      _controller.clear();
    });
  }

  void _check() {
    if (checked) return;
    final current = roundWords[round];
    final answer = _controller.text.trim().toLowerCase();
    final correct = answer == current.word.toLowerCase();
    setState(() {
      checked = true;
      lastCorrect = correct;
      if (correct) score++;
    });
    if (correct) {
      AppState.instance.addReward(8, 1);
    } else {
      MistakeService.recordMistake(current);
    }
  }

  void _next() {
    setState(() {
      round++;
      checked = false;
      lastCorrect = null;
      _controller.clear();
      if (round >= roundWords.length) sessionDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('ترجمه‌ی معکوس')),
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
                  Text('نتیجه: $score از ${roundWords.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: _neon, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _startSession, child: const Text('دوباره تمرین کن (سؤالات جدید)')),
                ] else if (roundWords.isNotEmpty) ...[
                  Text('سؤال ${round + 1} از ${roundWords.length}   •   امتیاز: $score',
                      style: const TextStyle(color: Colors.white54)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(roundWords[round].emoji, style: const TextStyle(fontSize: 40)),
                        const SizedBox(height: 10),
                        Text(roundWords[round].meaning,
                            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _controller,
                    enabled: !checked,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    onSubmitted: (_) => _check(),
                    decoration: InputDecoration(
                      hintText: 'type the English word...',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: checked
                          ? ((lastCorrect ?? false) ? Colors.green.withOpacity(.15) : Colors.red.withOpacity(.15))
                          : Colors.white.withOpacity(.05),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                  if (checked) ...[
                    const SizedBox(height: 10),
                    Text(
                      (lastCorrect ?? false)
                          ? '✅ درست بود!'
                          : '❌ جواب درست: ${roundWords[round].word}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: (lastCorrect ?? false) ? Colors.greenAccent : Colors.redAccent, fontSize: 16),
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: checked ? _next : _check,
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: Text(checked ? 'بعدی' : 'بررسی کن'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
