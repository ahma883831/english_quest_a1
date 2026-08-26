// ============================================================
// GRAMMAR REFERENCE — one searchable page that lists every lesson's
// grammar point + formula, pulled straight from the existing
// `lessons` data (each Lesson already carries .explanation and .formula).
// ============================================================
import 'package:flutter/material.dart';
import 'models.dart';
import 'lessons_data.dart';

class GrammarReferencePage extends StatefulWidget {
  const GrammarReferencePage({super.key});
  @override
  State<GrammarReferencePage> createState() => _GrammarReferencePageState();
}

class _GrammarReferencePageState extends State<GrammarReferencePage> {
  final TextEditingController searchCtrl = TextEditingController();
  String query = '';
  int? expandedId;

  List<Lesson> get _filtered {
    if (query.trim().isEmpty) return lessons;
    final q = query.trim().toLowerCase();
    return lessons.where((l) {
      return l.title.toLowerCase().contains(q) ||
          l.subtitle.toLowerCase().contains(q) ||
          l.formula.toLowerCase().contains(q) ||
          l.explanation.toLowerCase().contains(q);
    }).toList();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('مرجع گرامر')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackgroundGrammar(),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: searchCtrl,
                  onChanged: (v) => setState(() => query = v),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'جستجو در قواعد گرامری...',
                    prefixIcon: const Icon(Icons.search_rounded, color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(.05),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('چیزی پیدا نشد', style: TextStyle(color: Colors.white54)),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 24),
                      itemCount: items.length,
                      itemBuilder: (_, i) => _GrammarCard(
                        lesson: items[i],
                        expanded: expandedId == items[i].id,
                        onTap: () => setState(() => expandedId = expandedId == items[i].id ? null : items[i].id),
                      ),
                    ),
            ),
          ]),
        ),
      ]),
    );
  }
}

class _GrammarCard extends StatelessWidget {
  final Lesson lesson;
  final bool expanded;
  final VoidCallback onTap;
  const _GrammarCard({required this.lesson, required this.expanded, required this.onTap});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.035),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF00E5FF).withOpacity(expanded ? .45 : .16)),
        ),
        child: Column(children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(children: [
                  Container(
                    width: 34,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(colors: [Color(0xFF0066FF), Color(0xFF00C8FF)]),
                    ),
                    child: Text('${lesson.id}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 2),
                      Text(lesson.subtitle, style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    ]),
                  ),
                  Icon(expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: Colors.white38),
                ]),
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 220),
            crossFadeState: expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Divider(color: Colors.white12, height: 20),
                  Text(lesson.explanation, style: const TextStyle(fontSize: 14, height: 1.8, color: Colors.white70)),
                  const SizedBox(height: 12),
                  const Text('فرمول', style: TextStyle(fontSize: 12, color: Colors.white38, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C8FF).withOpacity(.08),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.25)),
                    ),
                    child: Text(
                      lesson.formula,
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 15, height: 1.7, fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),
              ),
            ),
            secondChild: const SizedBox(width: double.infinity),
          ),
        ]),
      );
}

// Local copy of the app's glow background so this file has no
// dependency on main.dart's private widgets.
class NeonBackgroundGrammar extends StatelessWidget {
  const NeonBackgroundGrammar({super.key});
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
