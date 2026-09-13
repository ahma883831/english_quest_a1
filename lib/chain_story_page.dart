// ============================================================
// CHAIN STORY PAGE
// Pick one or more lessons, then get 2-3 grammar structures
// (target lessons) pooled from them, and write a short story
// (2-3+ sentences) that uses each of those grammar structures.
// A lightweight keyword check gives per-structure feedback —
// it's a hint, not a strict grammar checker.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'models.dart';
import 'lessons_data.dart';
import 'main.dart';

const _neon = Color(0xFF00E5FF);

// A small set of tell-tale words/phrases per lesson, used only as a
// loose hint for whether the story attempted that grammar point —
// not a real grammar checker.
const Map<int, List<String>> _grammarMarkers = {
  1: ['am', 'is', 'are', "'m", "'s", "'re"],
  2: ['him', 'her', 'them', 'us', 'me'],
  3: ['my', 'your', 'his', 'her', 'our', 'their', 'its'],
  4: [' a ', ' an ', ' the '],
  5: ['s ', 'children', 'men', 'women', 'people'],
  6: ['this', 'that', 'these', 'those'],
  7: ['there is', 'there are', "there's"],
  8: ['every day', 'usually', 'always', 'often'],
  9: ["don't", "doesn't", 'do not', 'does not'],
  10: ['do you', 'does he', 'does she', 'do they', 'does it'],
  11: ['what', 'where', 'when', 'why', 'who', 'how'],
  12: ['always', 'usually', 'often', 'sometimes', 'rarely', 'never'],
  13: ['how often'],
  14: ['do', 'does', "don't", "doesn't"],
  15: [' is ', ' am ', ' are ', 'ing'],
  16: ['now', 'right now', 'at the moment'],
  17: ['can', "can't", 'cannot'],
  18: ['what can', 'who can', 'where can', 'how can'],
  19: ['ed '],
  20: ['went', 'saw', 'bought', 'ate', 'had', 'came', 'made'],
  21: ['did', "didn't", 'did not'],
  22: ['was', 'were'],
  23: ['was ', 'were ', 'ing'],
  24: ['when', 'while'],
  25: ['going to'],
  26: ['will', "won't"],
  27: ['than', 'more', 'er '],
  28: ['the best', 'the worst', 'the most', 'est '],
  29: ['must', 'have to', 'has to'],
  30: ['because', 'but', 'and'],
};

class ChainStoryPage extends StatefulWidget {
  final List<Lesson>? initialLessons;
  const ChainStoryPage({super.key, this.initialLessons});
  @override
  State<ChainStoryPage> createState() => _ChainStoryPageState();
}

class _ChainStoryPageState extends State<ChainStoryPage> {
  List<Lesson> currentLessons = [];
  List<Lesson> targetLessons = [];
  final TextEditingController _controller = TextEditingController();
  Map<int, bool> results = {};
  bool checked = false;
  bool rewarded = false;
  late final FlutterTts _tts;

  @override
  void initState() {
    super.initState();
    _tts = FlutterTts();
    _tts.setLanguage('en-US');
    currentLessons = widget.initialLessons ?? [lessons.first];
    _pickTargets();
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
        _pickTargets();
      });
    }
  }

  void _pickTargets() {
    final rnd = Random();
    final pool = List<Lesson>.from(currentLessons)..shuffle(rnd);
    final count = min(pool.length, 2 + rnd.nextInt(2)); // 2..3, capped by pool size
    setState(() {
      targetLessons = pool.take(count).toList();
      _controller.clear();
      results = {};
      checked = false;
      rewarded = false;
    });
  }

  String? _sampleFor(Lesson l) => l.examples.isNotEmpty ? l.examples.first.split(' — ').first : null;

  void _checkStory() {
    final text = ' ${_controller.text.toLowerCase()} ';
    final Map<int, bool> newResults = {};
    for (final l in targetLessons) {
      final markers = _grammarMarkers[l.id] ?? const [];
      newResults[l.id] = markers.any((m) => text.contains(m));
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('درس‌های انتخاب‌شده: ${currentLessons.map((l) => l.subtitle).join('، ')}',
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
                const SizedBox(height: 20),
                const Text('این ساختارهای گرامری رو توی یک داستان کوتاه (۲ تا ۳ جمله) استفاده کن:',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: targetLessons.map((l) {
                    final done = checked && (results[l.id] ?? false);
                    final sample = _sampleFor(l);
                    return GestureDetector(
                      onTap: () {
                        if (sample != null) _tts.speak(sample);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: done ? Colors.green.withOpacity(.2) : _neon.withOpacity(.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: done ? Colors.greenAccent : _neon.withOpacity(.5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(l.title,
                                style: TextStyle(
                                    color: done ? Colors.greenAccent : _neon,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
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
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    '(فرمول: ${targetLessons.map((l) => l.formula.split('\n').first).join(' • ')})',
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
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
                        onPressed: _pickTargets,
                        style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                        child: const Text('ساختارهای جدید'),
                      ),
                    ),
                  ],
                ),
                if (checked)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'این فقط یک راهنمای سریعه، نه یک تصحیح‌کننده‌ی دقیق گرامری — خودت هم دوباره جمله‌هات رو با فرمول بالا مقایسه کن.',
                      style: const TextStyle(color: Colors.white38, fontSize: 11),
                    ),
                  ),
                if (allDone) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.greenAccent.withOpacity(.5)),
                    ),
                    child: const Text('🎉 عالی بود! به نظر همه‌ی ساختارها رو استفاده کردی.',
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
