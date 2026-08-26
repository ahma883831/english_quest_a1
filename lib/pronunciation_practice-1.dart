// ============================================================
// PRONUNCIATION PRACTICE — user hears the correct pronunciation (TTS),
// then records themselves via the mic (speech_to_text handles both the
// recording and the on-device recognition), and gets an accuracy score
// comparing what they said to the target word/sentence.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'models.dart';
import 'main.dart'; // AppState

class _PronunciationItem {
  final String text; // English target (word or sentence)
  final String meaningFa;
  const _PronunciationItem({required this.text, required this.meaningFa});
}

class PronunciationPracticePage extends StatefulWidget {
  final Lesson lesson;
  const PronunciationPracticePage({super.key, required this.lesson});
  @override
  State<PronunciationPracticePage> createState() => _PronunciationPracticePageState();
}

class _PronunciationPracticePageState extends State<PronunciationPracticePage> {
  final FlutterTts tts = FlutterTts();
  final stt.SpeechToText speech = stt.SpeechToText();

  bool speechReady = false;
  bool speechDenied = false;
  bool isListening = false;
  String recognized = '';
  double? score; // 0..1
  int tab = 0; // 0 = words, 1 = sentences
  int index = 0;

  late List<_PronunciationItem> wordItems;
  late List<_PronunciationItem> sentenceItems;

