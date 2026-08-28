// ============================================================
// SCENE PROGRESS SERVICE
// Persists which words the user has already tapped/learned in
// each scene, using shared_preferences (already a dependency).
// Self-contained: does not depend on any other app class.
// ============================================================
import 'package:shared_preferences/shared_preferences.dart';

class SceneProgressService {
  static const _prefix = 'scene_progress_';

  /// Returns the set of word ids the user has already seen in [sceneId].
  static Future<Set<String>> getSeenWordIds(String sceneId) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('$_prefix$sceneId') ?? [];
    return stored.toSet();
  }

  /// Marks [wordId] as seen inside [sceneId] and persists it.
  static Future<void> markWordSeen(String sceneId, String wordId) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_prefix$sceneId';
    final current = prefs.getStringList(key) ?? [];
    if (!current.contains(wordId)) {
      current.add(wordId);
      await prefs.setStringList(key, current);
    }
  }

  /// Returns how many words have been seen in [sceneId] — handy for
  /// showing "12/30" badges in a lesson list without loading the
  /// full set every time.
  static Future<int> getSeenCount(String sceneId) async {
    final seen = await getSeenWordIds(sceneId);
    return seen.length;
  }

  /// Clears progress for a single scene (e.g. a "reset lesson" option).
  static Future<void> resetScene(String sceneId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_prefix$sceneId');
  }
}
