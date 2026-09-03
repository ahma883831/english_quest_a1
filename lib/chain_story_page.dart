// ============================================================
// CHAIN STORY PAGE
// Picks a lesson, then a random set of 3-5 words from it, and
// asks the user to write a short 2-3 sentence story that uses
// every one of those words. Checks (simple substring/whole-word
// match, case-insensitive) whether each target word appears in
// what they wrote, and gives per-word feedback.
//
// Usage:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => const ChainStoryPage(),
//   ));
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);

class ChainStoryPage extends StatefulWidget {
  final Lesson? initialLesson;
  const ChainStoryPage({super.key, this.initialLesson});
  @override
  State<ChainStoryPage> createState() => _ChainStoryPageState();
}

class _ChainStoryPageState extends State<ChainStoryPage> {
  Lesson? selectedLesson;
  List<Word> targetWords = [];
  final TextEditingController _controller = TextEditingController();
  Map<String, bool> results = {};
  bool checked = false;
  bool rewarded = false;
  late final FlutterTts _tts;

  @override
  void initState() {
    super.initState();
    _tts = FlutterTts();
    _tts.setLanguage('en-US');
    selectedLesson = widget.initialLesson ?? lessons.first;
    _pickWords();
  }

  @override
  void dispose() {
    _controller.dispose();
    _tts.stop();
    super.dispose();
  }

  void _pickWords() {
    if (selectedLesson == null) return;
    final rnd = Random();
    final pool = List<Word>.from(selectedLesson!.words);
    pool.shuffle(rnd);
    final count = 3 + rnd.nextInt(3); // 3..5
    setState(() {
      targetWords = pool.take(count).toList();
      _controller.clear();
      results = {};
      checked = false;
      rewarded = false;
    });
  }

  void _checkStory() {
    final text = _controller.text.toLowerCase();
    final Map<String, bool> newResults = {};
    for (final w in targetWords) {
      final pattern = RegExp(r'\b' + RegExp.escape(w.word.toLowerCase()) + r'\b');
      newResults[w.word] = pattern.hasMatch(text);
    }
    final allDoneNow = newResults.values.every((v) => v);
    setState(() {
      results = newResults;
      checked = true;
    });
    if (allDoneNow && !rewarded) {
      rewarded = true;
      AppState.instance.addReward(20, 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final allDone = checked && results.values.every((v) => v);
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('داستان زنجیره‌ای'),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  items: lessons
                      .map((l) => DropdownMenuItem(value: l, child: Text(l.subtitle)))
                      .toList(),
                  onChanged: (l) {
                    setState(() => selectedLesson = l);
                    _pickWords();
                  },
                ),
                const SizedBox(height: 20),
                const Text('این کلمات رو توی یک داستان کوتاه (۲ تا ۳ جمله) استفاده کن:',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: targetWords.map((w) {
                    final done = checked && (results[w.word] ?? false);
                    return GestureDetector(
                      onTap: () => _tts.speak(w.word),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: done ? Colors.green.withOpacity(.2) : _neon.withOpacity(.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: done ? Colors.greenAccent : _neon.withOpacity(.5)),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(w.word,
                                  style: TextStyle(
                                      color: done ? Colors.greenAccent : _neon,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              const Icon(Icons.volume_up_rounded, size: 14, color: Colors.white54),
                              if (checked) ...[
                                const SizedBox(width: 4),
                                Icon(done ? Icons.check_circle : Icons.cancel,
                                    size: 16, color: done ? Colors.greenAccent : Colors.redAccent),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Text(
                  '(معنی: ${targetWords.map((w) => w.meaning).join('، ')})',
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  maxLines: 5,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Write your short story here...',
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: Colors.white.withOpacity(.05),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _checkStory,
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                        child: const Text('بررسی کن'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _pickWords,
                        style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                        child: const Text('کلمات جدید'),
                      ),
                    ),
                  ],
                ),
                if (allDone) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.greenAccent.withOpacity(.5)),
                    ),
                    child: const Text('🎉 عالی بود! همه‌ی کلمات رو درست استفاده کردی.',
                        style: TextStyle(color: Colors.greenAccent)),
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
