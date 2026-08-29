import 'package:shared_preferences/shared_preferences.dart';

/// مدیریت پیشرفت دنیای تعاملی English Quest.
///
/// برای هر درس، شماره اشیایی که کاربر پیدا کرده ذخیره می‌شود.
class SceneProgressService {
  static const String _keyPrefix = 'scene_progress_';

  /// دریافت لیست اشیای پیدا شده برای یک درس.
  static Future<List<int>> getFoundObjects(int lessonId) async {
    final prefs = await SharedPreferences.getInstance();

    final values = prefs.getStringList('$_keyPrefix$lessonId');

    if (values == null) {
      return <int>[];
    }

    return values
        .map((value) => int.tryParse(value))
        .whereType<int>()
        .toList();
  }

  /// ذخیره لیست اشیای پیدا شده برای یک درس.
  static Future<void> saveFoundObjects(
    int lessonId,
    List<int> objectIndexes,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final uniqueIndexes = objectIndexes.toSet().toList()..sort();

    await prefs.setStringList(
      '$_keyPrefix$lessonId',
      uniqueIndexes.map((index) => index.toString()).toList(),
    );
  }

  /// ثبت یک شیء به عنوان پیدا شده.
  static Future<void> markObjectFound(
    int lessonId,
    int objectIndex,
  ) async {
    final objects = await getFoundObjects(lessonId);

    if (!objects.contains(objectIndex)) {
      objects.add(objectIndex);
      await saveFoundObjects(lessonId, objects);
    }
  }

  /// بررسی اینکه یک شیء قبلاً پیدا شده یا نه.
  static Future<bool> isObjectFound(
    int lessonId,
    int objectIndex,
  ) async {
    final objects = await getFoundObjects(lessonId);
    return objects.contains(objectIndex);
  }

  /// تعداد اشیای پیدا شده.
  static Future<int> getFoundCount(int lessonId) async {
    final objects = await getFoundObjects(lessonId);
    return objects.length;
  }

  /// پاک کردن پیشرفت یک درس.
  static Future<void> clearLessonProgress(int lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_keyPrefix$lessonId');
  }

  /// پاک کردن تمام پیشرفت دنیای تعاملی.
  static Future<void> clearAllProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys().where(
      (key) => key.startsWith(_keyPrefix),
    );

    for (final key in keys) {
      await prefs.remove(key);
    }
  }
}
