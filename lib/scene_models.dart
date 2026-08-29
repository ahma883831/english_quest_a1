/// مدل‌های دنیای تعاملی English Quest
///
/// این فایل فقط مدل‌های WorldHotspot و WorldScene را نگه می‌دارد.
/// داده‌های محیط‌ها و رابط کاربری در interactive_world.dart قرار دارند.

class WorldHotspot {
  final String word;
  final String meaning;
  final String emoji;
  final String sentence;

  const WorldHotspot({
    required this.word,
    required this.meaning,
    required this.emoji,
    required this.sentence,
  });
}

class WorldScene {
  final int id;
  final String title;
  final String subtitle;
  final String emoji;
  final List<WorldHotspot> objects;

  const WorldScene({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.objects,
  });
}
