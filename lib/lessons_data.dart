
// ==========================================================
// LESSON 1: Greetings & Introductions
// ==========================================================
final lesson1 = Lesson(
  id: 1,
  title: 'Greetings & Introductions',
  subtitle: 'سلام و احوال‌پرسی و معرفی خود',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور خودت رو معرفی کنی، به کسی سلام بدی، و بپرسی حالش چطوره — با استفاده از فعل "to be" (am/is/are).\n\n'
      '📌 نکات مهم\n'
      '۱. فعل to be بسته به فاعل تغییر می‌کنه: I am, You are, He/She/It is, We/You/They are.\n'
      '۲. برای کوتاه‌کردن، معمولاً می‌نویسیم: I\'m, You\'re, He\'s, She\'s, We\'re, They\'re.\n'
      '۳. "Hi" غیررسمی‌تر از "Hello" است — با دوستان از Hi استفاده کن.\n'
      '۴. "Good morning/afternoon/evening" بسته به ساعت روز فرق می‌کنه؛ "Good night" فقط برای خداحافظی موقع خواب استفاده میشه.\n'
      '۵. جواب "How are you?" معمولاً "I\'m fine, thank you. And you?" است — یعنی سوال رو برمی‌گردونی.\n'
      '۶. برای پرسیدن اسم می‌گیم "What is your name?" و جواب می‌دیم "My name is..." یا فقط "I\'m...".',

  formula:
      'I → am (I\'m)\n'
      'You/We/They → are (You\'re)\n'
      'He/She/It → is (He\'s / She\'s)\n\n'
      'What is your name? → My name is ...\n'
      'How are you? → I\'m fine, thank you.',

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
    Word('repeat', 'تکرار کن', 'ree-PEET', '🔁'),
    Word('teacher', 'معلم', 'TEE-cher', '🍎'),
    Word('student', 'دانش‌آموز', 'STOO-dent', '🎓'),
    Word('how', 'چطور', 'HOW', '❓'),
    Word('what', 'چی', 'WUT', '❓'),
    Word('who', 'کی', 'HOO', '❓'),
    Word('old', 'سن/قدیمی', 'OHLD', '🎂'),
    Word('back', 'برگشتن', 'BAK', '🏠'),
  ],

  examples: const [
    'Hello, my name is Ahmad. — سلام، اسم من احمده.',
    'Hi! How are you? — سلام! حالت چطوره؟',
    'Good morning, teacher! — صبح بخیر، معلم!',
    'Good afternoon, everyone. — بعدازظهر بخیر، همگی.',
    'Good evening, Sara. — عصر بخیر، سارا.',
    'Good night, see you tomorrow. — شب بخیر، فردا می‌بینمت.',
    'Nice to meet you. — از آشناییت خوشحالم.',
    'What is your name? — اسمت چیه؟',
    'My name is Sara. — اسم من ساراست.',
    'I am fine, thank you. — خوبم، ممنون.',
    'How old are you? — چند سالته؟',
    'I am sixteen years old. — من شانزده سالمه.',
    'This is my friend. — این دوست من است.',
    'Thank you very much. — خیلی ممنون.',
    'You are welcome. — خواهش می‌کنم.',
    'I am sorry. — متاسفم.',
    'Excuse me, please. — ببخشید، لطفاً.',
    'Yes, I understand. — بله، متوجه شدم.',
    "No, I don't understand. — نه، متوجه نشدم.",
    'Can you repeat, please? — می‌تونی تکرار کنی، لطفاً؟',
    'Who is your teacher? — معلمت کیه؟',
    'She is my teacher. — او معلم من است.',
    'He is a student. — او دانش‌آموز است.',
    'Everything is okay. — همه‌چیز خوبه.',
    'That is great news. — این خبر عالیه.',
    'Goodbye, see you soon. — خداحافظ، به‌زودی می‌بینمت.',
    'Bye bye! — بای بای!',
    'Welcome back to class. — به کلاس خوش برگشتی.',
    'How is your family? — خانواده‌ات چطورن؟',
    'What is this? — این چیه؟',
  ],

  questions: const [
    Question('What does "hello" mean?', ['سلام', 'خداحافظ', 'ممنون', 'ببخشید'], 'سلام'),
    Question('How do you say "خداحافظ"?', ['Hello', 'Goodbye', 'Please', 'Sorry'], 'Goodbye'),
    Question('"My ___ is Ahmad."', ['name', 'friend', 'night', 'okay'], 'name'),
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
    Question('Complete: "___ are you?"', ['How', 'What', 'Who', 'No'], 'How'),
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
);// ==========================================================
// LESSON 2: Family
// ==========================================================
final lesson2 = Lesson(
  id: 2,
  title: 'Family',
  subtitle: 'خانواده',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور درباره‌ی اعضای خانواده‌ات صحبت کنی — با فعل "have/has" و صفت‌های ملکی مثل my و her.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/You/We/They از "have" استفاده می‌کنیم، برای He/She/It از "has".\n'
      '۲. برای مالکیت اسم‌ها، حرف \'s رو به آخر اسم اضافه می‌کنیم: "My father\'s name is Ali."\n'
      '۳. صفت‌های ملکی همیشه قبل از اسم می‌آرن: my brother, her mother, their family.\n'
      '۴. "Married" یعنی متاهل، "Single" یعنی مجرد — این دو صفت هستن و معمولاً با فعل be می‌آیند.\n'
      '۵. برای پرسیدن تعداد فرزندان می‌گیم "How many children do you have?"\n'
      '۶. کلمه "parents" همیشه جمعه (پدر و مادر با هم)، ولی "a parent" یعنی یکی از اون دو.',

  formula:
      'I/You/We/They → have\n'
      'He/She/It → has\n\n'
      'Possessive: my, your, his, her, our, their\n'
      'Ownership: Name\'s + noun (My father\'s name)',

  words: const [
    Word('family', 'خانواده', 'FAM-uh-lee', '👨‍👩‍👧‍👦'),
    Word('father', 'پدر', 'FAH-ther', '👨'),
    Word('mother', 'مادر', 'MUH-ther', '👩'),
    Word('parents', 'والدین', 'PAIR-ents', '👪'),
    Word('brother', 'برادر', 'BRUH-ther', '👦'),
    Word('sister', 'خواهر', 'SIS-ter', '👧'),
    Word('son', 'پسر (فرزند)', 'SUN', '👶'),
    Word('daughter', 'دختر (فرزند)', 'DAW-ter', '👧'),
    Word('grandfather', 'پدربزرگ', 'GRAND-fah-ther', '👴'),
    Word('grandmother', 'مادربزرگ', 'GRAND-muh-ther', '👵'),
    Word('uncle', 'عمو/دایی', 'UNG-kul', '👨'),
    Word('aunt', 'عمه/خاله', 'ANT', '👩'),
    Word('cousin', 'پسرعمو/دخترعمو', 'KUZ-in', '🧑'),
    Word('husband', 'شوهر', 'HUZ-band', '🤵'),
    Word('wife', 'همسر (زن)', 'WAIF', '👰'),
    Word('baby', 'نوزاد', 'BEY-bee', '👶'),
    Word('child', 'کودک', 'CHAILD', '🧒'),
    Word('children', 'کودکان', 'CHIL-dren', '🧒'),
    Word('twins', 'دوقلوها', 'TWINZ', '👯'),
    Word('married', 'متاهل', 'MAIR-eed', '💍'),
    Word('single', 'مجرد', 'SING-gul', '🙋'),
    Word('young', 'جوان', 'YUNG', '🧑'),
    Word('old', 'مسن', 'OHLD', '👴'),
    Word('relative', 'خویشاوند', 'REL-uh-tiv', '👥'),
    Word('lastname', 'نام خانوادگی', 'LAST-neym', '📝'),
    Word('together', 'با هم', 'tuh-GETH-er', '🤝'),
    Word('love', 'دوست داشتن', 'LUV', '❤️'),
    Word('live', 'زندگی کردن', 'LIV', '🏠'),
    Word('house', 'خانه', 'HOWS', '🏡'),
    Word('home', 'خانه (احساسی)', 'HOHM', '🏠'),
  ],

  examples: const [
    'This is my family. — این خانواده‌ی من است.',
    'My father is a doctor. — پدرم دکتر است.',
    'My mother is a teacher. — مادرم معلم است.',
    'I have one brother and one sister. — من یک برادر و یک خواهر دارم.',
    'My parents are kind. — والدینم مهربان هستند.',
    'My grandfather is seventy years old. — پدربزرگم هفتاد ساله است.',
    'My grandmother lives with us. — مادربزرگم با ما زندگی می‌کند.',
    'I have two uncles. — من دو تا عمو دارم.',
    'My aunt is very nice. — عمه‌ام خیلی مهربان است.',
    'He is my cousin. — او پسرعموی من است.',
    'My sister is a student. — خواهرم دانش‌آموز است.',
    'This is my son. — این پسر من است.',
    'That is my daughter. — آن دختر من است.',
    'My parents are married. — والدینم متاهل هستند.',
    'She is single. — او مجرد است.',
    'The baby is sleeping. — نوزاد در حال خواب است.',
    'I love my family. — من خانواده‌ام را دوست دارم.',
    'We live together. — ما با هم زندگی می‌کنیم.',
    'My house is big. — خانه‌ی من بزرگ است.',
    'Home is where the family is. — خانه جایی است که خانواده آنجاست.',
    'They are twins. — آن‌ها دوقلو هستند.',
    'My brother is young. — برادرم جوان است.',
    'My grandmother is old. — مادربزرگم مسن است.',
    'He is a relative of mine. — او یکی از خویشاوندان من است.',
    'What is your family name? — نام خانوادگی شما چیست؟',
    'My husband works hard. — شوهرم سخت کار می‌کند.',
    'My wife is kind. — همسرم مهربان است.',
    'How many children do you have? — چند فرزند دارید؟',
    'I have three children. — من سه فرزند دارم.',
    'Our family is happy. — خانواده‌ی ما خوشحال است.',
  ],

  questions: const [
    Question('What does "father" mean?', ['پدر', 'مادر', 'برادر', 'خواهر'], 'پدر'),
    Question('How do you say "مادر"?', ['Father', 'Mother', 'Sister', 'Brother'], 'Mother'),
    Question('What does "brother" mean?', ['خواهر', 'برادر', 'دختر', 'پسر'], 'برادر'),
    Question('Complete: "I ___ two brothers."', ['have', 'is', 'am', 'are'], 'have'),
    Question('What does "sister" mean?', ['برادر', 'خواهر', 'مادر', 'پدر'], 'خواهر'),
    Question('How do you say "پدربزرگ"?', ['Grandmother', 'Grandfather', 'Uncle', 'Father'], 'Grandfather'),
    Question('What does "grandmother" mean?', ['مادربزرگ', 'پدربزرگ', 'عمه', 'خاله'], 'مادربزرگ'),
    Question('Complete: "She ___ one sister."', ['have', 'has', 'is', 'are'], 'has'),
    Question('What does "uncle" mean?', ['عمو/دایی', 'عمه/خاله', 'پدر', 'مادر'], 'عمو/دایی'),
    Question('How do you say "عمه/خاله"?', ['Uncle', 'Aunt', 'Cousin', 'Sister'], 'Aunt'),
    Question('What does "cousin" mean?', ['پسرعمو/دخترعمو', 'برادر', 'خواهر', 'پدر'], 'پسرعمو/دخترعمو'),
    Question('Complete: "This is ___ family."', ['my', 'me', 'I', 'am'], 'my'),
    Question('What does "children" mean?', ['کودک', 'کودکان', 'نوزاد', 'خانواده'], 'کودکان'),
    Question('How do you say "متاهل"?', ['Single', 'Married', 'Young', 'Old'], 'Married'),
    Question('What does "single" mean?', ['متاهل', 'مجرد', 'جوان', 'مسن'], 'مجرد'),
    Question('Complete: "My father\'s ___ is Ali."', ['name', 'family', 'house', 'love'], 'name'),
    Question('What does "husband" mean?', ['همسر (زن)', 'شوهر', 'پسر', 'دختر'], 'شوهر'),
    Question('How do you say "همسر (زن)"?', ['Husband', 'Wife', 'Mother', 'Sister'], 'Wife'),
    Question('What does "baby" mean?', ['کودک', 'نوزاد', 'دوقلو', 'خانواده'], 'نوزاد'),
    Question('Complete: "We ___ together."', ['live', 'has', 'is', 'am'], 'live'),
    Question('What does "twins" mean?', ['دوقلوها', 'خواهرها', 'برادرها', 'والدین'], 'دوقلوها'),
    Question('How do you say "خانه (احساسی)"?', ['House', 'Home', 'Family', 'Live'], 'Home'),
    Question('What does "relative" mean?', ['دوست', 'خویشاوند', 'همسایه', 'معلم'], 'خویشاوند'),
    Question('Complete: "I ___ my family."', ['love', 'has', 'is', 'name'], 'love'),
    Question('What does "young" mean?', ['مسن', 'جوان', 'کوچک', 'بزرگ'], 'جوان'),
    Question('How do you say "مسن"?', ['Young', 'Old', 'Baby', 'Child'], 'Old'),
    Question('What does "parents" mean?', ['والدین', 'فرزندان', 'خواهر و برادر', 'پدربزرگ و مادربزرگ'], 'والدین'),
    Question('Complete: "My ___ name is Rezaei."', ['family', 'house', 'love', 'live'], 'family'),
    Question('What does "daughter" mean?', ['پسر', 'دختر', 'خواهر', 'مادر'], 'دختر'),
    Question('How do you say "با هم"?', ['Alone', 'Together', 'Family', 'Home'], 'Together'),
  ],
);
// ==========================================================
// LESSON 3: Numbers & Time
// ==========================================================
final lesson3 = Lesson(
  id: 3,
  title: 'Numbers & Time',
  subtitle: 'اعداد و زمان',
  explanation:
      '🎯 هدف درس\n'
      'در این درس اعداد ۱ تا ۱۰۰ رو یاد می‌گیری و می‌آموزی چطور ساعت بپرسی و بگی، و سنت رو بیان کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای پرسیدن ساعت می‌گیم "What time is it?" و جواب با "It is..." شروع میشه.\n'
      '۲. "half past" یعنی نیم، مثلاً "half past 3" = ساعت سه و نیم.\n'
      '۳. "quarter to" یعنی ربع مونده به اون ساعت، "quarter past" یعنی ربع گذشته از اون ساعت.\n'
      '۴. اعداد ترتیبی (first, second, third...) برای بیان ترتیب استفاده میشن، نه شمارش ساده.\n'
      '۵. برای سن می‌گیم "How old are you?" و جواب "I am ... years old." — کلمه "years old" رو فراموش نکن.\n'
      '۶. "today, tomorrow, yesterday" حرف اضافه نمی‌خوان: می‌گیم "Today is Monday." نه "In today".',
  formula:
      'What time is it? → It is ___ o\\'clock.\n'
      'Half past ___  |  Quarter to/past ___\n\n'
      'How old are you? → I am ___ years old.',
  words: const [
    Word('one', 'یک', 'WUN', '1️⃣'),
    Word('two', 'دو', 'TOO', '2️⃣'),
    Word('three', 'سه', 'THREE', '3️⃣'),
    Word('four', 'چهار', 'FOR', '4️⃣'),
    Word('five', 'پنج', 'FAIV', '5️⃣'),
    Word('six', 'شش', 'SIKS', '6️⃣'),
    Word('seven', 'هفت', 'SEV-en', '7️⃣'),
    Word('eight', 'هشت', 'EYT', '8️⃣'),
    Word('nine', 'نه', 'NAIN', '9️⃣'),
    Word('ten', 'ده', 'TEN', '🔟'),
    Word('eleven', 'یازده', 'ee-LEV-en', '1️⃣1️⃣'),
    Word('twelve', 'دوازده', 'TWELV', '1️⃣2️⃣'),
    Word('twenty', 'بیست', 'TWEN-tee', '2️⃣0️⃣'),
    Word('hundred', 'صد', 'HUN-dred', '💯'),
    Word('time', 'زمان/ساعت', 'TAIM', '⏰'),
    Word('hour', 'ساعت (مدت)', 'OW-er', '🕐'),
    Word('minute', 'دقیقه', 'MIN-it', '⏱️'),
    Word('secondTime', 'ثانیه', 'SEK-und', '⏳'),
    Word('clock', 'ساعت (دستگاه)', 'KLOK', '🕰️'),
    Word('early', 'زود', 'ER-lee', '⏰'),
    Word('late', 'دیر', 'LEYT', '⏰'),
    Word('now', 'الان', 'NOW', '👉'),
    Word('today', 'امروز', 'tuh-DEY', '📅'),
    Word('tomorrow', 'فردا', 'tuh-MOR-oh', '📆'),
    Word('yesterday', 'دیروز', 'YES-ter-dey', '📆'),
    Word('first', 'اول', 'FURST', '🥇'),
    Word('secondOrder', 'دوم', 'SEK-und', '🥈'),
    Word('third', 'سوم', 'THURD', '🥉'),
    Word('quarter', 'ربع', 'KWOR-ter', '🍕'),
    Word('half', 'نیم', 'HAF', '🌗'),
  ],
  examples: const [
    'I have one brother. — من یک برادر دارم.',
    'There are two books. — دو تا کتاب هست.',
    'She is three years old. — او سه ساله است.',
    'I have four pens. — من چهار خودکار دارم.',
    'We are five friends. — ما پنج دوست هستیم.',
    "It is six o'clock. — ساعت شش است.",
    'I wake up at seven. — من ساعت هفت بیدار می‌شوم.',
    'School starts at eight. — مدرسه ساعت هشت شروع می‌شود.',
    'I go to bed at nine. — من ساعت نه می‌خوابم.',
    'There are ten students. — ده دانش‌آموز هست.',
    'What time is it? — ساعت چنده؟',
    'It is half past twelve. — ساعت دوازده و نیم است.',
    'I am sixteen years old. — من شانزده سالمه.',
    'There are twenty questions. — بیست سوال هست.',
    'I have a hundred words. — من صد کلمه دارم.',
    'What is the time now? — الان ساعت چنده؟',
    'One hour has sixty minutes. — یک ساعت شصت دقیقه دارد.',
    'Wait a minute, please. — یک دقیقه صبر کن، لطفاً.',
    'The clock is on the wall. — ساعت روی دیوار است.',
    'I am early today. — من امروز زود رسیدم.',
    'He is late for school. — او برای مدرسه دیر کرده.',
    'I am busy right now. — من الان مشغولم.',
    'Today is Monday. — امروز دوشنبه است.',
    'Tomorrow is a holiday. — فردا تعطیل است.',
    'Yesterday was Sunday. — دیروز یکشنبه بود.',
    'This is my first lesson. — این اولین درس من است.',
    'That is the second question. — آن سوال دوم است.',
    'He came in third place. — او سوم شد.',
    'It is a quarter past five. — ساعت پنج و ربع است.',
    'It is half past nine. — ساعت نه و نیم است.',
  ],
  questions: const [
    Question(
      'What does "one" mean?',
      ['یک', 'دو', 'سه', 'چهار'],
      'یک',
    ),
    Question(
      'How do you say "ده"?',
      ['Two', 'Five', 'Ten', 'Nine'],
      'Ten',
    ),
    Question(
      'What does "seven" mean?',
      ['شش', 'هفت', 'هشت', 'نه'],
      'هفت',
    ),
    Question(
      'Complete: "I am sixteen years ___."',
      ['old', 'time', 'now', 'late'],
      'old',
    ),
    Question(
      'What does "hour" mean?',
      ['دقیقه', 'ثانیه', 'ساعت (مدت)', 'زمان'],
      'ساعت (مدت)',
    ),
    Question(
      'How do you say "دقیقه"?',
      ['Hour', 'Minute', 'Second', 'Clock'],
      'Minute',
    ),
    Question(
      'What does "today" mean?',
      ['دیروز', 'فردا', 'امروز', 'الان'],
      'امروز',
    ),
    Question(
      'Complete: "___ is a holiday."',
      ['Tomorrow', 'Early', 'Late', 'Now'],
      'Tomorrow',
    ),
    Question(
      'What does "yesterday" mean?',
      ['امروز', 'فردا', 'دیروز', 'الان'],
      'دیروز',
    ),
    Question(
      'How do you say "زود"?',
      ['Late', 'Early', 'Now', 'Time'],
      'Early',
    ),
    Question(
      'What does "late" mean?',
      ['زود', 'دیر', 'الان', 'امروز'],
      'دیر',
    ),
    Question(
      'Complete: "What ___ is it?"',
      ['time', 'name', 'age', 'day'],
      'time',
    ),
    Question(
      'What does "clock" mean?',
      ['دقیقه', 'ساعت (دستگاه)', 'زمان', 'ثانیه'],
      'ساعت (دستگاه)',
    ),
    Question(
      'How do you say "اول"?',
      ['Second', 'Third', 'First', 'Quarter'],
      'First',
    ),
    Question(
      'What does "half" mean?',
      ['ربع', 'نیم', 'کل', 'ثانیه'],
      'نیم',
    ),
    Question(
      'Complete: "It is ___ past three."',
      ['half', 'first', 'late', 'now'],
      'half',
    ),
    Question(
      'What does "quarter" mean?',
      ['نیم', 'ربع', 'کل', 'ساعت'],
      'ربع',
    ),
    Question(
      'How do you say "بیست"?',
      ['Twelve', 'Twenty', 'Two', 'Ten'],
      'Twenty',
    ),
    Question(
      'What does "hundred" mean?',
      ['ده', 'صد', 'هزار', 'بیست'],
      'صد',
    ),
    Question(
      'Complete: "I wake up at ___."',
      ['seven', 'name', 'family', 'house'],
      'seven',
    ),
    Question(
      'What does "secondOrder" (second) mean?',
      ['اول', 'دوم', 'سوم', 'آخر'],
      'دوم',
    ),
    Question(
      'How do you say "الان"?',
      ['Today', 'Now', 'Tomorrow', 'Late'],
      'Now',
    ),
    Question(
      'What does "eleven" mean?',
      ['ده', 'یازده', 'دوازده', 'سیزده'],
      'یازده',
    ),
    Question(
      'Complete: "There are ___ students." (12)',
      ['twelve', 'twenty', 'ten', 'eleven'],
      'twelve',
    ),
    Question(
      'What does "minute" mean?',
      ['ساعت', 'دقیقه', 'ثانیه', 'زمان'],
      'دقیقه',
    ),
    Question(
      'How do you say "سوم"?',
      ['First', 'Second', 'Third', 'Fourth'],
      'Third',
    ),
    Question(
      'What does "five" mean?',
      ['چهار', 'پنج', 'شش', 'سه'],
      'پنج',
    ),
    Question(
      'How do you say "زمان/ساعت"?',
      ['Clock', 'Time', 'Hour', 'Minute'],
      'Time',
    ),
  ],
);