  List<_PronunciationItem> get items => tab == 0 ? wordItems : sentenceItems;
  _PronunciationItem? get current => items.isEmpty ? null : items[index];

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.42);

    wordItems = widget.lesson.words.map((w) => _PronunciationItem(text: w.word, meaningFa: w.meaning)).toList();
    sentenceItems = widget.lesson.examples.map((e) {
      final parts = e.split(' — ');
      final en = parts.isNotEmpty ? parts[0] : e;
      final fa = parts.length > 1 ? parts[1] : '';
      return _PronunciationItem(text: en, meaningFa: fa);
    }).toList();

    _initSpeech();
  }

  Future<void> _initSpeech() async {
    final ok = await speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          if (mounted) setState(() => isListening = false);
        }
      },
      onError: (_) {
        if (mounted) setState(() => isListening = false);
      },
    );
    if (mounted) {
      setState(() {
        speechReady = ok;
        speechDenied = !ok;
      });
    }
  }

  Future<void> _speakTarget() async {
    final c = current;
    if (c == null) return;
    await tts.speak(c.text);
  }

  Future<void> _toggleListening() async {
    if (isListening) {
      await speech.stop();
      setState(() => isListening = false);
      return;
    }
    if (!speechReady) {
      await _initSpeech();
      if (!speechReady) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Directionality(
                textDirection: TextDirection.rtl,
                child: Text('به میکروفون دسترسی نداریم. دسترسی رو از تنظیمات گوشی فعال کن.'),
              ),
            ),
          );
        }
        return;
      }
    }
    setState(() {
      isListening = true;
      recognized = '';
      score = null;
    });
    await speech.listen(
      localeId: 'en_US',
      onResult: (result) {
        setState(() {
          recognized = result.recognizedWords;
          if (result.finalResult) {
            isListening = false;
            final c = current;
            if (c != null) score = _similarity(recognized, c.text);
          }
        });
      },
    );
  }

  void _next() {
    final atLastItem = index + 1 >= items.length;
    if (atLastItem) {
      AppState.instance.markActivityComplete(widget.lesson.id, 'pronunciation');
      AppState.instance.addReward(15, 3);
      Navigator.pop(context);
      return;
    }
    setState(() {
      index++;
      recognized = '';
      score = null;
    });
  }

  void _switchTab(int t) {
    if (tab == t) return;
    setState(() {
      tab = t;
      index = 0;
      recognized = '';
      score = null;
    });
  }

  @override
  void dispose() {
    tts.stop();
    speech.stop();
    super.dispose();
  }

  // --- scoring: normalized Levenshtein similarity between the recognized
  // text and the target, so close-but-imperfect pronunciation still scores
  // reasonably instead of requiring an exact string match. ---
  double _similarity(String a, String b) {
    final na = _normalize(a);
    final nb = _normalize(b);
    if (na.isEmpty || nb.isEmpty) return 0;
    final dist = _levenshtein(na, nb);
    final maxLen = max(na.length, nb.length);
    return (1 - dist / maxLen).clamp(0.0, 1.0);
  }

  String _normalize(String s) => s.toLowerCase().replaceAll(RegExp(r"[^a-z0-9' ]"), '').trim();

  int _levenshtein(String s, String t) {
    final m = s.length, n = t.length;
    final d = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
    for (var i = 0; i <= m; i++) d[i][0] = i;
    for (var j = 0; j <= n; j++) d[0][j] = j;
    for (var i = 1; i <= m; i++) {
      for (var j = 1; j <= n; j++) {
        final cost = s[i - 1] == t[j - 1] ? 0 : 1;
        d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost].reduce(min);
      }
    }
    return d[m][n];
  }

  String _feedbackFa(double s) {
    if (s >= .85) return 'عالی بود! 🎉';
    if (s >= .6) return 'خوبه، ولی میتونی بهتر بگی 👍';
    return 'دوباره امتحان کن 🔁';
  }

  Color _feedbackColor(double s) {
    if (s >= .85) return Colors.greenAccent;
    if (s >= .6) return Colors.amberAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final c = current;
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('تمرین تلفظ')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const PronunciationGlowBg(),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
              child: Row(children: [
                Expanded(child: _tabChip('کلمات', 0)),
                const SizedBox(width: 10),
                Expanded(child: _tabChip('جملات', 1)),
              ]),
            ),
            if (items.isEmpty)
              const Expanded(
                child: Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text('برای این بخش موردی ثبت نشده', style: TextStyle(color: Colors.white54)),
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('${index + 1} از ${items.length}', style: const TextStyle(color: Colors.white38, fontSize: 12)),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.035),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.2)),
                      ),
                      child: Column(children: [
                        Text(
                          c!.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                        ),
                        if (c.meaningFa.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(c.meaningFa, style: const TextStyle(color: Colors.white54, fontSize: 14)),
                          ),
                        ],
                        const SizedBox(height: 14),
                        OutlinedButton.icon(
                          onPressed: _speakTarget,
                          icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00E5FF)),
                          label: const Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('شنیدن تلفظ صحیح', style: TextStyle(color: Color(0xFF00E5FF))),
                          ),
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF00E5FF))),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 26),
                    GestureDetector(
                      onTap: _toggleListening,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: isListening
                                ? [Colors.redAccent, const Color(0xFFFF7A59)]
                                : [const Color(0xFF0066FF), const Color(0xFF00C8FF)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (isListening ? Colors.redAccent : const Color(0xFF00C8FF)).withOpacity(.4),
                              blurRadius: 26,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(isListening ? Icons.stop_rounded : Icons.mic_rounded, size: 38, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        isListening ? 'در حال گوش دادن... حرف بزن' : 'برای ضبط صدات ضربه بزن',
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                    if (speechDenied) ...[
                      const SizedBox(height: 8),
                      const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'دسترسی میکروفون رد شده. از تنظیمات گوشی اجازه بده.',
                          style: TextStyle(color: Colors.orangeAccent, fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    if (recognized.isNotEmpty) ...[
                      const SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.035),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('چیزی که شنیدیم:', style: TextStyle(color: Colors.white38, fontSize: 11)),
                          ),
                          const SizedBox(height: 4),
                          Text(recognized, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ]),
                      ),
                    ],
                    if (score != null) ...[
                      const SizedBox(height: 16),
                      Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: score,
                            minHeight: 10,
                            backgroundColor: Colors.white12,
                            valueColor: AlwaysStoppedAnimation(_feedbackColor(score!)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '${_feedbackFa(score!)}   (${(score! * 100).round()}٪ تطابق)',
                            style: TextStyle(color: _feedbackColor(score!), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                    ],
                    const SizedBox(height: 26),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            index + 1 >= items.length ? 'پایان تمرین' : 'بعدی',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
          ]),
        ),
      ]),
    );
  }

  Widget _tabChip(String label, int t) {
    final active = tab == t;
    return GestureDetector(
      onTap: () => _switchTab(t),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? const Color(0xFF00C8FF).withOpacity(.16) : Colors.white.withOpacity(.03),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: active ? const Color(0xFF00E5FF).withOpacity(.4) : Colors.white12),
        ),
        child: Text(label, style: TextStyle(color: active ? const Color(0xFF00E5FF) : Colors.white54, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// Local copy of the app's glow background so this file has no
// dependency on main.dart's private widgets.
class PronunciationGlowBg extends StatelessWidget {
  const PronunciationGlowBg({super.key});
  @override
  Widget build(BuildContext context) => Positioned.fill(
        child: IgnorePointer(
          child: Stack(children: [
            Positioned(
              top: -120,
              left: -100,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: const Color(0xFF0066FF).withOpacity(.20), blurRadius: 130, spreadRadius: 45)],
                ),
              ),
            ),
            Positioned(
              bottom: -140,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: const Color(0xFF00E5FF).withOpacity(.20), blurRadius: 130, spreadRadius: 45)],
                ),
              ),
            ),
          ]),
        ),
      );
}
