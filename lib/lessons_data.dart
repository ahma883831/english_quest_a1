
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
// ==========================================================
// LESSON 4: Colors & Shapes
// ==========================================================
final lesson4 = Lesson(
  id: 4,
  title: 'Colors & Shapes',
  subtitle: 'رنگ‌ها و شکل‌ها',
  explanation:
      '🎯 هدف درس\n'
      'در این درس رنگ‌ها و شکل‌های اصلی رو یاد می‌گیری و می‌آموزی چطور یک شیء رو با رنگ و شکلش توصیف کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. صفت (رنگ یا شکل) همیشه قبل از اسم می‌آد: "a red apple" نه "an apple red".\n'
      '۲. برای پرسیدن رنگ می‌گیم "What color is it?" و جواب کوتاه "It is + رنگ." است.\n'
      '۳. وقتی صفت با حرف صدادار شروع بشه از "an" استفاده می‌کنیم: "an orange ball".\n'
      '۴. کلمات "light" و "dark" قبل از رنگ می‌آیند تا روشنی/تیرگی رنگ رو نشون بدن: "light blue", "dark green".\n'
      '۵. شکل‌های هندسی (circle, square, triangle) اسم هستن، نه صفت — می‌گیم "It is a circle." نه "It is circle".\n'
      '۶. برای پرسیدن نظر یا سلیقه می‌گیم "What is your favorite color?"',
  formula:
      'What color is it? → It is + [color].\n'
      'It is a + [shape].\n'
      '[color/shape] + noun → a red circle',

  words: const [
    Word('red', 'قرمز', 'RED', '🔴'),
    Word('blue', 'آبی', 'BLOO', '🔵'),
    Word('green', 'سبز', 'GREEN', '🟢'),
    Word('yellow', 'زرد', 'YEL-oh', '🟡'),
    Word('black', 'سیاه', 'BLAK', '⚫'),
    Word('white', 'سفید', 'WAIT', '⚪'),
    Word('orange', 'نارنجی', 'OR-inj', '🟠'),
    Word('purple', 'بنفش', 'PUR-pul', '🟣'),
    Word('pink', 'صورتی', 'PINK', '🩷'),
    Word('brown', 'قهوه‌ای', 'BROWN', '🟤'),
    Word('gray', 'خاکستری', 'GREY', '⬜'),
    Word('gold', 'طلایی', 'GOHLD', '🟨'),
    Word('circle', 'دایره', 'SUR-kul', '⚪'),
    Word('square', 'مربع', 'SKWAIR', '🟥'),
    Word('triangle', 'مثلث', 'TRAI-ang-gul', '🔺'),
    Word('rectangle', 'مستطیل', 'REK-tang-gul', '▭'),
    Word('star', 'ستاره', 'STAR', '⭐'),
    Word('heart', 'قلب', 'HART', '❤️'),
    Word('oval', 'بیضی', 'OH-vul', '🥚'),
    Word('diamond', 'لوزی', 'DAI-mund', '💎'),
    Word('shape', 'شکل', 'SHEYP', '🔷'),
    Word('color', 'رنگ', 'KUL-er', '🎨'),
    Word('big', 'بزرگ', 'BIG', '🐘'),
    Word('small', 'کوچک', 'SMAWL', '🐜'),
    Word('round', 'گرد', 'ROWND', '⚽'),
    Word('flat', 'صاف/تخت', 'FLAT', '📄'),
    Word('light', 'روشن (رنگ)', 'LAIT', '💡'),
    Word('dark', 'تیره', 'DARK', '🌑'),
    Word('bright', 'روشن/درخشان', 'BRAIT', '✨'),
    Word('favorite', 'مورد علاقه', 'FEY-vuh-rit', '💖'),
  ],

  examples: const [
    'What color is it? — رنگش چیه؟',
    'It is red. — قرمز است.',
    'The sky is blue. — آسمان آبی است.',
    'Grass is green. — چمن سبز است.',
    'The sun is yellow. — خورشید زرد است.',
    'My cat is black. — گربه‌ی من سیاه است.',
    'Snow is white. — برف سفید است.',
    'I like orange juice. — من آب‌پرتقال دوست دارم.',
    'She has a purple bag. — او یک کیف بنفش دارد.',
    'My shirt is pink. — پیراهنم صورتی است.',
    'The table is brown. — میز قهوه‌ای است.',
    'This is a circle. — این یک دایره است.',
    'That is a square. — آن یک مربع است.',
    'A triangle has three sides. — مثلث سه ضلع دارد.',
    'The box is a rectangle. — جعبه یک مستطیل است.',
    'I see a star in the sky. — یک ستاره در آسمان می‌بینم.',
    'This is a heart shape. — این یک شکل قلبی است.',
    'The ball is round. — توپ گرد است.',
    'What is your favorite color? — رنگ مورد علاقه‌ات چیه؟',
    'My favorite color is blue. — رنگ مورد علاقه‌ام آبی است.',
    'This box is big. — این جعبه بزرگ است.',
    'That box is small. — آن جعبه کوچک است.',
    'The paper is flat. — کاغذ صاف است.',
    'This color is light. — این رنگ روشن است.',
    'That color is dark. — آن رنگ تیره است.',
    'The stars are bright. — ستاره‌ها درخشان هستند.',
    'She has a diamond ring. — او یک انگشتر لوزی‌شکل دارد.',
    'The mirror is oval. — آینه بیضی است.',
    'What shape is this? — این چه شکلی است؟',
    'I like this color a lot. — من این رنگ را خیلی دوست دارم.',
  ],

  questions: const [
    Question('What does "red" mean?', ['قرمز', 'آبی', 'سبز', 'زرد'], 'قرمز'),
    Question('How do you say "آبی"?', ['Red', 'Blue', 'Green', 'Black'], 'Blue'),
    Question('What does "green" mean?', ['سبز', 'زرد', 'قرمز', 'سفید'], 'سبز'),
    Question(
      'Complete: "The sky is ___."',
      ['blue', 'square', 'big', 'flat'],
      'blue',
    ),
    Question('What does "yellow" mean?', ['سیاه', 'زرد', 'سفید', 'آبی'], 'زرد'),
    Question(
      'How do you say "سیاه"?',
      ['White', 'Black', 'Gray', 'Brown'],
      'Black',
    ),
    Question(
      'What does "circle" mean?',
      ['مربع', 'دایره', 'مثلث', 'ستاره'],
      'دایره',
    ),
    Question(
      'Complete: "This is a ___."',
      ['circle', 'blue', 'big', 'dark'],
      'circle',
    ),
    Question(
      'What does "square" mean?',
      ['دایره', 'مربع', 'مثلث', 'قلب'],
      'مربع',
    ),
    Question(
      'How do you say "مثلث"?',
      ['Circle', 'Square', 'Triangle', 'Star'],
      'Triangle',
    ),
    Question(
      'What does "star" mean?',
      ['قلب', 'ستاره', 'دایره', 'لوزی'],
      'ستاره',
    ),
    Question(
      'Complete: "A triangle has three ___."',
      ['sides', 'colors', 'stars', 'shapes'],
      'sides',
    ),
    Question(
      'What does "big" mean?',
      ['کوچک', 'بزرگ', 'گرد', 'صاف'],
      'بزرگ',
    ),
    Question(
      'How do you say "کوچک"?',
      ['Big', 'Small', 'Round', 'Flat'],
      'Small',
    ),
    Question(
      'What does "round" mean?',
      ['گرد', 'صاف', 'تیره', 'روشن'],
      'گرد',
    ),
    Question(
      'Complete: "What ___ is it?" (asking color)',
      ['color', 'shape', 'size', 'name'],
      'color',
    ),
    Question(
      'What does "purple" mean?',
      ['بنفش', 'صورتی', 'نارنجی', 'قهوه‌ای'],
      'بنفش',
    ),
    Question(
      'How do you say "صورتی"?',
      ['Purple', 'Pink', 'Orange', 'Gray'],
      'Pink',
    ),
    Question(
      'What does "white" mean?',
      ['سیاه', 'سفید', 'خاکستری', 'طلایی'],
      'سفید',
    ),
    Question(
      'Complete: "My favorite ___ is blue."',
      ['color', 'shape', 'name', 'size'],
      'color',
    ),
    Question(
      'What does "heart" mean?',
      ['ستاره', 'قلب', 'لوزی', 'دایره'],
      'قلب',
    ),
    Question(
      'How do you say "روشن (رنگ)"?',
      ['Dark', 'Light', 'Bright', 'Flat'],
      'Light',
    ),
    Question(
      'What does "dark" mean?',
      ['روشن', 'تیره', 'درخشان', 'گرد'],
      'تیره',
    ),
    Question(
      'Complete: "The stars are ___."',
      ['bright', 'flat', 'square', 'small'],
      'bright',
    ),
    Question(
      'What does "diamond" mean?',
      ['لوزی', 'مربع', 'دایره', 'مثلث'],
      'لوزی',
    ),
    Question(
      'How do you say "بیضی"?',
      ['Circle', 'Oval', 'Star', 'Heart'],
      'Oval',
    ),
    Question(
      'What does "shape" mean?',
      ['رنگ', 'شکل', 'اندازه', 'نور'],
      'شکل',
    ),
    Question(
      'Complete: "This box is ___." (opposite of small)',
      ['big', 'flat', 'dark', 'round'],
      'big',
    ),
    Question(
      'What does "gray" mean?',
      ['خاکستری', 'طلایی', 'قهوه‌ای', 'سفید'],
      'خاکستری',
    ),
    Question(
      'How do you say "مورد علاقه"?',
      ['Color', 'Favorite', 'Shape', 'Bright'],
      'Favorite',
    ),
  ],
);

