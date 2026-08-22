// lessons_data.dart
// English Quest A1 - Full lesson data
// Models: Word, Example, Question, Lesson

class Word {
  final String word;
  final String meaning; // Persian meaning
  final String pronunciation; // phonetic guide, e.g. "HA-pee"
  final String emoji;
  const Word(this.word, this.meaning, this.pronunciation, this.emoji);
}

class Example {
  final String sentence; // English sentence
  final String translation; // Persian translation
  const Example(this.sentence, this.translation);
}

class Question {
  final String text;
  final List<String> options;
  final String answer;
  const Question(this.text, this.options, this.answer);
}

class Lesson {
  final int id;
  final String title;
  final String subtitle;
  final String grammarExplanation; // full grammar explanation (Persian + English examples)
  final List<Word> words; // 30 unique words
  final List<Example> examples; // 30 example sentences
  final List<Question> questions; // 30 questions
  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.grammarExplanation,
    required this.words,
    required this.examples,
    required this.questions,
  });
}

// ==========================================================
// LESSON 1: Greetings & Introductions
// ==========================================================
final lesson1 = Lesson(
  id: 1,
  title: 'Greetings & Introductions',
  subtitle: 'سلام و احوال‌پرسی و معرفی خود',
  grammarExplanation:
      'برای معرفی خودمون از فعل "to be" استفاده می‌کنیم:\n'
      'I am (I\'m) = من هستم\n'
      'You are (You\'re) = تو هستی\n'
      'He/She is = او هست\n\n'
      'مثال: "I am Ahmad." = من احمد هستم.\n'
      '"What is your name?" = اسم شما چیه؟\n'
      '"Nice to meet you." = از آشناییت خوشحالم.\n\n'
      'برای احوال‌پرسی: "How are you?" (حالت چطوره؟) و جواب معمول: "I\'m fine, thank you."',
  words: const [
    Word('hello', 'سلام', 'heh-LOH', '👋'),
    Word('hi', 'سلام (غیررسمی)', 'HAI', '🙋'),
    Word('goodbye', 'خداحافظ', 'good-BAI', '👋'),
    Word('bye', 'بای', 'BAI', '👋'),
    Word('name', 'اسم', 'NEYM', '📛'),
    Word('nice', 'خوب/دلپذیر', 'NAIS', '😊'),
    Word('meet', 'ملاقات کردن', 'MEET', '🤝'),
    Word('morning', 'صبح', 'MOR-ning', '🌅'),
    Word('afternoon', 'بعدازظهر', 'af-ter-NOON', '☀️'),
    Word('evening', 'عصر', 'EEV-ning', '🌆'),
    Word('night', 'شب', 'NAIT', '🌙'),
    Word('please', 'لطفاً', 'PLEEZ', '🙏'),
    Word('thanks', 'ممنون', 'THANKS', '🙌'),
    Word('welcome', 'خوش آمدید', 'WEL-kum', '🎉'),
    Word('sorry', 'ببخشید', 'SOR-ee', '😔'),
    Word('excuse', 'عذر خواستن', 'ex-KYOOZ', '🙇'),
    Word('friend', 'دوست', 'FREND', '👫'),
    Word('fine', 'خوب (حال)', 'FAIN', '👍'),
    Word('great', 'عالی', 'GREYT', '🌟'),
    Word('okay', 'خوبه/باشه', 'oh-KEY', '👌'),
    Word('yes', 'بله', 'YES', '✅'),
    Word('no', 'نه', 'NOH', '❌'),
    Word('please_repeat', 'تکرار کن', 'ree-PEET', '🔁'),
    Word('teacher', 'معلم', 'TEE-cher', '🍎'),
    Word('student', 'دانش‌آموز', 'STOO-dent', '🎓'),
    Word('how', 'چطور', 'HOW', '❓'),
    Word('what', 'چی', 'WUT', '❓'),
    Word('who', 'کی', 'HOO', '❓'),
    Word('old', 'سن/قدیمی', 'OHLD', '🎂'),
    Word('welcome_back', 'خوش برگشتی', 'wel-kum-BAK', '🏠'),
  ],
  examples: const [
    Example('Hello, my name is Ahmad.', 'سلام، اسم من احمده.'),
    Example('Hi! How are you?', 'سلام! حالت چطوره؟'),
    Example('Good morning, teacher!', 'صبح بخیر، معلم!'),
    Example('Good afternoon, everyone.', 'عصر بخیر، همگی.'),
    Example('Good evening, Sara.', 'عصر بخیر، سارا.'),
    Example('Good night, see you tomorrow.', 'شب بخیر، فردا می‌بینمت.'),
    Example('Nice to meet you.', 'از آشناییت خوشحالم.'),
    Example('What is your name?', 'اسمت چیه؟'),
    Example('My name is Sara.', 'اسم من ساراست.'),
    Example('I am fine, thank you.', 'خوبم، ممنون.'),
    Example('How old are you?', 'چند سالته؟'),
    Example('I am sixteen years old.', 'من شانزده سالمه.'),
    Example('This is my friend.', 'این دوست من است.'),
    Example('Thank you very much.', 'خیلی ممنون.'),
    Example('You are welcome.', 'خواهش می‌کنم.'),
    Example('I am sorry.', 'متاسفم.'),
    Example('Excuse me, please.', 'ببخشید، لطفاً.'),
    Example('Yes, I understand.', 'بله، متوجه شدم.'),
    Example('No, I don\'t understand.', 'نه، متوجه نشدم.'),
    Example('Can you repeat, please?', 'می‌تونی تکرار کنی، لطفاً؟'),
    Example('Who is your teacher?', 'معلمت کیه؟'),
    Example('She is my teacher.', 'او معلم من است.'),
    Example('He is a student.', 'او دانش‌آموز است.'),
    Example('Everything is okay.', 'همه‌چیز خوبه.'),
    Example('That is great news.', 'این خبر عالیه.'),
    Example('Goodbye, see you soon.', 'خداحافظ، به‌زودی می‌بینمت.'),
    Example('Bye bye!', 'بای بای!'),
    Example('Welcome back to class.', 'به کلاس خوش برگشتی.'),
    Example('How is your family?', 'خانواده‌ات چطورن؟'),
    Example('What is this?', 'این چیه؟'),
  ],
  questions: const [
    Question('What does "hello" mean?', ['سلام', 'خداحافظ', 'ممنون', 'ببخشید'], 'سلام'),
    Question('How do you say "خداحافظ"?', ['Hello', 'Goodbye', 'Please', 'Sorry'], 'Goodbye'),
    Question('"My ___ is Ahmad." (fill the blank)', ['name', 'friend', 'night', 'okay'], 'name'),
    Question('What does "friend" mean?', ['معلم', 'دوست', 'دانش‌آموز', 'اسم'], 'دوست'),
    Question('Complete: "Nice to ___ you."', ['meet', 'morning', 'bye', 'no'], 'meet'),
    Question('How do you say "صبح بخیر"?', ['Good night', 'Good morning', 'Good evening', 'Goodbye'], 'Good morning'),
    Question('What does "thanks" mean?', ['ممنون', 'ببخشید', 'بله', 'نه'], 'ممنون'),
    Question('Complete: "I am ___, thank you."', ['fine', 'name', 'teacher', 'night'], 'fine'),
    Question('What does "sorry" mean?', ['خوب', 'ببخشید', 'عالی', 'دوست'], 'ببخشید'),
    Question('How do you say "بله"?', ['No', 'Yes', 'Okay', 'What'], 'Yes'),
    Question('What does "teacher" mean?', ['دانش‌آموز', 'معلم', 'دوست', 'اسم'], 'معلم'),
    Question('Complete: "How ___ are you?"', ['old', 'name', 'bye', 'fine'], 'old'),
    Question('What does "student" mean?', ['معلم', 'دانش‌آموز', 'دوست', 'صبح'], 'دانش‌آموز'),
    Question('How do you say "عصر بخیر"?', ['Good morning', 'Good afternoon', 'Good evening', 'Good night'], 'Good evening'),
    Question('What does "welcome" mean?', ['خوش آمدید', 'خداحافظ', 'ببخشید', 'بله'], 'خوش آمدید'),
    Question('Complete: "Excuse ___, please."', ['me', 'you', 'name', 'fine'], 'me'),
    Question('What does "great" mean?', ['بد', 'عالی', 'خوب', 'ببخشید'], 'عالی'),
    Question('How do you say "چی"?', ['Who', 'How', 'What', 'No'], 'What'),
    Question('What does "night" mean?', ['شب', 'صبح', 'عصر', 'بعدازظهر'], 'شب'),
    Question('Complete: "___ are you?" (asking wellbeing)', ['How', 'What', 'Who', 'No'], 'How'),
    Question('What does "who" mean?', ['چی', 'کی', 'چطور', 'کجا'], 'کی'),
    Question('How do you say "نه"?', ['Yes', 'No', 'Okay', 'Please'], 'No'),
    Question('What does "please" mean?', ['لطفاً', 'ممنون', 'ببخشید', 'بله'], 'لطفاً'),
    Question('Complete: "This is my ___."', ['friend', 'morning', 'yes', 'sorry'], 'friend'),
    Question('What does "okay" mean?', ['بد', 'خوبه/باشه', 'ببخشید', 'نه'], 'خوبه/باشه'),
    Question('How do you say "خوش آمدید"?', ['Sorry', 'Welcome', 'Bye', 'Fine'], 'Welcome'),
    Question('What does "morning" mean?', ['صبح', 'شب', 'عصر', 'بعدازظهر'], 'صبح'),
    Question('Complete: "___ to meet you."', ['Nice', 'Old', 'Bye', 'No'], 'Nice'),
    Question('What does "afternoon" mean?', ['صبح', 'شب', 'بعدازظهر', 'عصر'], 'بعدازظهر'),
    Question('How do you say "خیلی ممنون"?', ['Thank you very much', 'Good morning', 'No problem', 'See you'], 'Thank you very much'),
  ],
);

// More lessons (2, 3, ...) will be added in the next files/messages.
// To use: create a list `allLessons = [lesson1, lesson2, ...]` in your app.

