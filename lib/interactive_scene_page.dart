import 'package:flutter/material.dart';
import 'interactive_world.dart';

/// صفحه‌ی واسط برای ورود به محیط تعاملی یک درس.
class InteractiveScenePage extends StatelessWidget {
  final int lessonId;

  const InteractiveScenePage({
    super.key,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveWorldPage(
      lessonId: lessonId,
    );
  }
}