// ==========================================================
// LESSON 5: Days & Months
// ==========================================================
final lesson5 = Lesson(
  id: 5,
  title: 'Days & Months',
  subtitle: 'روزهای هفته و ماه‌ها',
  explanation:
      '🎯 هدف درس\n'
      'در این درس روزهای هفته، ماه‌های سال و فصل‌ها رو یاد می‌گیری و می‌آموزی چطور درباره‌ی تاریخ و زمان صحبت کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. روزهای هفته و ماه‌ها همیشه با حرف بزرگ شروع می‌شن: Monday نه monday.\n'
      '۲. برای روزها از حرف اضافه "on" استفاده می‌کنیم: "on Monday".\n'
      '۳. برای ماه‌ها از حرف اضافه "in" استفاده می‌کنیم: "in June".\n'
      '۴. برای سال‌ها هم "in" به کار می‌ره: "in 2026".\n'
      '۵. کلمه "weekend" در انگلیسی به شنبه و یکشنبه اشاره داره، نه پنج‌شنبه و جمعه.\n'
      '۶. برای پرسیدن تاریخ می‌گیم "What is the date today?" و جواب مثلاً "It is August 23rd."',
  formula:
      'What day is it? → It is + [day].\n'
      'on + [day]   |   in + [month/year]\n'
      'What is the date? → It is + [month] + [day].',

  words: const [
    Word('monday', 'دوشنبه', 'MUN-dey', '📅'),
    Word('tuesday', 'سه‌شنبه', 'TOOZ-dey', '📅'),
    Word('wednesday', 'چهارشنبه', 'WENZ-dey', '📅'),
    Word('thursday', 'پنج‌شنبه', 'THURZ-dey', '📅'),
    Word('friday', 'جمعه', 'FRAI-dey', '📅'),
    Word('saturday', 'شنبه', 'SAT-er-dey', '📅'),
    Word('sunday', 'یکشنبه', 'SUN-dey', '📅'),
    Word('week', 'هفته', 'WEEK', '🗓️'),
    Word('weekend', 'آخر هفته', 'WEEK-end', '🎉'),
    Word('january', 'ژانویه', 'JAN-yoo-air-ee', '❄️'),
    Word('february', 'فوریه', 'FEB-roo-air-ee', '💝'),
    Word('march', 'مارس', 'MARCH', '🌱'),
    Word('april', 'آوریل', 'EY-prul', '🌷'),
    Word('may', 'مه', 'MEY', '🌸'),
    Word('june', 'ژوئن', 'JOON', '☀️'),
    Word('july', 'جولای', 'juh-LAI', '🎆'),
    Word('august', 'آگوست', 'AW-gust', '🏖️'),
    Word('september', 'سپتامبر', 'sep-TEM-ber', '🍂'),
    Word('october', 'اکتبر', 'ok-TOH-ber', '🎃'),
    Word('november', 'نوامبر', 'noh-VEM-ber', '🍁'),
    Word('december', 'دسامبر', 'dee-SEM-ber', '🎄'),
    Word('month', 'ماه', 'MUNTH', '📆'),
    Word('year', 'سال', 'YEER', '🗓️'),
    Word('date', 'تاریخ', 'DEYT', '📅'),
    Word('calendar', 'تقویم', 'KAL-en-der', '📆'),
    Word('holiday', 'تعطیلات', 'HOL-uh-dey', '🏝️'),
    Word('birthday', 'تولد', 'BURTH-dey', '🎂'),
    Word('season', 'فصل', 'SEE-zun', '🍁'),
    Word('spring', 'بهار', 'SPRING', '🌼'),
    Word('winter', 'زمستان', 'WIN-ter', '⛄'),
  ],

  examples: const [
    'What day is it today? — امروز چه روزیه؟',
    'Today is Monday. — امروز دوشنبه است.',
    'I have school on Tuesday. — سه‌شنبه مدرسه دارم.',
    'Wednesday is the middle of the week. — چهارشنبه وسط هفته است.',
    'I like Thursday. — من پنج‌شنبه را دوست دارم.',
    'Friday is a busy day. — جمعه روز شلوغی است.',
    'Saturday is a holiday. — شنبه تعطیل است.',
    'Sunday is a family day. — یکشنبه روز خانواده است.',
    'A week has seven days. — یک هفته هفت روز دارد.',
    'I relax on the weekend. — آخر هفته استراحت می‌کنم.',
    'My birthday is in January. — تولدم در ژانویه است.',
    'February is a short month. — فوریه ماه کوتاهی است.',
    'Spring starts in March. — بهار در مارس شروع می‌شود.',
    'It rains a lot in April. — در آوریل خیلی باران می‌بارد.',
    'Flowers grow in May. — گل‌ها در مه رشد می‌کنند.',
    'School ends in June. — مدرسه در ژوئن تمام می‌شود.',
    'We have a holiday in July. — در جولای تعطیلات داریم.',
    'August is very hot. — آگوست خیلی گرم است.',
    'School starts in September. — مدرسه در سپتامبر شروع می‌شود.',
    'Leaves fall in October. — برگ‌ها در اکتبر می‌ریزند.',
    'It gets cold in November. — در نوامبر هوا سرد می‌شود.',
    'We celebrate in December. — در دسامبر جشن می‌گیریم.',
    'What month is it? — الان چه ماهیه؟',
    'This year is exciting. — امسال هیجان‌انگیز است.',
    'What is the date today? — امروز چندمه؟',
    'I look at the calendar every day. — هر روز به تقویم نگاه می‌کنم.',
    'We have a holiday next week. — هفته‌ی آینده تعطیلات داریم.',
    'My birthday is in May. — تولد من در ماه مه است.',
    'There are four seasons. — چهار فصل وجود دارد.',
    'Winter is very cold. — زمستان خیلی سرد است.',
  ],
  questions: const [
    Question(
      'What does "Monday" mean?',
      ['دوشنبه', 'سه‌شنبه', 'یکشنبه', 'جمعه'],
      'دوشنبه',
    ),
    Question(
      'How do you say "جمعه"?',
      ['Thursday', 'Friday', 'Saturday', 'Sunday'],
      'Friday',
    ),
    Question(
      'What does "week" mean?',
      ['ماه', 'هفته', 'سال', 'روز'],
      'هفته',
    ),
    Question(
      'Complete: "A week has seven ___."',
      ['days', 'months', 'years', 'weeks'],
      'days',
    ),
    Question(
      'What does "weekend" mean?',
      ['اول هفته', 'آخر هفته', 'وسط هفته', 'ماه'],
      'آخر هفته',
    ),
    Question(
      'How do you say "ژانویه"?',
      ['June', 'July', 'January', 'March'],
      'January',
    ),
    Question(
      'What does "birthday" mean?',
      ['تعطیلات', 'تولد', 'تاریخ', 'تقویم'],
      'تولد',
    ),
    Question(
      'Complete: "My birthday is ___ January."',
      ['in', 'on', 'at', 'for'],
      'in',
    ),
    Question(
      'What does "month" mean?',
      ['هفته', 'روز', 'ماه', 'سال'],
      'ماه',
    ),
    Question(
      'How do you say "سال"?',
      ['Month', 'Week', 'Year', 'Day'],
      'Year',
    ),
    Question(
      'What does "holiday" mean?',
      ['تولد', 'تعطیلات', 'تاریخ', 'تقویم'],
      'تعطیلات',
    ),
    Question(
      'Complete: "I have school ___ Tuesday."',
      ['on', 'in', 'at', 'for'],
      'on',
    ),
    Question(
      'What does "calendar" mean?',
      ['تقویم', 'تاریخ', 'فصل', 'هفته'],
      'تقویم',
    ),
    Question(
      'How do you say "بهار"?',
      ['Summer', 'Winter', 'Spring', 'Autumn'],
      'Spring',
    ),
    Question(
      'What does "winter" mean?',
      ['بهار', 'زمستان', 'تابستان', 'پاییز'],
      'زمستان',
    ),
    Question(
      'Complete: "What ___ is it today?" (asking day)',
      ['day', 'month', 'year', 'date'],
      'day',
    ),
    Question(
      'What does "date" mean?',
      ['روز', 'تاریخ', 'ماه', 'فصل'],
      'تاریخ',
    ),
    Question(
      'How do you say "دسامبر"?',
      ['October', 'November', 'December', 'September'],
      'December',
    ),
    Question(
      'What does "season" mean?',
      ['روز', 'ماه', 'فصل', 'هفته'],
      'فصل',
    ),
    Question(
      'Complete: "Today is ___." (Monday)',
      ['Monday', 'January', 'week', 'year'],
      'Monday',
    ),
    Question(
      'What does "Sunday" mean?',
      ['شنبه', 'یکشنبه', 'دوشنبه', 'جمعه'],
      'یکشنبه',
    ),
    Question(
      'How do you say "چهارشنبه"?',
      ['Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      'Wednesday',
    ),
    Question(
      'What does "Saturday" mean?',
      ['جمعه', 'شنبه', 'یکشنبه', 'دوشنبه'],
      'شنبه',
    ),
    Question(
      'Complete: "School starts ___ September."',
      ['in', 'on', 'at', 'for'],
      'in',
    ),
    Question(
      'What does "August" mean?',
      ['جولای', 'آگوست', 'سپتامبر', 'ژوئن'],
      'آگوست',
    ),
    Question(
      'How do you say "اکتبر"?',
      ['September', 'October', 'November', 'December'],
      'October',
    ),
    Question(
      'What does "June" mean?',
      ['مه', 'ژوئن', 'جولای', 'آگوست'],
      'ژوئن',
    ),
    Question(
      'Complete: "There are four ___."',
      ['seasons', 'weeks', 'months', 'years'],
      'seasons',
    ),
    Question(
      'What does "April" mean?',
      ['مارس', 'آوریل', 'مه', 'ژوئن'],
      'آوریل',
    ),
    Question(
      'How do you say "تاریخ"?',
      ['Calendar', 'Date', 'Day', 'Season'],
      'Date',
    ),
  ],
);

// ==========================================================
// ALL LESSONS
// ==========================================================

final lessons = [
  lesson1,
  lesson2,
  lesson3,
  lesson4,
  lesson5,
];
// ==========================================================
// LESSON 6: A / An & Singular Nouns
// ==========================================================
final lesson6 = Lesson(
  id: 6,
  title: 'A / An & Singular Nouns',
  subtitle: 'اسم‌های مفرد و a / an',

  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چه زمانی از a و an قبل از اسم‌های مفرد استفاده کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. a و an فقط قبل از اسم مفرد و قابل شمارش استفاده می‌شوند.\n'
      '۲. قبل از صدای صامت معمولاً از a استفاده می‌کنیم: a book, a car, a teacher.\n'
      '۳. قبل از صدای مصوت از an استفاده می‌کنیم: an apple, an egg, an orange.\n'
      '۴. انتخاب a یا an بر اساس صداست، نه فقط حرف اول کلمه.\n'
      '۵. برای اسم جمع معمولاً a یا an نمی‌آوریم: books، cars، apples.\n'
      '۶. وقتی درباره یک چیز مشخص و شناخته‌شده صحبت می‌کنیم، بعداً با the آشنا می‌شویم.\n\n'
      '💡 مثال مهم\n'
      'a book → یک کتاب\n'
      'an apple → یک سیب\n'
      'a student → یک دانش‌آموز\n'
      'an orange → یک پرتقال',

  formula:
      'a + consonant sound → a book / a car\n'
      'an + vowel sound → an apple / an egg\n\n'
      'I have + a/an + singular noun.\n'
      'This is + a/an + singular noun.',

  words: const [
    Word('book', 'کتاب', 'BOOK', '📚'),
    Word('pen', 'خودکار', 'PEN', '🖊️'),
    Word('pencil', 'مداد', 'PEN-sul', '✏️'),
    Word('bag', 'کیف', 'BAG', '🎒'),
    Word('car', 'ماشین', 'KAR', '🚗'),
    Word('bus', 'اتوبوس', 'BUS', '🚌'),
    Word('chair', 'صندلی', 'CHAIR', '🪑'),
    Word('table', 'میز', 'TEY-bul', '🪵'),
    Word('computer', 'کامپیوتر', 'kum-PYOO-ter', '💻'),
    Word('phone', 'تلفن', 'FOHN', '📱'),
    Word('apple', 'سیب', 'AP-ul', '🍎'),
    Word('orange', 'پرتقال', 'OR-inj', '🍊'),
    Word('egg', 'تخم‌مرغ', 'EG', '🥚'),
    Word('elephant', 'فیل', 'EL-uh-funt', '🐘'),
    Word('animal', 'حیوان', 'AN-uh-mul', '🐾'),
    Word('umbrella', 'چتر', 'um-BREL-uh', '☂️'),
    Word('idea', 'ایده', 'ai-DEE-uh', '💡'),
    Word('artist', 'هنرمند', 'AR-tist', '🎨'),
    Word('engineer', 'مهندس', 'en-juh-NEER', '👷'),
    Word('doctor', 'دکتر', 'DOK-ter', '👨‍⚕️'),
    Word('teacher', 'معلم', 'TEE-cher', '👨‍🏫'),
    Word('student', 'دانش‌آموز', 'STOO-dent', '🎓'),
    Word('house', 'خانه', 'HOWS', '🏠'),
    Word('school', 'مدرسه', 'SKOOL', '🏫'),
    Word('restaurant', 'رستوران', 'RES-tuh-rant', '🍽️'),
    Word('hotel', 'هتل', 'hoh-TEL', '🏨'),
    Word('office', 'دفتر/اداره', 'AW-fis', '🏢'),
    Word('animal', 'حیوان', 'AN-uh-mul', '🐶'),
    Word('island', 'جزیره', 'AI-land', '🏝️'),
    Word('hour', 'ساعت', 'OW-er', '⏰'),
  ],

  examples: const [
    'I have a book. — من یک کتاب دارم.',
    'I have a pen. — من یک خودکار دارم.',
    'She has a pencil. — او یک مداد دارد.',
    'This is a bag. — این یک کیف است.',
    'He has a car. — او یک ماشین دارد.',
    'We have a bus. — ما یک اتوبوس داریم.',
    'This is a chair. — این یک صندلی است.',
    'That is a table. — آن یک میز است.',
    'I have a computer. — من یک کامپیوتر دارم.',
    'She has a phone. — او یک تلفن دارد.',
    'I eat an apple. — من یک سیب می‌خورم.',
    'He has an orange. — او یک پرتقال دارد.',
    'I eat an egg. — من یک تخم‌مرغ می‌خورم.',
    'We see an elephant. — ما یک فیل می‌بینیم.',
    'A dog is an animal. — سگ یک حیوان است.',
    'I need an umbrella. — من یک چتر لازم دارم.',
    'I have an idea. — من یک ایده دارم.',
    'She is an artist. — او یک هنرمند است.',
    'He is an engineer. — او یک مهندس است.',
    'She is a doctor. — او یک دکتر است.',
    'He is a teacher. — او یک معلم است.',
    'I am a student. — من یک دانش‌آموز هستم.',
    'This is a house. — این یک خانه است.',
    'That is a school. — آن یک مدرسه است.',
    'This is a restaurant. — این یک رستوران است.',
    'We stayed at a hotel. — ما در یک هتل ماندیم.',
    'He works in an office. — او در یک اداره کار می‌کند.',
    'An island is surrounded by water. — یک جزیره توسط آب احاطه شده است.',
    'An hour has sixty minutes. — یک ساعت شصت دقیقه دارد.',
    'I have a good idea. — من یک ایده خوب دارم.',
  ],

  questions: const [
    Question(
      'Choose the correct answer: "I have ___ book."',
      ['a', 'an', 'am', 'are'],
      'a',
    ),
    Question(
      'Choose the correct answer: "She has ___ apple."',
      ['a', 'an', 'is', 'are'],
      'an',
    ),
    Question(
      'What does "book" mean?',
      ['کتاب', 'مداد', 'کیف', 'میز'],
      'کتاب',
    ),
    Question(
      'How do you say "خودکار"?',
      ['Book', 'Pen', 'Bag', 'Chair'],
      'Pen',
    ),
    Question(
      'Complete: "This is ___ car."',
      ['a', 'an', 'is', 'am'],
      'a',
    ),
    Question(
      'Complete: "I have ___ orange."',
      ['a', 'an', 'the', 'am'],
      'an',
    ),
    Question(
      'What does "pencil" mean?',
      ['مداد', 'خودکار', 'کتاب', 'کیف'],
      'مداد',
    ),
    Question(
      'How do you say "تخم‌مرغ"?',
      ['Apple', 'Orange', 'Egg', 'Animal'],
      'Egg',
    ),
    Question(
      'Complete: "He is ___ engineer."',
      ['a', 'an', 'is', 'are'],
      'an',
    ),
    Question(
      'What does "doctor" mean?',
      ['معلم', 'دکتر', 'مهندس', 'هنرمند'],
      'دکتر',
    ),
    Question(
      'Complete: "She is ___ teacher."',
      ['a', 'an', 'am', 'are'],
      'a',
    ),
    Question(
      'What does "artist" mean?',
      ['هنرمند', 'مهندس', 'دکتر', 'دانش‌آموز'],
      'هنرمند',
    ),
    Question(
      'How do you say "مهندس"?',
      ['Doctor', 'Artist', 'Engineer', 'Teacher'],
      'Engineer',
    ),
    Question(
      'Complete: "I need ___ umbrella."',
      ['a', 'an', 'am', 'is'],
      'an',
    ),
    Question(
      'What does "umbrella" mean?',
      ['چتر', 'جزیره', 'رستوران', 'خانه'],
      'چتر',
    ),
    // ==========================================================
// LESSON 7: Daily Routine
// ==========================================================
final lesson7 = Lesson(
  id: 7,
  title: 'Daily Routine',
  subtitle: 'کارهای روزمره',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری درباره کارهایی که هر روز انجام می‌دهی صحبت کنی و از زمان حال ساده (Present Simple) استفاده کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/You/We/They از شکل ساده فعل استفاده می‌کنیم: I work, You study.\n'
      '۲. برای He/She/It معمولاً به فعل s یا es اضافه می‌کنیم: He works, She watches.\n'
      '۳. برای کارهای روزمره از کلماتی مثل every day, usually, always و sometimes استفاده می‌کنیم.\n'
      '۴. برای ساعت انجام کار معمولاً از at استفاده می‌کنیم: I wake up at 7.\n'
      '۵. برای ساختن جمله منفی با I/You/We/They از don’t و با He/She/It از doesn’t استفاده می‌کنیم.\n'
      '۶. برای سؤال در زمان حال ساده از Do یا Does استفاده می‌کنیم.',
  formula:
      'I/You/We/They → verb\n'
      'He/She/It → verb + s/es\n\n'
      'Negative:\n'
      'I/You/We/They → don’t + verb\n'
      'He/She/It → doesn’t + verb\n\n'
      'Question:\n'
      'Do + I/you/we/they + verb?\n'
      'Does + he/she/it + verb?',
  words: const [
    Word('wake', 'بیدار شدن', 'WEYK', '⏰'),
    Word('wake up', 'از خواب بیدار شدن', 'WEYK UP', '🌅'),
    Word('get', 'گرفتن/شدن', 'GET', '🙌'),
    Word('get up', 'از جا بلند شدن', 'GET UP', '🛏️'),
    Word('wash', 'شستن', 'WOSH', '🧼'),
    Word('face', 'صورت', 'FEYS', '🙂'),
    Word('brush', 'مسواک زدن', 'BRUSH', '🪥'),
    Word('teeth', 'دندان‌ها', 'TEETH', '🦷'),
    Word('shower', 'دوش گرفتن', 'SHOW-er', '🚿'),
    Word('dress', 'لباس پوشیدن', 'DRES', '👕'),
    Word('breakfast', 'صبحانه', 'BREK-fust', '🍳'),
    Word('lunch', 'ناهار', 'LUNCH', '🍱'),
    Word('dinner', 'شام', 'DIN-er', '🍽️'),
    Word('go', 'رفتن', 'GOH', '🚶'),
    Word('come', 'آمدن', 'KUM', '🏃'),
    Word('school', 'مدرسه', 'SKOOL', '🏫'),
    Word('work', 'کار کردن', 'WURK', '💼'),
    Word('study', 'درس خواندن', 'STUH-dee', '📚'),
    Word('read', 'خواندن', 'REED', '📖'),
    Word('write', 'نوشتن', 'RAIT', '✍️'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('sleep', 'خوابیدن', 'SLEEP', '😴'),
    Word('rest', 'استراحت کردن', 'REST', '🛋️'),
    Word('home', 'خانه', 'HOHM', '🏠'),
    Word('usually', 'معمولاً', 'YOO-zhoo-uh-lee', '🔄'),
    Word('always', 'همیشه', 'AWL-weyz', '♾️'),
    Word('sometimes', 'گاهی اوقات', 'SUM-taimz', '🔀'),
    Word('never', 'هرگز', 'NEV-er', '🚫'),
    Word('every', 'هر', 'EV-ree', '📅'),
  ],
  examples: const [
    'I wake up at seven. — من ساعت هفت بیدار می‌شوم.',
    'I get up early. — من زود از خواب بلند می‌شوم.',
    'I wash my face. — من صورتم را می‌شویم.',
    'I brush my teeth. — من دندان‌هایم را مسواک می‌زنم.',
    'I take a shower. — من دوش می‌گیرم.',
    'I get dressed. — من لباس می‌پوشم.',
    'I eat breakfast at eight. — من ساعت هشت صبحانه می‌خورم.',
    'I go to school every day. — من هر روز به مدرسه می‌روم.',
    'I study English. — من انگلیسی می‌خوانم.',
    'I read a book. — من یک کتاب می‌خوانم.',
    'I write in my notebook. — من در دفترم می‌نویسم.',
    'I have lunch at noon. — من ظهر ناهار می‌خورم.',
    'I come home in the afternoon. — من بعدازظهر به خانه می‌آیم.',
    'I do my homework. — من تکالیفم را انجام می‌دهم.',
    'I watch TV in the evening. — من عصر تلویزیون تماشا می‌کنم.',
    'I play games sometimes. — من گاهی بازی می‌کنم.',
    'I have dinner with my family. — من با خانواده‌ام شام می‌خورم.',
    'I rest after work. — من بعد از کار استراحت می‌کنم.',
    'I usually read at night. — من معمولاً شب مطالعه می‌کنم.',
    'I go to bed at eleven. — من ساعت یازده به رختخواب می‌روم.',
    'He wakes up early. — او زود بیدار می‌شود.',
    'She studies English every day. — او هر روز انگلیسی می‌خواند.',
    'He watches TV at night. — او شب تلویزیون تماشا می‌کند.',
    'She goes to school by bus. — او با اتوبوس به مدرسه می‌رود.',
    'I do not sleep late. — من دیر نمی‌خوابم.',
    'I don’t watch TV every day. — من هر روز تلویزیون تماشا نمی‌کنم.',
    'He doesn’t play football. — او فوتبال بازی نمی‌کند.',
    'Do you study English? — آیا انگلیسی می‌خوانی؟',
    'Does she work every day? — آیا او هر روز کار می‌کند؟',
    'What time do you wake up? — ساعت چند بیدار می‌شوی؟',
  ],
  questions: const [
    Question(
      'What does "wake up" mean?',
      ['خوابیدن', 'بیدار شدن', 'غذا خوردن', 'رفتن'],
      'بیدار شدن',
    ),
    Question(
      'How do you say "صبحانه"?',
      ['Lunch', 'Dinner', 'Breakfast', 'School'],
      'Breakfast',
    ),
    Question(
      'Complete: "I ___ up at seven."',
      ['wake', 'wakes', 'waking', 'woken'],
      'wake',
    ),
    Question(
      'What does "brush" mean?',
      ['شستن', 'مسواک زدن', 'خوابیدن', 'خواندن'],
      'مسواک زدن',
    ),
    Question(
      'How do you say "دندان‌ها"?',
      ['Face', 'Teeth', 'Hands', 'Eyes'],
      'Teeth',
    ),
    Question(
      'Complete: "She ___ English every day."',
      ['study', 'studies', 'studying', 'studied'],
      'studies',
    ),
    Question(
      'What does "lunch" mean?',
      ['صبحانه', 'ناهار', 'شام', 'میان‌وعده'],
      'ناهار',
    ),
    Question(
      'How do you say "شام"?',
      ['Breakfast', 'Lunch', 'Dinner', 'Morning'],
      'Dinner',
    ),
    Question(
      'Complete: "He ___ TV at night."',
      ['watch', 'watches', 'watching', 'watched'],
      'watches',
    ),
    Question(
      'What does "study" mean?',
      ['کار کردن', 'درس خواندن', 'بازی کردن', 'خوابیدن'],
      'درس خواندن',
    ),
    Question(
      'How do you say "خواندن"?',
      ['Write', 'Read', 'Play', 'Sleep'],
      'Read',
    ),
    Question(
      'What does "write" mean?',
      ['خواندن', 'نوشتن', 'رفتن', 'آمدن'],
      'نوشتن',
    ),
    Question(
      'Complete: "I ___ to school every day."',
      ['go', 'goes', 'going', 'gone'],
      'go',
    ),
    Question(
      'What does "usually" mean?',
      ['هرگز', 'معمولاً', 'همیشه', 'گاهی'],
      'معمولاً',
    ),
    Question(
      'How do you say "همیشه"?',
      ['Never', 'Sometimes', 'Always', 'Usually'],
      'Always',
    ),
    Question(
      'What does "sometimes" mean?',
      ['همیشه', 'هرگز', 'گاهی اوقات', 'معمولاً'],
      'گاهی اوقات',
    ),
    Question(
      'Complete: "I ___ watch TV every day."',
      ['don’t', 'doesn’t', 'isn’t', 'aren’t'],
      'don’t',
    ),
    Question(
      'Complete: "He ___ play football."',
      ['don’t', 'doesn’t', 'isn’t', 'aren’t'],
      'doesn’t',
    ),
    Question(
      'What does "sleep" mean?',
      ['خوابیدن', 'بیدار شدن', 'رفتن', 'نوشتن'],
      'خوابیدن',
    ),
    Question(
      'How do you say "استراحت کردن"?',
      ['Work', 'Rest', 'Read', 'Get'],
      'Rest',
    ),
    Question(
      'Complete: "___ you study English?"',
      ['Do', 'Does', 'Is', 'Are'],
      'Do',
    ),
    Question(
      'Complete: "___ he work every day?"',
      ['Do', 'Does', 'Is', 'Are'],
      'Does',
    ),
    Question(
      'What does "every day" mean?',
      ['هر روز', 'هر هفته', 'هر ماه', 'هر شب'],
      'هر روز',
    ),
    Question(
      'How do you say "خانه"?',
      ['School', 'Home', 'Work', 'Room'],
      'Home',
    ),
    Question(
      'Complete: "She ___ to school."',
      ['go', 'goes', 'going', 'gone'],
      'goes',
    ),
    Question(
      'What does "never" mean?',
      ['همیشه', 'گاهی', 'معمولاً', 'هرگز'],
      'هرگز',
    ),
    Question(
      'Complete: "I ___ breakfast at eight."',
      ['eat', 'eats', 'eating', 'ate'],
      'eat',
    ),
    Question(
      'What does "dinner" mean?',
      ['صبحانه', 'ناهار', 'شام', 'مدرسه'],
      'شام',
    ),
    Question(
      'How do you say "کار کردن"?',
      ['Study', 'Work', 'Sleep', 'Play'],
      'Work',
    ),
    Question(
      'Complete: "What time ___ you wake up?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
  ],
);
