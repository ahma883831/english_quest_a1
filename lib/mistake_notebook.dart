// ============================================================
// MISTAKE NOTEBOOK
// A shared, persistent list of words the user got wrong in any
// exercise (listening practice, reverse recall, etc). Other
// pages call MistakeService.recordMistake(...) when the user
// answers incorrectly, and MistakeService.clear(word) once they
// get it right again during review.
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

const _neon = Color(0xFF00E5FF);
const _kKey = 'mistake_notebook_v1';

class MistakeService {
  static String _encode(Word w) =>
      '${w.word}|${w.meaning}|${w.pronunciation}|${w.emoji}';

  static Word? _decode(String s) {
    final parts = s.split('|');
    if (parts.length < 4) return null;
    return Word(parts[0], parts[1], parts[2], parts[3]);
  }

  static Future<void> recordMistake(Word w) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_kKey) ?? [];
    final exists = list.any((s) => s.split('|').first == w.word);
    if (!exists) {
      list.add(_encode(w));
      await prefs.setStringList(_kKey, list);
    }
  }

  static Future<void> clear(String word) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_kKey) ?? [];
    list.removeWhere((s) => s.split('|').first == word);
    await prefs.setStringList(_kKey, list);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kKey);
  }

  static Future<List<Word>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_kKey) ?? [];
    return list.map(_decode).whereType<Word>().toList();
  }
}

class MistakeNotebookPage extends StatefulWidget {
  const MistakeNotebookPage({super.key});
  @override
  State<MistakeNotebookPage> createState() => _MistakeNotebookPageState();
}

class _MistakeNotebookPageState extends State<MistakeNotebookPage> {
  List<Word> mistakes = [];
  bool loading = true;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-US');
    _load();
  }

  Future<void> _load() async {
    final list = await MistakeService.getAll();
    setState(() {
      mistakes = list;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('دفترچه‌ی اشتباهات'),
        ),
        actions: [
          if (mistakes.isNotEmpty)
            IconButton(
              tooltip: 'پاک کردن همه',
              onPressed: () async {
                await MistakeService.clearAll();
                _load();
              },
              icon: const Icon(Icons.delete_sweep_rounded),
            ),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator(color: _neon))
          : mistakes.isEmpty
              ? const Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'هنوز اشتباهی ثبت نشده 🎉\nهر وقت توی «شنیداری» یا «ترجمه‌ی معکوس» غلط بزنی، اینجا جمع می‌شه.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                )
              : SafeArea(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(14),
                    itemCount: mistakes.length,
                    itemBuilder: (_, i) {
                      final w = mistakes[i];
                      return Card(
                        color: Colors.white.withOpacity(.035),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: Text(w.emoji, style: const TextStyle(fontSize: 26)),
                          title: Text(w.word, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('${w.meaning} • ${w.pronunciation}',
                                style: const TextStyle(color: _neon)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => _tts.speak(w.word),
                                icon: const Icon(Icons.volume_up_rounded, color: _neon),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await MistakeService.clear(w.word);
                                  _load();
                                },
                                icon: const Icon(Icons.check_circle_outline, color: Colors.greenAccent),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
