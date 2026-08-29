// ============================================================
// INTERACTIVE SCENE PAGE
// Shows a wide panorama image the user can scroll horizontally.
// Glowing hotspot dots sit on top of objects in the scene;
// tapping one opens a bottom-sheet card with the English word,
// Persian meaning, an example sentence, and a speaker button
// that reads the word aloud using flutter_tts.
//
// Progress (which words were tapped) is saved automatically via
// SceneProgressService, so it survives app restarts.
//
// Usage:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => InteractiveScenePage(scene: scene_farm),
//   ));
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'scene_models.dart';
import 'scene_progress_service.dart';
import 'mnemonics_data.dart';

const _neon = Color(0xFF00E5FF);

class InteractiveScenePage extends StatefulWidget {
  final SceneData scene;
  const InteractiveScenePage({super.key, required this.scene});

  @override
  State<InteractiveScenePage> createState() => _InteractiveScenePageState();
}

class _InteractiveScenePageState extends State<InteractiveScenePage> {
  late final FlutterTts _tts;
  Set<String> _seenWordIds = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _tts = FlutterTts();
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.45);
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final seen = await SceneProgressService.getSeenWordIds(widget.scene.id);
    if (mounted) {
      setState(() {
        _seenWordIds = seen;
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> _openWordCard(SceneWord word) async {
    setState(() => _seenWordIds.add(word.id));
    await SceneProgressService.markWordSeen(widget.scene.id, word.id);
    _speak(word.english);

    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF10182E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      word.english,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: _neon,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _speak(word.english),
                    icon: const Icon(Icons.volume_up_rounded, color: _neon, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                word.persian,
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: _neon.withOpacity(.18)),
                ),
                child: Text(
                  word.example,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
                ),
              ),
              const SizedBox(height: 14),
              _MnemonicBox(englishWord: word.english),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height * 0.45;
    final displayWidth = displayHeight * widget.scene.imageAspectRatio;
    final total = widget.scene.words.length;
    final seen = _seenWordIds.length;

    return Scaffold(
      appBar: AppBar(
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(widget.scene.titleFa),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFF0A0F1F),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: _neon))
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Text(
                            'یاد گرفته‌شده: $seen از $total کلمه',
                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                          const Spacer(),
                          Icon(
                            seen == total ? Icons.emoji_events_rounded : Icons.explore_rounded,
                            color: _neon,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: displayWidth,
                          height: displayHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    widget.scene.imageAsset,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stack) => Container(
                                      color: const Color(0xFF10182E),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'تصویر صحنه پیدا نشد',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white38),
                                      ),
                                    ),
                                  ),
                                ),
                                for (final word in widget.scene.words)
                                  Positioned(
                                    left: word.xFraction * displayWidth - 16,
                                    top: word.yFraction * displayHeight - 16,
                                    child: _Hotspot(
                                      isSeen: _seenWordIds.contains(word.id),
                                      onTap: () => _openWordCard(word),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'برای دیدن معنی و شنیدن تلفظ، روی نقطه‌های نورانی بزن. صحنه را بکش تا بقیه‌اش را ببینی.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _Hotspot extends StatelessWidget {
  final bool isSeen;
  final VoidCallback onTap;
  const _Hotspot({required this.isSeen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = isSeen ? Colors.white54 : _neon;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(.16),
          border: Border.all(color: color, width: 2),
          boxShadow: isSeen
              ? []
              : [
                  BoxShadow(color: color.withOpacity(.6), blurRadius: 10, spreadRadius: 1),
                ],
        ),
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}

String _normTok(String s) => s.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

class _MnemonicBox extends StatelessWidget {
  final String englishWord;
  const _MnemonicBox({required this.englishWord});

  @override
  Widget build(BuildContext context) {
    final joke = mnemonics[_normTok(englishWord)];
    if (joke == null) return const SizedBox.shrink();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.purpleAccent.withOpacity(.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🧠', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(joke, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }
}
