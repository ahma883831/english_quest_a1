import 'dart:math';
import 'package:flutter/material.dart';
import 'models.dart';
import 'lessons_data.dart';

// ============================================================
// LESSON PICKER — همون MultiLessonPickerPage قبلی (که توی main.dart
// بود)، به‌علاوه‌ی پارامتر initialSelected (برای وقتی که از قبل چند
// درس انتخاب شده و کاربر می‌خواد تغییرشون بده)، و تابع کمکی
// pickShuffledQuestions که یک استخر از سؤال‌ها/جمله‌ها می‌گیره،
// به‌هم می‌ریزتش و تعداد دلخواه رو برمی‌گردونه (برای هر بار تمرین،
// سؤال‌های متنوع و تصادفی).
// ============================================================
class MultiLessonPickerPage extends StatefulWidget {
  final List<Lesson>? initialSelected;
  const MultiLessonPickerPage({super.key, this.initialSelected});
  @override
  State<MultiLessonPickerPage> createState() => _MultiLessonPickerPageState();
}

class _MultiLessonPickerPageState extends State<MultiLessonPickerPage> {
  final Set<int> selected = {};

  @override
  void initState() {
    super.initState();
    if (widget.initialSelected != null) {
      selected.addAll(widget.initialSelected!.map((l) => l.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Directionality(textDirection: TextDirection.rtl, child: Text('انتخاب درس‌ها')),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => setState(() => selected.addAll(lessons.map((l) => l.id))),
                      child: const Text('انتخاب همه'),
                    ),
                    TextButton(
                      onPressed: () => setState(() => selected.clear()),
                      child: const Text('پاک کردن'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: lessons.length,
                  itemBuilder: (context, i) {
                    final l = lessons[i];
                    final isOn = selected.contains(l.id);
                    return CheckboxListTile(
                      value: isOn,
                      onChanged: (v) => setState(() {
                        if (v == true) {
                          selected.add(l.id);
                        } else {
                          selected.remove(l.id);
                        }
                      }),
                      activeColor: const Color(0xFF00E5FF),
                      title: Text(l.subtitle, style: const TextStyle(color: Colors.white)),
                      subtitle: Text(l.title, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selected.isEmpty
                        ? null
                        : () {
                            final chosen = lessons.where((l) => selected.contains(l.id)).toList();
                            Navigator.pop(context, chosen);
                          },
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(selected.isEmpty ? 'حداقل یک درس انتخاب کن' : 'شروع (${selected.length} درس)'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// یک استخر از آیتم‌ها (جمله/سؤال/هرچیز دیگه) می‌گیره، به‌هم می‌ریزتش و
/// تا سقف [count] تا از اون‌ها رو برمی‌گردونه. اگه استخر کوچیک‌تر از
/// [count] باشه، همه‌ی استخرِ به‌هم‌ریخته رو برمی‌گردونه (بدون تکرار).
List<T> pickShuffledQuestions<T>(List<T> pool, int count) {
  final shuffled = List<T>.from(pool)..shuffle(Random());
  return shuffled.take(min(count, shuffled.length)).toList();
}
