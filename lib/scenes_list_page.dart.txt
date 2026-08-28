// ============================================================
// SCENES LIST PAGE
// Grid of all 30 interactive-scene lessons. Each card shows the
// lesson's Persian title and a "seen/total" progress badge
// loaded from SceneProgressService. Tapping a card opens
// InteractiveScenePage for that lesson.
//
// Usage:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => const ScenesListPage(),
//   ));
// ============================================================
import 'package:flutter/material.dart';
import 'scene_models.dart';
import 'scene_progress_service.dart';
import 'interactive_scene_page.dart';

const _neon = Color(0xFF00E5FF);

class ScenesListPage extends StatefulWidget {
  const ScenesListPage({super.key});

  @override
  State<ScenesListPage> createState() => _ScenesListPageState();
}

class _ScenesListPageState extends State<ScenesListPage> {
  Map<String, int> _seenCounts = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadAllProgress();
  }

  Future<void> _loadAllProgress() async {
    final Map<String, int> counts = {};
    for (final scene in allScenes) {
      counts[scene.id] = await SceneProgressService.getSeenCount(scene.id);
    }
    if (mounted) {
      setState(() {
        _seenCounts = counts;
        _loading = false;
      });
    }
  }

  Future<void> _openScene(SceneData scene) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => InteractiveScenePage(scene: scene)),
    );
    // Refresh badges after coming back, in case progress changed.
    _loadAllProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('صحنه‌های آموزشی'),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: _neon))
          : SafeArea(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.95,
                ),
                itemCount: allScenes.length,
                itemBuilder: (context, index) {
                  final scene = allScenes[index];
                  final total = scene.words.length;
                  final seen = _seenCounts[scene.id] ?? 0;
                  final complete = seen == total;
                  return _SceneCard(
                    titleFa: scene.titleFa,
                    seen: seen,
                    total: total,
                    complete: complete,
                    onTap: () => _openScene(scene),
                  );
                },
              ),
            ),
    );
  }
}

class _SceneCard extends StatelessWidget {
  final String titleFa;
  final int seen;
  final int total;
  final bool complete;
  final VoidCallback onTap;

  const _SceneCard({
    required this.titleFa,
    required this.seen,
    required this.total,
    required this.complete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : seen / total;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.035),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: complete ? _neon.withOpacity(.55) : _neon.withOpacity(.16),
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                complete ? Icons.emoji_events_rounded : Icons.map_rounded,
                color: _neon,
                size: 26,
              ),
              const Spacer(),
              Text(
                titleFa,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.white.withOpacity(.08),
                  valueColor: AlwaysStoppedAnimation<Color>(_neon),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$seen از $total کلمه',
                style: const TextStyle(fontSize: 11, color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
