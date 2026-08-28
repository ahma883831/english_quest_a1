import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WorldWord {
  final String word;
  final String meaning;
  final String pronunciation;
  final String emoji;
  final String sentence;

  const WorldWord({
    required this.word,
    required this.meaning,
    required this.pronunciation,
    required this.emoji,
    required this.sentence,
  });
}

class FarmWorldPage extends StatefulWidget {
  const FarmWorldPage({super.key});

  @override
  State<FarmWorldPage> createState() => _FarmWorldPageState();
}

class _FarmWorldPageState extends State<FarmWorldPage> {
  final FlutterTts _tts = FlutterTts();

  int discovered = 0;
  WorldWord? selectedWord;

  final List<WorldWord> words = const [
    WorldWord(
      word: 'Sheep',
      meaning: 'گوسفند',
      pronunciation: 'شیپ',
      emoji: '🐑',
      sentence: 'The sheep is eating grass.',
    ),
    WorldWord(
      word: 'Cow',
      meaning: 'گاو',
      pronunciation: 'کاو',
      emoji: '🐄',
      sentence: 'The cow is eating.',
    ),
    WorldWord(
      word: 'Horse',
      meaning: 'اسب',
      pronunciation: 'هورس',
      emoji: '🐎',
      sentence: 'The horse is running.',
    ),
    WorldWord(
      word: 'Chicken',
      meaning: 'مرغ',
      pronunciation: 'چیکِن',
      emoji: '🐔',
      sentence: 'The chicken is walking.',
    ),
    WorldWord(
      word: 'Dog',
      meaning: 'سگ',
      pronunciation: 'داگ',
      emoji: '🐕',
      sentence: 'The dog is running.',
    ),
    WorldWord(
      word: 'Cat',
      meaning: 'گربه',
      pronunciation: 'کَت',
      emoji: '🐈',
      sentence: 'The cat is sleeping.',
    ),
    WorldWord(
      word: 'Farmer',
      meaning: 'کشاورز',
      pronunciation: 'فارمِر',
      emoji: '🧑‍🌾',
      sentence: 'The farmer works on the farm.',
    ),
    WorldWord(
      word: 'Barn',
      meaning: 'انبار / طویله',
      pronunciation: 'بارن',
      emoji: '🏚️',
      sentence: 'The animals are in the barn.',
    ),
    WorldWord(
      word: 'Grass',
      meaning: 'علف',
      pronunciation: 'گِرَس',
      emoji: '🌿',
      sentence: 'The sheep eats grass.',
    ),
    WorldWord(
      word: 'Tree',
      meaning: 'درخت',
      pronunciation: 'تری',
      emoji: '🌳',
      sentence: 'The tree is tall.',
    ),
    WorldWord(
      word: 'Flower',
      meaning: 'گل',
      pronunciation: 'فلاوِر',
      emoji: '🌸',
      sentence: 'The flower is beautiful.',
    ),
    WorldWord(
      word: 'Water',
      meaning: 'آب',
      pronunciation: 'واتِر',
      emoji: '💧',
      sentence: 'The animals drink water.',
    ),
    WorldWord(
      word: 'Bucket',
      meaning: 'سطل',
      pronunciation: 'باکِت',
      emoji: '🪣',
      sentence: 'The bucket is full of water.',
    ),
    WorldWord(
      word: 'Fence',
      meaning: 'حصار',
      pronunciation: 'فِنس',
      emoji: '🪵',
      sentence: 'The fence is around the farm.',
    ),
    WorldWord(
      word: 'Field',
      meaning: 'مزرعه',
      pronunciation: 'فیلد',
      emoji: '🌾',
      sentence: 'The farmer works in the field.',
    ),
    WorldWord(
      word: 'Tractor',
      meaning: 'تراکتور',
      pronunciation: 'تِرَکتِر',
      emoji: '🚜',
      sentence: 'The tractor is in the field.',
    ),
    WorldWord(
      word: 'House',
      meaning: 'خانه',
      pronunciation: 'هاوس',
      emoji: '🏠',
      sentence: 'The farmer lives in the house.',
    ),
    WorldWord(
      word: 'Gate',
      meaning: 'دروازه',
      pronunciation: 'گِیت',
      emoji: '🚪',
      sentence: 'The gate is open.',
    ),
    WorldWord(
      word: 'Road',
      meaning: 'جاده',
      pronunciation: 'رود',
      emoji: '🛣️',
      sentence: 'The road goes to the farm.',
    ),
    WorldWord(
      word: 'Milk',
      meaning: 'شیر',
      pronunciation: 'میلک',
      emoji: '🥛',
      sentence: 'The cow gives milk.',
    ),
    WorldWord(
      word: 'Egg',
      meaning: 'تخم‌مرغ',
      pronunciation: 'اِگ',
      emoji: '🥚',
      sentence: 'The chicken lays an egg.',
    ),
    WorldWord(
      word: 'Animal',
      meaning: 'حیوان',
      pronunciation: 'اَنیمِل',
      emoji: '🐾',
      sentence: 'This is an animal.',
    ),
    WorldWord(
      word: 'Food',
      meaning: 'غذا',
      pronunciation: 'فود',
      emoji: '🍎',
      sentence: 'Animals need food.',
    ),
    WorldWord(
      word: 'Eat',
      meaning: 'خوردن',
      pronunciation: 'ایت',
      emoji: '🍽️',
      sentence: 'The sheep eats grass.',
    ),
    WorldWord(
      word: 'Drink',
      meaning: 'نوشیدن',
      pronunciation: 'دِرینک',
      emoji: '🥤',
      sentence: 'The cow drinks water.',
    ),
    WorldWord(
      word: 'Walk',
      meaning: 'راه رفتن',
      pronunciation: 'واک',
      emoji: '🚶',
      sentence: 'The farmer walks to the barn.',
    ),
    WorldWord(
      word: 'Run',
      meaning: 'دویدن',
      pronunciation: 'ران',
      emoji: '🏃',
      sentence: 'The horse can run.',
    ),
    WorldWord(
      word: 'Sleep',
      meaning: 'خوابیدن',
      pronunciation: 'سلیپ',
      emoji: '😴',
      sentence: 'The dog is sleeping.',
    ),
    WorldWord(
      word: 'Mountain',
      meaning: 'کوه',
      pronunciation: 'ماونتِن',
      emoji: '⛰️',
      sentence: 'The farm is near the mountain.',
    ),
    WorldWord(
      word: 'Farm',
      meaning: 'مزرعه',
      pronunciation: 'فارم',
      emoji: '🌄',
      sentence: 'This is a beautiful farm.',
    ),
  ];

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.42);
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }

  void _selectWord(WorldWord word) {
    final bool firstTime = selectedWord == null ||
        selectedWord!.word != word.word;

    setState(() {
      selectedWord = word;

      if (firstTime) {
        discovered++;
      }
    });

    _speak(word.word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '🌍 English World',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Text(
                '$discovered / 30',
                style: const TextStyle(
                  color: Color(0xFF00E5FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildWorld(),
            ),
            if (selectedWord != null)
              _buildWordCard(selectedWord!),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF123A45),
            Color(0xFF102039),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF00E5FF),
          width: .6,
        ),
      ),
      child: const Row(
        children: [
          Text(
            '🐑',
            style: TextStyle(fontSize: 42),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Farm Adventure',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Explore the farm and discover English.',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorld() {
    return InteractiveViewer(
      minScale: .75,
      maxScale: 2.5,
      boundaryMargin: const EdgeInsets.all(80),
      child: Center(
        child: Container(
          width: 850,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF62B7E8),
                Color(0xFF9DDC78),
                Color(0xFF4B9A45),
              ],
              stops: [0, .42, 1],
            ),
          ),
          child: Stack(
            children: [
              _object('☀️', 55, 35, null),
              _object('⛰️', 100, 100, words[28]),
              _object('🌳', 300, 80, words[9]),
              _object('🌳', 650, 110, words[9]),
              _object('🏠', 610, 290, words[16]),
              _object('🏚️', 440, 250, words[7]),
              _object('🚜', 180, 390, words[15]),
              _object('🐑', 330, 400, words[0]),
              _object('🐄', 500, 400, words[1]),
              _object('🐎', 650, 420, words[2]),
              _object('🐔', 750, 350, words[3]),
              _object('🐕', 250, 280, words[4]),
              _object('🐈', 380, 300, words[5]),
              _object('🧑‍🌾', 520, 180, words[6]),
              _object('🌿', 120, 450, words[8]),
              _object('🌸', 720, 500, words[10]),
              _object('💧', 430, 480, words[11]),
              _object('🪣', 550, 475, words[12]),
              _object('🌾', 90, 310, words[14]),
              _object('🚪', 690, 285, words[17]),
              _object('🛣️', 400, 540, words[18]),
              _object('🥛', 580, 520, words[19]),
              _object('🥚', 760, 450, words[20]),
              _object('🐾', 50, 520, words[21]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _object(
    String emoji,
    double left,
    double top,
    WorldWord? word,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: word == null
            ? null
            : () => _selectWord(word),
        child: AnimatedScale(
          scale: selectedWord?.word == word?.word
              ? 1.25
              : 1.0,
          duration:
              const Duration(milliseconds: 180),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: word == null
                  ? Colors.transparent
                  : Colors.black.withOpacity(.10),
              borderRadius:
                  BorderRadius.circular(18),
            ),
            child: Text(
              emoji,
              style:
                  const TextStyle(fontSize: 48),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWordCard(WorldWord word) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        14,
        8,
        14,
        14,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF101C31),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF00E5FF)
              .withOpacity(.45),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00E5FF)
                .withOpacity(.08),
            blurRadius: 25,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                word.emoji,
                style:
                    const TextStyle(fontSize: 42),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      word.word,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color:
                            Color(0xFF00E5FF),
                      ),
                    ),
                    Text(
                      word.pronunciation,
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () =>
                    _speak(word.word),
                icon: const Icon(
                  Icons.volume_up_rounded,
                  color: Color(0xFF00E5FF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            word.meaning,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(.04),
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Text(
              word.sentence,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
