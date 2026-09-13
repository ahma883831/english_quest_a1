import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';
import 'writing_topics.dart';

// ============================================================
// WRITING HUB — ۳۰ موضوع؛ برای هرکدوم یک فضای نوشتن جمله داری.
// متن هر موضوع به‌صورت جدا و به‌محض تایپ (با کمی تأخیر) ذخیره می‌شه.
// ============================================================
class WritingHubPage extends StatefulWidget {
  const WritingHubPage({super.key});
  @override
  State<WritingHubPage> createState() => _WritingHubPageState();
}

class _WritingHubPageState extends State<WritingHubPage> {
  final Map<int, String> _cache = {};

  @override
  void initState() {
    super.initState();
    for (final t in writingTopics) {
      _cache[t.id] = AppStorage.loadWritingText(t.id);
    }
  }

  Future<void> _openTopic(WritingTopic topic) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => WritingTopicPage(topic: topic, initialText: _cache[topic.id] ?? '')),
    );
    if (result != null) {
      setState(() => _cache[topic.id] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final done = _cache.values.where((v) => v.trim().isNotEmpty).length;
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('نوشتن')),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const NeonBackground(),
        Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 6),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(children: [
                const Expanded(
                  child: Text(
                    'برای هر موضوع، چند جمله‌ی انگلیسی درباره‌ش بنویس',
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00E5A0).withOpacity(.14),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF00E5A0).withOpacity(.4)),
                  ),
                  child: Text('$done/${writingTopics.length}', style: const TextStyle(color: Color(0xFF00E5A0), fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 24),
              itemCount: writingTopics.length,
              itemBuilder: (_, i) {
                final topic = writingTopics[i];
                final hasText = (_cache[topic.id] ?? '').trim().isNotEmpty;
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 200 + i * 15),
                  builder: (_, v, child) => Opacity(opacity: v, child: Transform.translate(offset: Offset(0, 12 * (1 - v)), child: child)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => _openTopic(topic),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.035),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: (hasText ? const Color(0xFF00E5A0) : const Color(0xFF1E9DFF)).withOpacity(.25)),
                      ),
                      child: Row(children: [
                        Icon(hasText ? Icons.check_circle_rounded : Icons.edit_note_rounded,
                            color: hasText ? const Color(0xFF00E5A0) : const Color(0xFF00E5FF)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(topic.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const Icon(Icons.chevron_left_rounded, color: Colors.white38),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ]),
    );
  }
}

class WritingTopicPage extends StatefulWidget {
  final WritingTopic topic;
  final String initialText;
  const WritingTopicPage({super.key, required this.topic, required this.initialText});
  @override
  State<WritingTopicPage> createState() => _WritingTopicPageState();
}

class _WritingTopicPageState extends State<WritingTopicPage> {
  late final TextEditingController controller = TextEditingController(text: widget.initialText);
  Timer? _debounce;
  bool _saved = true;

  void _onChanged(String value) {
    setState(() => _saved = false);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await AppStorage.saveWritingText(widget.topic.id, value);
      if (mounted) setState(() => _saved = true);
    });
  }

  Future<bool> _onWillPop() async {
    _debounce?.cancel();
    await AppStorage.saveWritingText(widget.topic.id, controller.text);
    Navigator.pop(context, controller.text);
    return false;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Directionality(textDirection: TextDirection.rtl, child: Text(widget.topic.title)),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: _onWillPop,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Center(
                child: Text(
                  _saved ? '✓ ذخیره شد' : '...',
                  style: TextStyle(color: _saved ? const Color(0xFF00E5A0) : Colors.white38, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        body: Stack(children: [
          const NeonBackground(),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'چند جمله‌ی انگلیسی درباره‌ی «${widget.topic.title}» بنویس. می‌تونی هر وقت خواستی برگردی و ادامه بدی.',
                  style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.6),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.035),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.18)),
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: _onChanged,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                    decoration: const InputDecoration(
                      hintText: 'I usually...\nMy family...\n...',
                      hintStyle: TextStyle(color: Colors.white24),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
