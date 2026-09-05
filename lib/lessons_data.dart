// ============================================================
// SHARED PRACTICE HELPERS
// Used by every practice/game mode so the player can mix several
// lessons into one session and get well-randomized questions.
// ============================================================
import 'dart:math';
import 'package:flutter/material.dart';
import 'models.dart';
import 'lessons_data.dart';

/// Returns [count] items pulled from [pool] using a "shuffle bag":
/// the whole pool is shuffled and fully consumed before anything
/// repeats, and one swap is done so the item that ended one lap can't
/// immediately start the next lap. This keeps sessions varied and
/// non-repetitive even when [count] is bigger than the pool (which
/// happens often once a lesson has fewer than 30 words), instead of
/// picking purely at random and risking the same item back-to-back.
List<T> pickShuffledQuestions<T>(List<T> pool, int count) {
  if (pool.isEmpty || count <= 0) return [];
  final rnd = Random();
  final result = <T>[];
  List<T> bag = [];
  while (result.length < count) {
    if (bag.isEmpty) {
      bag = List<T>.from(pool)..shuffle(rnd);
      if (result.isNotEmpty && bag.length > 1 && bag.first == result.last) {
        final tmp = bag.removeAt(0);
        bag.add(tmp);
      }
    }
    result.add(bag.removeAt(0));
  }
  return result;
}

/// Multi-select lesson picker. Every practice/game mode should push
/// this (instead of the old single-lesson picker) so the player can
/// combine several lessons into one randomized session.
class MultiLessonPickerPage extends StatefulWidget {
  final List<Lesson> initialSelected;
  const MultiLessonPickerPage({super.key, this.initialSelected = const []});

  @override
  State<MultiLessonPickerPage> createState() => _MultiLessonPickerPageState();
}

class _MultiLessonPickerPageState extends State<MultiLessonPickerPage> {
  late Set<String> selectedIds;

  @override
  void initState() {
    super.initState();
    selectedIds = widget.initialSelected.map((l) => l.id).toSet();
    if (selectedIds.isEmpty && lessons.isNotEmpty) {
      selectedIds = {lessons.first.id};
    }
  }

  @override
  Widget build(BuildContext context) {
    final allSelected = selectedIds.length == lessons.length;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('انتخاب درس‌ها'),
        ),
        actions: [
          TextButton(
            onPressed: () => setState(() {
              selectedIds = allSelected ? {} : lessons.map((l) => l.id).toSet();
            }),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                allSelected ? 'هیچکدام' : 'انتخاب همه',
                style: const TextStyle(color: Color(0xFF00E5FF)),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(14),
                  itemCount: lessons.length,
                  itemBuilder: (_, i) {
                    final l = lessons[i];
                    final checked = selectedIds.contains(l.id);
                    return Card(
                      color: Colors.white.withOpacity(.035),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: CheckboxListTile(
                        value: checked,
                        activeColor: const Color(0xFF00E5FF),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(l.subtitle,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text(l.title, style: const TextStyle(color: Colors.white38)),
                        onChanged: (v) => setState(() {
                          if (v ?? false) {
                            selectedIds.add(l.id);
                          } else {
                            selectedIds.remove(l.id);
                          }
                        }),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: selectedIds.isEmpty
                      ? null
                      : () => Navigator.pop(
                            context,
                            lessons.where((l) => selectedIds.contains(l.id)).toList(),
                          ),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: Text('شروع (${selectedIds.length} درس انتخاب شده)'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
