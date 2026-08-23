
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
// ==========================================================
// LESSON 8: Food & Drinks
// ==========================================================
final lesson8 = Lesson(
  id: 8,
  title: 'Food & Drinks',
  subtitle: 'غذاها و نوشیدنی‌ها',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری درباره غذاها و نوشیدنی‌های معمولی صحبت کنی، چیزی سفارش بدهی و درباره علاقه‌ات به غذاها حرف بزنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای گفتن چیزی که دوست داریم از like استفاده می‌کنیم: I like pizza.\n'
      '۲. بعد از like می‌توانیم اسم یا فعل با ing بیاوریم: I like coffee. / I like cooking.\n'
      '۳. برای گفتن چیزی که دوست نداریم از don’t like استفاده می‌کنیم: I don’t like milk.\n'
      '۴. برای He/She از likes و doesn’t like استفاده می‌کنیم.\n'
      '۵. برای درخواست مؤدبانه می‌توانیم از I would like استفاده کنیم: I would like some water.\n'
      '۶. برای غذاها و نوشیدنی‌های غیرقابل‌شمارش معمولاً از some استفاده می‌کنیم: some rice, some water.\n'
      '۷. برای پرسیدن قیمت می‌گوییم: How much is it?',
  formula:
      'I/You/We/They → like\n'
      'He/She/It → likes\n\n'
      'Negative:\n'
      'I/You/We/They → don’t like\n'
      'He/She/It → doesn’t like\n\n'
      'Polite request:\n'
      'I would like + noun\n'
      'I would like some water.',
  words: const [
    Word('food', 'غذا', 'FOOD', '🍽️'),
    Word('drink', 'نوشیدنی', 'DRINK', '🥤'),
    Word('water', 'آب', 'WAW-ter', '💧'),
    Word('milk', 'شیر', 'MILK', '🥛'),
    Word('tea', 'چای', 'TEE', '🍵'),
    Word('coffee', 'قهوه', 'KAW-fee', '☕'),
    Word('juice', 'آبمیوه', 'JOOS', '🧃'),
    Word('bread', 'نان', 'BRED', '🍞'),
    Word('rice', 'برنج', 'RAIS', '🍚'),
    Word('meat', 'گوشت', 'MEET', '🥩'),
    Word('chicken', 'مرغ', 'CHIK-en', '🍗'),
    Word('fish', 'ماهی', 'FISH', '🐟'),
    Word('egg', 'تخم‌مرغ', 'EG', '🥚'),
    Word('cheese', 'پنیر', 'CHEEZ', '🧀'),
    Word('pizza', 'پیتزا', 'PEET-suh', '🍕'),
    Word('sandwich', 'ساندویچ', 'SAN-wich', '🥪'),
    Word('apple', 'سیب', 'AP-ul', '🍎'),
    Word('banana', 'موز', 'buh-NA-nuh', '🍌'),
    Word('orange', 'پرتقال', 'OR-inj', '🍊'),
    Word('grape', 'انگور', 'GREYP', '🍇'),
    Word('potato', 'سیب‌زمینی', 'puh-TEY-toh', '🥔'),
    Word('tomato', 'گوجه‌فرنگی', 'tuh-MEY-toh', '🍅'),
    Word('sugar', 'شکر', 'SHOO-ger', '🍬'),
    Word('salt', 'نمک', 'SAWLT', '🧂'),
    Word('sweet', 'شیرین', 'SWEET', '🍯'),
    Word('hot', 'داغ', 'HOT', '🔥'),
    Word('cold', 'سرد', 'KOHLD', '❄️'),
    Word('hungry', 'گرسنه', 'HUNG-gree', '😋'),
    Word('thirsty', 'تشنه', 'THUR-stee', '💧'),
    Word('delicious', 'خوشمزه', 'di-LISH-us', '🤤'),
  ],
  examples: const [
    'I like pizza. — من پیتزا دوست دارم.',
    'I like rice. — من برنج دوست دارم.',
    'I like chicken. — من مرغ دوست دارم.',
    'I like apples. — من سیب دوست دارم.',
    'I don’t like fish. — من ماهی دوست ندارم.',
    'I don’t like coffee. — من قهوه دوست ندارم.',
    'She likes tea. — او چای دوست دارد.',
    'He likes chicken. — او مرغ دوست دارد.',
    'She doesn’t like milk. — او شیر دوست ندارد.',
    'He doesn’t like fish. — او ماهی دوست ندارد.',
    'I drink water every day. — من هر روز آب می‌نوشم.',
    'I drink tea in the morning. — من صبح چای می‌نوشم.',
    'My father drinks coffee. — پدرم قهوه می‌نوشد.',
    'We eat breakfast at eight. — ما ساعت هشت صبحانه می‌خوریم.',
    'I eat bread and cheese. — من نان و پنیر می‌خورم.',
    'I am hungry. — من گرسنه‌ام.',
    'I am thirsty. — من تشنه‌ام.',
    'The food is delicious. — غذا خوشمزه است.',
    'The water is cold. — آب سرد است.',
    'The tea is hot. — چای داغ است.',
    'I would like some water. — من کمی آب می‌خواهم.',
    'I would like some tea. — من کمی چای می‌خواهم.',
    'Can I have some juice? — می‌توانم کمی آبمیوه داشته باشم؟',
    'Can I have a sandwich? — می‌توانم یک ساندویچ داشته باشم؟',
    'How much is it? — قیمتش چقدر است؟',
    'What would you like? — چه چیزی می‌خواهی؟',
    'I would like a pizza. — من یک پیتزا می‌خواهم.',
    'Do you like coffee? — قهوه دوست داری؟',
    'Does she like tea? — آیا او چای دوست دارد؟',
    'What is your favorite food? — غذای مورد علاقه‌ات چیست؟',
  ],
  questions: const [
    Question(
      'What does "food" mean?',
      ['نوشیدنی', 'غذا', 'آب', 'نان'],
      'غذا',
    ),
    Question(
      'How do you say "آب"?',
      ['Milk', 'Water', 'Juice', 'Tea'],
      'Water',
    ),
    Question(
      'What does "milk" mean?',
      ['شیر', 'چای', 'قهوه', 'آب'],
      'شیر',
    ),
    Question(
      'Complete: "I ___ pizza."',
      ['like', 'likes', 'liking', 'liked'],
      'like',
    ),
    Question(
      'What does "bread" mean?',
      ['برنج', 'نان', 'پنیر', 'گوشت'],
      'نان',
    ),
    Question(
      'How do you say "برنج"?',
      ['Bread', 'Rice', 'Meat', 'Fish'],
      'Rice',
    ),
    Question(
      'What does "chicken" mean?',
      ['ماهی', 'مرغ', 'گوشت', 'تخم‌مرغ'],
      'مرغ',
    ),
    Question(
      'Complete: "She ___ tea."',
      ['like', 'likes', 'liking', 'do like'],
      'likes',
    ),
    Question(
      'What does "fish" mean?',
      ['مرغ', 'ماهی', 'گوشت', 'پنیر'],
      'ماهی',
    ),
    Question(
      'How do you say "تخم‌مرغ"?',
      ['Egg', 'Bread', 'Cheese', 'Rice'],
      'Egg',
    ),
    Question(
      'What does "cheese" mean?',
      ['پنیر', 'شکر', 'نمک', 'نان'],
      'پنیر',
    ),
    Question(
      'Complete: "I don’t ___ coffee."',
      ['like', 'likes', 'liking', 'liked'],
      'like',
    ),
    Question(
      'What does "apple" mean?',
      ['موز', 'پرتقال', 'سیب', 'انگور'],
      'سیب',
    ),
    Question(
      'How do you say "موز"?',
      ['Apple', 'Orange', 'Banana', 'Grape'],
      'Banana',
    ),
    Question(
      'What does "grape" mean?',
      ['انگور', 'پرتقال', 'موز', 'سیب'],
      'انگور',
    ),
    Question(
      'Complete: "He doesn’t ___ fish."',
      ['like', 'likes', 'liking', 'liked'],
      'like',
    ),
    Question(
      'What does "sugar" mean?',
      ['نمک', 'شکر', 'فلفل', 'پنیر'],
      'شکر',
    ),
    Question(
      'How do you say "نمک"?',
      ['Sugar', 'Salt', 'Sweet', 'Hot'],
      'Salt',
    ),
    Question(
      'What does "sweet" mean?',
      ['شور', 'شیرین', 'سرد', 'داغ'],
      'شیرین',
    ),
    Question(
      'Complete: "I am ___."',
      ['hungry', 'food', 'rice', 'eat'],
      'hungry',
    ),
    Question(
      'What does "thirsty" mean?',
      ['گرسنه', 'تشنه', 'خسته', 'خواب‌آلود'],
      'تشنه',
    ),
    Question(
      'How do you say "خوشمزه"?',
      ['Hungry', 'Thirsty', 'Delicious', 'Cold'],
      'Delicious',
    ),
    Question(
      'Complete: "I would ___ some water."',
      ['like', 'likes', 'liking', 'liked'],
      'like',
    ),
    Question(
      'What does "hot" mean?',
      ['سرد', 'داغ', 'شیرین', 'گرسنه'],
      'داغ',
    ),
    Question(
      'How do you say "سرد"?',
      ['Hot', 'Cold', 'Sweet', 'Hungry'],
      'Cold',
    ),
    Question(
      'Complete: "Can I have ___ juice?"',
      ['some', 'a', 'an', 'many'],
      'some',
    ),
    Question(
      'What does "drink" mean?',
      ['غذا', 'نوشیدنی', 'خوردن', 'آشپزی'],
      'نوشیدنی',
    ),
    Question(
      'How do you say "قهوه"?',
      ['Tea', 'Coffee', 'Juice', 'Milk'],
      'Coffee',
    ),
    Question(
      'Complete: "What ___ you like?"',
      ['would', 'are', 'is', 'do'],
      'would',
    ),
    Question(
      'What does "How much is it?" mean?',
      ['چی دوست داری؟', 'قیمتش چقدر است؟', 'چی می‌خوری؟', 'کجاست؟'],
      'قیمتش چقدر است؟',
    ),
  ],
);
// ==========================================================
// LESSON 9: Present Simple Questions
// ==========================================================
final lesson9 = Lesson(
  id: 9,
  title: 'Present Simple Questions',
  subtitle: 'سؤال‌سازی با Do و Does',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور با زمان حال ساده سؤال بسازی و درباره عادت‌ها، کارهای روزمره و علایق دیگران سؤال بپرسی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I, You, We, They از Do استفاده می‌کنیم: Do you work?\n'
      '۲. برای He, She, It از Does استفاده می‌کنیم: Does he work?\n'
      '۳. بعد از Does، فعل اصلی دیگر s نمی‌گیرد: Does she work? نه Does she works?\n'
      '۴. جواب کوتاه با do یا does ساخته می‌شود: Yes, I do. / No, I don’t.\n'
      '۵. با کلمات پرسشی مثل What, Where, When, Why و How نیز از Do/Does استفاده می‌کنیم.\n'
      '۶. Do هم می‌تواند فعل کمکی باشد و هم خودش به معنی "انجام دادن" باشد.',
  formula:
      'I/You/We/They → Do + subject + verb?\n'
      'He/She/It → Does + subject + verb?\n\n'
      'Examples:\n'
      'Do you like tea? → Yes, I do.\n'
      'Does he play football? → No, he doesn’t.\n\n'
      'Wh- Questions:\n'
      'What do you eat?\n'
      'Where does she work?\n'
      'When do they study?',
  words: const [
    Word('question', 'سؤال', 'KWES-chun', '❓'),
    Word('answer', 'پاسخ', 'AN-ser', '💬'),
    Word('ask', 'پرسیدن', 'ASK', '🙋'),
    Word('live', 'زندگی کردن', 'LIV', '🏠'),
    Word('work', 'کار کردن', 'WURK', '💼'),
    Word('study', 'درس خواندن', 'STUH-dee', '📚'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('eat', 'خوردن', 'EET', '🍽️'),
    Word('drink', 'نوشیدن', 'DRINK', '🥤'),
    Word('like', 'دوست داشتن', 'LAIK', '❤️'),
    Word('want', 'خواستن', 'WONT', '⭐'),
    Word('need', 'نیاز داشتن', 'NEED', '📌'),
    Word('know', 'دانستن', 'NOH', '🧠'),
    Word('speak', 'صحبت کردن', 'SPEEK', '🗣️'),
    Word('learn', 'یاد گرفتن', 'LURN', '📖'),
    Word('read', 'خواندن', 'REED', '📚'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('listen', 'گوش دادن', 'LIS-un', '🎧'),
    Word('go', 'رفتن', 'GOH', '🚶'),
    Word('come', 'آمدن', 'KUM', '🏃'),
    Word('start', 'شروع کردن', 'START', '▶️'),
    Word('finish', 'تمام کردن', 'FIN-ish', '🏁'),
    Word('help', 'کمک کردن', 'HELP', '🤝'),
    Word('use', 'استفاده کردن', 'YOOZ', '🛠️'),
    Word('make', 'ساختن/درست کردن', 'MEYK', '🔨'),
    Word('do', 'انجام دادن', 'DOO', '✅'),
    Word('everywhere', 'همه‌جا', 'EV-ree-wair', '🌍'),
    Word('usually', 'معمولاً', 'YOO-zhoo-uh-lee', '🔄'),
    Word('often', 'اغلب', 'AW-fun', '🔁'),
    Word('sometimes', 'گاهی اوقات', 'SUM-taimz', '🔀'),
  ],
  examples: const [
    'Do you speak English? — آیا انگلیسی صحبت می‌کنی؟',
    'Yes, I do. — بله، صحبت می‌کنم.',
    'No, I don’t. — نه، صحبت نمی‌کنم.',
    'Do you like coffee? — آیا قهوه دوست داری؟',
    'Yes, I do. — بله، دوست دارم.',
    'Do you study every day? — آیا هر روز درس می‌خوانی؟',
    'Do they work here? — آیا آن‌ها اینجا کار می‌کنند؟',
    'Do we have class today? — آیا امروز کلاس داریم؟',
    'Do you play football? — آیا فوتبال بازی می‌کنی؟',
    'Do you watch TV at night? — آیا شب تلویزیون تماشا می‌کنی؟',
    'Does he work here? — آیا او اینجا کار می‌کند؟',
    'Yes, he does. — بله، کار می‌کند.',
    'No, he doesn’t. — نه، کار نمی‌کند.',
    'Does she speak English? — آیا او انگلیسی صحبت می‌کند؟',
    'Does he like pizza? — آیا او پیتزا دوست دارد؟',
    'Does she study English? — آیا او انگلیسی می‌خواند؟',
    'Does your brother play football? — آیا برادرت فوتبال بازی می‌کند؟',
    'Does your father work here? — آیا پدرت اینجا کار می‌کند؟',
    'What do you eat for breakfast? — برای صبحانه چه می‌خوری؟',
    'Where do you live? — کجا زندگی می‌کنی؟',
    'When do you study? — چه زمانی درس می‌خوانی؟',
    'Why do you learn English? — چرا انگلیسی یاد می‌گیری؟',
    'How do you go to school? — چطور به مدرسه می‌روی؟',
    'What does he do? — او چه کار می‌کند؟',
    'Where does she live? — او کجا زندگی می‌کند؟',
    'When does the class start? — کلاس چه زمانی شروع می‌شود؟',
    'Why does he study English? — چرا او انگلیسی می‌خواند؟',
    'How does she learn English? — او چگونه انگلیسی یاد می‌گیرد؟',
    'What do they do every day? — آن‌ها هر روز چه کار می‌کنند؟',
    'Does your friend like English? — آیا دوستت انگلیسی را دوست دارد؟',
  ],
  questions: const [
    Question(
      'Complete: "___ you speak English?"',
      ['Do', 'Does', 'Is', 'Are'],
      'Do',
    ),
    Question(
      'Complete: "___ he work here?"',
      ['Do', 'Does', 'Is', 'Are'],
      'Does',
    ),
    Question(
      'What does "question" mean?',
      ['پاسخ', 'سؤال', 'درس', 'کار'],
      'سؤال',
    ),
    Question(
      'How do you say "پاسخ"?',
      ['Question', 'Answer', 'Ask', 'Help'],
      'Answer',
    ),
    Question(
      'Complete: "Do you ___ coffee?"',
      ['like', 'likes', 'liking', 'liked'],
      'like',
    ),
    Question(
      'Complete: "Does she ___ English?"',
      ['speak', 'speaks', 'speaking', 'spoke'],
      'speak',
    ),
    Question(
      'Which is correct?',
      [
        'Does he works?',
        'Does he work?',
        'Do he work?',
        'Does he working?'
      ],
      'Does he work?',
    ),
    Question(
      'What does "ask" mean?',
      ['پرسیدن', 'پاسخ دادن', 'خواندن', 'نوشتن'],
      'پرسیدن',
    ),
    Question(
      'Complete: "___ they study English?"',
      ['Do', 'Does', 'Is', 'Has'],
      'Do',
    ),
    Question(
      'Complete: "___ your sister like tea?"',
      ['Do', 'Does', 'Are', 'Have'],
      'Does',
    ),
    Question(
      'What is the short answer to "Do you work?"',
      ['Yes, I do.', 'Yes, I does.', 'Yes, I am.', 'Yes, I is.'],
      'Yes, I do.',
    ),
    Question(
      'What is the negative answer to "Do you like fish?"',
      ['No, I don’t.', 'No, I doesn’t.', 'No, I am not.', 'No, I isn’t.'],
      'No, I don’t.',
    ),
    Question(
      'What is the short answer to "Does he study?"',
      ['Yes, he do.', 'Yes, he does.', 'Yes, he is.', 'Yes, he has.'],
      'Yes, he does.',
    ),
    Question(
      'Complete: "Where ___ you live?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
    Question(
      'Complete: "Where ___ she live?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
    Question(
      'Complete: "What ___ you eat?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
    Question(
      'Complete: "What ___ he do?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
    Question(
      'What does "live" mean?',
      ['کار کردن', 'زندگی کردن', 'رفتن', 'خوردن'],
      'زندگی کردن',
    ),
    Question(
      'How do you say "یاد گرفتن"?',
      ['Learn', 'Listen', 'Know', 'Speak'],
      'Learn',
    ),
    Question(
      'Complete: "Why ___ you learn English?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
    Question(
      'Complete: "Why ___ he learn English?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
    Question(
      'Complete: "When ___ they study?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
    Question(
      'Complete: "When ___ the class start?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
    Question(
      'What does "often" mean?',
      ['هرگز', 'اغلب', 'همیشه', 'دیروز'],
      'اغلب',
    ),
    Question(
      'How do you say "گوش دادن"?',
      ['Watch', 'Listen', 'Speak', 'Read'],
      'Listen',
    ),
    Question(
      'Complete: "Do they ___ here?"',
      ['work', 'works', 'working', 'worked'],
      'work',
    ),
    Question(
      'Complete: "Does your father ___ here?"',
      ['work', 'works', 'working', 'worked'],
      'work',
    ),
    Question(
      'Which question is correct?',
      [
        'Does she likes tea?',
        'Does she like tea?',
        'Do she like tea?',
        'Does she liking tea?'
      ],
      'Does she like tea?',
    ),
    Question(
      'What does "want" mean?',
      ['خواستن', 'دانستن', 'کمک کردن', 'شروع کردن'],
      'خواستن',
    ),
    Question(
      'Complete: "How ___ she learn English?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
  ],
);
// ==========================================================
// LESSON 10: Countable & Uncountable Nouns
// ==========================================================
final lesson10 = Lesson(
  id: 10,
  title: 'Countable & Uncountable Nouns',
  subtitle: 'اسم‌های قابل شمارش و غیرقابل شمارش',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری کدام اسم‌ها را می‌توانیم بشماریم و کدام اسم‌ها را نمی‌توانیم به‌صورت مستقیم بشماریم.\n\n'
      '📌 نکات مهم\n'
      '۱. اسم‌های قابل شمارش (Countable) را می‌توانیم با عدد بشماریم: one apple, two apples.\n'
      '۲. اسم‌های قابل شمارش مفرد می‌توانند با a/an بیایند: a book, an apple.\n'
      '۳. اسم‌های غیرقابل شمارش (Uncountable) معمولاً به‌صورت مستقیم با عدد نمی‌آیند: water, milk, rice.\n'
      '۴. برای مقدار دادن به اسم‌های غیرقابل شمارش از عباراتی مثل some, a little, a lot of استفاده می‌کنیم.\n'
      '۵. برای پرسیدن مقدار اسم غیرقابل شمارش معمولاً از "How much" استفاده می‌کنیم.\n'
      '۶. برای پرسیدن تعداد اسم‌های قابل شمارش از "How many" استفاده می‌کنیم.\n\n'
      '💡 مثال\n'
      'How many books do you have? → I have three books.\n'
      'How much water do you drink? → I drink a lot of water.',
  formula:
      'Countable: a/an + singular noun\n'
      'one book → two books\n\n'
      'Uncountable: some/much/a little + noun\n'
      'some water → much water\n\n'
      'How many + plural countable noun?\n'
      'How much + uncountable noun?',
  words: const [
    Word('apple', 'سیب', 'AP-ul', '🍎'),
    Word('book', 'کتاب', 'BOOK', '📖'),
    Word('pen', 'خودکار', 'PEN', '🖊️'),
    Word('chair', 'صندلی', 'CHAIR', '🪑'),
    Word('table', 'میز', 'TEY-bul', '🪵'),
    Word('egg', 'تخم‌مرغ', 'EG', '🥚'),
    Word('banana', 'موز', 'buh-NA-nuh', '🍌'),
    Word('bottle', 'بطری', 'BOT-ul', '🍾'),
    Word('water', 'آب', 'WAW-ter', '💧'),
    Word('milk', 'شیر', 'MILK', '🥛'),
    Word('rice', 'برنج', 'RAIS', '🍚'),
    Word('sugar', 'شکر', 'SHOO-ger', '🍬'),
    Word('salt', 'نمک', 'SAWLT', '🧂'),
    Word('bread', 'نان', 'BRED', '🍞'),
    Word('money', 'پول', 'MUN-ee', '💰'),
    Word('food', 'غذا', 'FOOD', '🍽️'),
    Word('coffee', 'قهوه', 'KAW-fee', '☕'),
    Word('tea', 'چای', 'TEE', '🍵'),
    Word('juice', 'آبمیوه', 'JOOS', '🧃'),
    Word('cheese', 'پنیر', 'CHEEZ', '🧀'),
    Word('some', 'مقداری/چندتا', 'SUM', '➕'),
    Word('any', 'هیچ/هر', 'EN-ee', '❓'),
    Word('many', 'زیاد/چندین', 'MEN-ee', '🔢'),
    Word('much', 'زیاد', 'MUCH', '📏'),
    Word('little', 'کم/مقدار کم', 'LIT-ul', '🤏'),
    Word('few', 'تعداد کمی', 'FYOO', '🔢'),
    Word('lot', 'مقدار زیاد', 'LOT', '📦'),
    Word('count', 'شمردن', 'KOWNT', '🔢'),
    Word('number', 'عدد', 'NUM-ber', '🔢'),
  ],
  examples: const [
    'I have an apple. — من یک سیب دارم.',
    'I have two apples. — من دو سیب دارم.',
    'She has a book. — او یک کتاب دارد.',
    'There are three books. — سه کتاب وجود دارد.',
    'I have a pen. — من یک خودکار دارم.',
    'There are four chairs. — چهار صندلی وجود دارد.',
    'I eat an egg every morning. — من هر صبح یک تخم‌مرغ می‌خورم.',
    'There are five bananas. — پنج موز وجود دارد.',
    'I have a bottle of water. — من یک بطری آب دارم.',
    'I drink water every day. — من هر روز آب می‌نوشم.',
    'I drink some milk. — من مقداری شیر می‌نوشم.',
    'We need some rice. — ما مقداری برنج لازم داریم.',
    'Please add some sugar. — لطفاً مقداری شکر اضافه کن.',
    'There is some salt on the table. — مقداری نمک روی میز است.',
    'I eat bread every morning. — من هر صبح نان می‌خورم.',
    'I do not have much money. — پول زیادی ندارم.',
    'We have some food. — ما مقداری غذا داریم.',
    'She drinks coffee every morning. — او هر صبح قهوه می‌نوشد.',
    'I drink tea at night. — من شب چای می‌نوشم.',
    'There is some juice in the fridge. — مقداری آبمیوه در یخچال است.',
    'I eat a little cheese. — من کمی پنیر می‌خورم.',
    'How many apples do you have? — چند سیب داری؟',
    'I have three apples. — من سه سیب دارم.',
    'How many books are there? — چند کتاب وجود دارد؟',
    'There are ten books. — ده کتاب وجود دارد.',
    'How much water do you drink? — چقدر آب می‌نوشی؟',
    'I drink a lot of water. — من مقدار زیادی آب می‌نوشم.',
    'How much milk is there? — چقدر شیر وجود دارد؟',
    'There is a little milk. — کمی شیر وجود دارد.',
    'There are a few eggs. — چند تخم‌مرغ وجود دارد.',
  ],
  questions: const [
    Question('What does "apple" mean?', ['سیب', 'موز', 'نان', 'برنج'], 'سیب'),
    Question('Which is countable?', ['Water', 'Rice', 'Apple', 'Milk'], 'Apple'),
    Question('Complete: "I have ___ apple."', ['a', 'some', 'much', 'many'], 'a'),
    Question('What does "water" mean?', ['شیر', 'آب', 'چای', 'قهوه'], 'آب'),
    Question('Which is uncountable?', ['Book', 'Chair', 'Apple', 'Water'], 'Water'),
    Question('Complete: "I have two ___."', ['book', 'books', 'water', 'rice'], 'books'),
    Question('What does "bread" mean?', ['نان', 'پنیر', 'شکر', 'نمک'], 'نان'),
    Question('How do you say "برنج"?', ['Rice', 'Bread', 'Sugar', 'Salt'], 'Rice'),
    Question('Complete: "There is ___ milk."', ['some', 'many', 'few', 'a'], 'some'),
    Question('What does "money" mean?', ['غذا', 'پول', 'عدد', 'بطری'], 'پول'),
    Question('Which question asks about countable nouns?', ['How much?', 'How many?', 'How old?', 'What time?'], 'How many?'),
    Question('Which question asks about uncountable nouns?', ['How many?', 'How much?', 'How old?', 'Who?'], 'How much?'),
    Question('Complete: "How ___ books do you have?"', ['much', 'many', 'little', 'some'], 'many'),
    Question('Complete: "How ___ water do you drink?"', ['many', 'much', 'few', 'a'], 'much'),
    Question('What does "some" mean?', ['هیچ', 'مقداری/چندتا', 'کم', 'عدد'], 'مقداری/چندتا'),
    Question('What does "many" mean?', ['زیاد/چندین', 'کم', 'مقدار کم', 'هیچ'], 'زیاد/چندین'),
    Question('What does "much" mean?', ['زیاد', 'کم', 'چندتا', 'یکی'], 'زیاد'),
    Question('Complete: "I have a ___ of water."', ['bottle', 'rice', 'money', 'bread'], 'bottle'),
    Question('Which noun can be counted?', ['Milk', 'Sugar', 'Egg', 'Rice'], 'Egg'),
    Question('Which noun is usually uncountable?', ['Banana', 'Pen', 'Money', 'Chair'], 'Money'),
    Question('Complete: "There are ___ eggs."', ['a little', 'a few', 'much', 'some water'], 'a few'),
    Question('What does "little" mean?', ['تعداد زیاد', 'مقدار کم', 'عدد', 'بطری'], 'مقدار کم'),
    Question('Complete: "I drink ___ water."', ['many', 'a lot of', 'a few', 'an'], 'a lot of'),
    Question('What does "cheese" mean?', ['پنیر', 'نان', 'برنج', 'شکر'], 'پنیر'),
    Question('Complete: "She has ___ book."', ['an', 'a', 'some', 'much'], 'a'),
    Question('What is the plural of "apple"?', ['apple', 'apples', 'appleses', 'applees'], 'apples'),
    Question('What is the plural of "book"?', ['book', 'books', 'bookes', 'bookies'], 'books'),
    Question('Complete: "We need ___ rice."', ['some', 'many', 'a few', 'an'], 'some'),
    Question('What does "few" mean?', ['تعداد کمی', 'مقدار زیاد', 'آب', 'عدد'], 'تعداد کمی'),
    Question('Which sentence is correct?', [
      'I have two water.',
      'I have two apples.',
      'I have a milk.',
      'I have many rice.'
    ], 'I have two apples.'),
  ],
);
// ==========================================================
// LESSON 11: There is / There are
// ==========================================================
final lesson11 = Lesson(
  id: 11,
  title: 'There is / There are',
  subtitle: 'وجود داشتن — هست / هستند',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور بگی چیزی یا کسی در یک مکان وجود دارد.\n\n'
      '📌 نکات مهم\n'
      '۱. برای یک چیز یا اسم مفرد از "There is" استفاده می‌کنیم.\n'
      '۲. برای چند چیز یا اسم جمع از "There are" استفاده می‌کنیم.\n'
      '۳. شکل کوتاه "There is" می‌شود "There’s".\n'
      '۴. برای منفی کردن می‌گوییم "There isn’t" و "There aren’t".\n'
      '۵. برای سوالی کردن می‌گوییم "Is there...?" و "Are there...?".\n'
      '۶. برای مقدار نامشخص می‌توانیم از "some" استفاده کنیم: There are some books.\n\n'
      '💡 مثال\n'
      'There is a book on the table. → یک کتاب روی میز هست.\n'
      'There are three books on the table. → سه کتاب روی میز هستند.',
  formula:
      'Singular:\n'
      'There is + a/an + noun\n\n'
      'Plural:\n'
      'There are + number/some + plural noun\n\n'
      'Negative:\n'
      'There isn’t + singular noun\n'
      'There aren’t + plural noun\n\n'
      'Question:\n'
      'Is there + ...?\n'
      'Are there + ...?',
  words: const [
    Word('there', 'آنجا / وجود دارد', 'DHAIR', '📍'),
    Word('room', 'اتاق', 'ROOM', '🚪'),
    Word('kitchen', 'آشپزخانه', 'KITCH-en', '🍳'),
    Word('bathroom', 'حمام / دستشویی', 'BATH-room', '🚿'),
    Word('garden', 'باغ / باغچه', 'GAR-den', '🌳'),
    Word('school', 'مدرسه', 'SKOOL', '🏫'),
    Word('classroom', 'کلاس درس', 'KLASS-room', '🎓'),
    Word('desk', 'میز تحریر', 'DESK', '🪑'),
    Word('window', 'پنجره', 'WIN-doh', '🪟'),
    Word('door', 'در', 'DOR', '🚪'),
    Word('wall', 'دیوار', 'WAWL', '🧱'),
    Word('floor', 'کف / طبقه', 'FLOR', '🏠'),
    Word('bed', 'تختخواب', 'BED', '🛏️'),
    Word('lamp', 'چراغ', 'LAMP', '💡'),
    Word('computer', 'کامپیوتر', 'kum-PYOO-ter', '💻'),
    Word('phone', 'تلفن / گوشی', 'FOHN', '📱'),
    Word('picture', 'عکس / تصویر', 'PIK-cher', '🖼️'),
    Word('chair', 'صندلی', 'CHAIR', '🪑'),
    Word('book', 'کتاب', 'BOOK', '📖'),
    Word('box', 'جعبه', 'BOKS', '📦'),
    Word('table', 'میز', 'TEY-bul', '🪵'),
    Word('street', 'خیابان', 'STREET', '🛣️'),
    Word('park', 'پارک', 'PARK', '🌳'),
    Word('shop', 'فروشگاه', 'SHOP', '🏪'),
    Word('city', 'شهر', 'SIT-ee', '🏙️'),
    Word('some', 'مقداری / چندتا', 'SUM', '➕'),
    Word('any', 'هیچ / مقداری', 'EN-ee', '❓'),
    Word('inside', 'داخل', 'in-SAID', '⬅️'),
    Word('outside', 'بیرون', 'out-SAID', '➡️'),
    Word('near', 'نزدیک', 'NEER', '📍'),
  ],
  examples: const [
    'There is a book on the table. — یک کتاب روی میز هست.',
    'There is a computer in the room. — یک کامپیوتر در اتاق هست.',
    'There is a lamp next to the bed. — یک چراغ کنار تخت هست.',
    'There is a picture on the wall. — یک عکس روی دیوار هست.',
    'There is a chair near the desk. — یک صندلی نزدیک میز هست.',
    'There is a garden behind the house. — یک باغچه پشت خانه هست.',
    'There are two books on the table. — دو کتاب روی میز هستند.',
    'There are three chairs in the room. — سه صندلی در اتاق هستند.',
    'There are five students in the classroom. — پنج دانش‌آموز در کلاس هستند.',
    'There are some pictures on the wall. — چند عکس روی دیوار هستند.',
    'There are two windows in my room. — دو پنجره در اتاق من هست.',
    'There are many shops in the city. — فروشگاه‌های زیادی در شهر هستند.',
    'There isn’t a computer in the kitchen. — کامپیوتری در آشپزخانه نیست.',
    'There isn’t a bed in the classroom. — تختخوابی در کلاس نیست.',
    'There aren’t any books on the desk. — هیچ کتابی روی میز نیست.',
    'There aren’t any students outside. — هیچ دانش‌آموزی بیرون نیست.',
    'Is there a bathroom here? — آیا اینجا حمام/دستشویی هست؟',
    'Is there a park near your house? — آیا نزدیک خانه‌ات پارک هست؟',
    'Is there a computer in your room? — آیا در اتاقت کامپیوتر هست؟',
    'Are there any books on the table? — آیا کتابی روی میز هست؟',
    'Are there two chairs in the room? — آیا دو صندلی در اتاق هست؟',
    'Are there many people outside? — آیا افراد زیادی بیرون هستند؟',
    'There is some water in the bottle. — مقداری آب در بطری هست.',
    'There are some apples in the kitchen. — چند سیب در آشپزخانه هست.',
    'There is a shop near my school. — یک فروشگاه نزدیک مدرسه من هست.',
    'There are many trees in the park. — در پارک درختان زیادی وجود دارند.',
    'There is a phone on the desk. — یک گوشی روی میز هست.',
    'There are four windows in the classroom. — چهار پنجره در کلاس هست.',
    'There is a box under the table. — یک جعبه زیر میز هست.',
    'There are some chairs outside. — چند صندلی بیرون هستند.',
  ],
  questions: const [
    Question(
      'Complete: "___ a book on the table."',
      ['There is', 'There are', 'There am', 'There be'],
      'There is',
    ),
    Question(
      'Complete: "___ three chairs in the room."',
      ['There is', 'There are', 'There am', 'There be'],
      'There are',
    ),
    Question(
      'What does "room" mean?',
      ['اتاق', 'خیابان', 'پارک', 'مدرسه'],
      'اتاق',
    ),
    Question(
      'How do you say "پنجره"?',
      ['Door', 'Window', 'Wall', 'Floor'],
      'Window',
    ),
    Question(
      'Complete: "There ___ a computer here."',
      ['is', 'are', 'am', 'be'],
      'is',
    ),
    Question(
      'Complete: "There ___ two computers here."',
      ['is', 'are', 'am', 'be'],
      'are',
    ),
    Question(
      'What does "garden" mean?',
      ['آشپزخانه', 'باغ / باغچه', 'اتاق', 'خیابان'],
      'باغ / باغچه',
    ),
    Question(
      'Which sentence is correct?',
      [
        'There is two books.',
        'There are two books.',
        'There are a book.',
        'There am two books.'
      ],
      'There are two books.',
    ),
    Question(
      'Which sentence is correct?',
      [
        'There are a computer.',
        'There is a computer.',
        'There am a computer.',
        'There be a computer.'
      ],
      'There is a computer.',
    ),
    Question(
      'Complete: "There ___ a lamp next to the bed."',
      ['is', 'are', 'am', 'be'],
      'is',
    ),
    Question(
      'What does "desk" mean?',
      ['میز تحریر', 'صندلی', 'در', 'پنجره'],
      'میز تحریر',
    ),
    Question(
      'How do you say "در"?',
      ['Wall', 'Door', 'Floor', 'Desk'],
      'Door',
    ),
    Question(
      'Complete: "There ___ some books on the table."',
      ['is', 'are', 'am', 'be'],
      'are',
    ),
    Question(
      'What is the negative of "There is a book."?',
      [
        'There isn’t a book.',
        'There aren’t a book.',
        'There not is a book.',
        'There don’t a book.'
      ],
      'There isn’t a book.',
    ),
    Question(
      'What is the negative of "There are books."?',
      [
        'There isn’t books.',
        'There aren’t books.',
        'There don’t books.',
        'There not are books.'
      ],
      'There aren’t books.',
    ),
    Question(
      'Complete: "___ there a park near here?"',
      ['Is', 'Are', 'Am', 'Be'],
      'Is',
    ),
    Question(
      'Complete: "___ there any books?"',
      ['Is', 'Are', 'Am', 'Be'],
      'Are',
    ),
    Question(
      'What does "inside" mean?',
      ['بیرون', 'داخل', 'نزدیک', 'دور'],
      'داخل',
    ),
    Question(
      'How do you say "بیرون"?',
      ['Inside', 'Outside', 'Near', 'There'],
      'Outside',
    ),
    Question(
      'Complete: "There is a shop ___ my school."',
      ['near', 'many', 'some', 'any'],
      'near',
    ),
    Question(
      'What does "classroom" mean?',
      ['کلاس درس', 'آشپزخانه', 'باغ', 'فروشگاه'],
      'کلاس درس',
    ),
    Question(
      'Complete: "There ___ five students in the classroom."',
      ['is', 'are', 'am', 'be'],
      'are',
    ),
    Question(
      'What does "wall" mean?',
      ['کف', 'دیوار', 'سقف', 'پنجره'],
      'دیوار',
    ),
    Question(
      'How do you say "کف / طبقه"?',
      ['Floor', 'Wall', 'Door', 'Garden'],
      'Floor',
    ),
    Question(
      'Complete: "There ___ a phone on the desk."',
      ['is', 'are', 'am', 'be'],
      'is',
    ),
    Question(
      'What does "park" mean?',
      ['فروشگاه', 'پارک', 'شهر', 'خیابان'],
      'پارک',
    ),
    Question(
      'Complete: "There ___ many trees in the park."',
      ['is', 'are', 'am', 'be'],
      'are',
    ),
    Question(
      'Which is correct?',
      [
        'Is there a computer?',
        'Are there a computer?',
        'There is a computer?',
        'There are a computer?'
      ],
      'Is there a computer?',
    ),
    Question(
      'Which is correct?',
      [
        'Are there any books?',
        'Is there any books?',
        'Are there a books?',
        'There are any books?'
      ],
      'Are there any books?',
    ),
    Question(
      'What does "outside" mean?',
      ['داخل', 'بیرون', 'نزدیک', 'آنجا'],
      'بیرون',
    ),
  ],
);
// ==========================================================
// LESSON 12: Prepositions
// ==========================================================
final lesson12 = Lesson(
  id: 12,
  title: 'Prepositions',
  subtitle: 'حروف اضافه مکان و زمان',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور جای اشیا و افراد را توصیف کنی و از حروف اضافه مهم انگلیسی استفاده کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. in یعنی داخل یک مکان: The book is in the bag.\n'
      '۲. on یعنی روی یک سطح: The phone is on the table.\n'
      '۳. under یعنی زیر چیزی: The shoes are under the bed.\n'
      '۴. next to یعنی کنار چیزی.\n'
      '۵. behind یعنی پشت چیزی و in front of یعنی جلوی چیزی.\n'
      '۶. between یعنی بین دو چیز.\n'
      '۷. near یعنی نزدیک و far from یعنی دور از.\n'
      '۸. برای روزها معمولاً از on و برای ماه‌ها و سال‌ها از in استفاده می‌کنیم.\n\n'
      '💡 مثال\n'
      'The phone is on the table. → گوشی روی میز است.\n'
      'The cat is under the chair. → گربه زیر صندلی است.\n'
      'I live in Iran. → من در ایران زندگی می‌کنم.',
  formula:
      'in + place → in the room\n'
      'on + surface → on the table\n'
      'under + noun → under the bed\n'
      'next to + noun → next to the door\n'
      'behind + noun → behind the house\n'
      'in front of + noun → in front of the school\n'
      'between A and B → between the chairs\n'
      'near + noun → near the park\n'
      'on + day → on Monday\n'
      'in + month/year → in June / in 2026',
  words: const [
    Word('in', 'داخل / در', 'IN', '📦'),
    Word('on', 'روی', 'ON', '⬆️'),
    Word('under', 'زیر', 'UN-der', '⬇️'),
    Word('above', 'بالای', 'uh-BUV', '⬆️'),
    Word('below', 'پایین / زیر', 'bih-LOH', '⬇️'),
    Word('next', 'بعدی / کنار', 'NEKST', '➡️'),
    Word('behind', 'پشت', 'bih-HAIND', '🔙'),
    Word('front', 'جلو', 'FRUNT', '🔜'),
    Word('between', 'بین', 'bih-TWEEN', '↔️'),
    Word('near', 'نزدیک', 'NEER', '📍'),
    Word('far', 'دور', 'FAR', '🌎'),
    Word('beside', 'کنار', 'bih-SAID', '↔️'),
    Word('inside', 'داخل', 'in-SAID', '📥'),
    Word('outside', 'بیرون', 'out-SAID', '📤'),
    Word('around', 'اطراف', 'uh-ROWND', '🔄'),
    Word('opposite', 'مقابل', 'OP-uh-zit', '↔️'),
    Word('place', 'مکان', 'PLEYS', '📍'),
    Word('surface', 'سطح', 'SUR-fis', '⬜'),
    Word('corner', 'گوشه', 'KOR-ner', '📐'),
    Word('side', 'طرف / سمت', 'SAID', '↔️'),
    Word('left', 'چپ', 'LEFT', '⬅️'),
    Word('right', 'راست', 'RAIT', '➡️'),
    Word('middle', 'وسط', 'MID-ul', '🎯'),
    Word('top', 'بالا', 'TOP', '⬆️'),
    Word('bottom', 'پایین', 'BOT-um', '⬇️'),
    Word('wall', 'دیوار', 'WAWL', '🧱'),
    Word('floor', 'کف', 'FLOR', '🏠'),
    Word('ceiling', 'سقف', 'SEE-ling', '🏠'),
    Word('street', 'خیابان', 'STREET', '🛣️'),
    Word('building', 'ساختمان', 'BIL-ding', '🏢'),
  ],
  examples: const [
    'The book is in the bag. — کتاب داخل کیف است.',
    'My phone is on the table. — گوشی من روی میز است.',
    'The shoes are under the bed. — کفش‌ها زیر تخت هستند.',
    'The lamp is above the table. — چراغ بالای میز است.',
    'The chair is below the window. — صندلی زیر پنجره است.',
    'The school is next to the park. — مدرسه کنار پارک است.',
    'The car is behind the house. — ماشین پشت خانه است.',
    'I am in front of the school. — من جلوی مدرسه هستم.',
    'The shop is between the bank and the school. — فروشگاه بین بانک و مدرسه است.',
    'My house is near the park. — خانه من نزدیک پارک است.',
    'The village is far from the city. — روستا از شهر دور است.',
    'The chair is beside the table. — صندلی کنار میز است.',
    'The children are inside the classroom. — بچه‌ها داخل کلاس هستند.',
    'The students are outside the classroom. — دانش‌آموزان بیرون کلاس هستند.',
    'There are trees around the house. — درخت‌هایی اطراف خانه هستند.',
    'The bank is opposite the school. — بانک روبه‌روی مدرسه است.',
    'The book is on the left side. — کتاب در سمت چپ است.',
    'The door is on the right. — در سمت راست است.',
    'The teacher is in the middle of the classroom. — معلم وسط کلاس است.',
    'The clock is at the top of the wall. — ساعت بالای دیوار است.',
    'The shoes are at the bottom of the stairs. — کفش‌ها پایین پله‌ها هستند.',
    'There is a picture on the wall. — یک عکس روی دیوار است.',
    'The bag is on the floor. — کیف روی زمین است.',
    'The lamp is on the ceiling. — چراغ روی سقف است.',
    'I live in Iran. — من در ایران زندگی می‌کنم.',
    'I go to school on Monday. — دوشنبه به مدرسه می‌روم.',
    'My birthday is in May. — تولدم در ماه مه است.',
    'I was born in 2010. — من در سال ۲۰۱۰ به دنیا آمدم.',
    'The store is near the street. — فروشگاه نزدیک خیابان است.',
    'The building is behind the school. — ساختمان پشت مدرسه است.',
  ],
  questions: const [
    Question(
      'Complete: "The book is ___ the bag."',
      ['in', 'on', 'under', 'behind'],
      'in',
    ),
    Question(
      'Complete: "The phone is ___ the table."',
      ['on', 'in', 'between', 'far'],
      'on',
    ),
    Question(
      'What does "under" mean?',
      ['روی', 'زیر', 'داخل', 'پشت'],
      'زیر',
    ),
    Question(
      'How do you say "پشت"?',
      ['Behind', 'Between', 'Above', 'Near'],
      'Behind',
    ),
    Question(
      'Complete: "The cat is ___ the chair."',
      ['under', 'on', 'far', 'between'],
      'under',
    ),
    Question(
      'What does "next to" mean?',
      ['کنار', 'پشت', 'بالای', 'دور'],
      'کنار',
    ),
    Question(
      'Complete: "The school is ___ to the park."',
      ['next', 'far', 'above', 'between'],
      'next',
    ),
    Question(
      'What does "between" mean?',
      ['داخل', 'بین', 'روی', 'پشت'],
      'بین',
    ),
    Question(
      'Complete: "The shop is ___ the bank and the school."',
      ['between', 'under', 'on', 'in'],
      'between',
    ),
    Question(
      'What does "near" mean?',
      ['دور', 'نزدیک', 'پشت', 'بالا'],
      'نزدیک',
    ),
    Question(
      'What is the opposite of "near"?',
      ['Far', 'On', 'In', 'Beside'],
      'Far',
    ),
    Question(
      'Complete: "The car is ___ the house."',
      ['behind', 'in', 'on', 'between'],
      'behind',
    ),
    Question(
      'What does "in front of" mean?',
      ['پشت', 'جلوی', 'داخل', 'زیر'],
      'جلوی',
    ),
    Question(
      'Complete: "I am ___ front of the school."',
      ['in', 'on', 'at', 'under'],
      'in',
    ),
    Question(
      'What does "above" mean?',
      ['بالای', 'پایین', 'داخل', 'کنار'],
      'بالای',
    ),
    Question(
      'What does "below" mean?',
      ['بالا', 'پایین / زیر', 'پشت', 'بین'],
      'پایین / زیر',
    ),
    Question(
      'How do you say "چپ"?',
      ['Right', 'Left', 'Middle', 'Top'],
      'Left',
    ),
    Question(
      'How do you say "راست"?',
      ['Left', 'Right', 'Bottom', 'Front'],
      'Right',
    ),
    Question(
      'What does "middle" mean?',
      ['وسط', 'بالا', 'پایین', 'گوشه'],
      'وسط',
    ),
    Question(
      'Complete: "The teacher is in the ___ of the classroom."',
      ['middle', 'left', 'bottom', 'street'],
      'middle',
    ),
    Question(
      'What does "opposite" mean?',
      ['مقابل', 'داخل', 'زیر', 'کنار'],
      'مقابل',
    ),
    Question(
      'Complete: "The bank is ___ the school."',
      ['opposite', 'inside', 'under', 'above'],
      'opposite',
    ),
    Question(
      'Which preposition is used with days?',
      ['in', 'on', 'under', 'between'],
      'on',
    ),
    Question(
      'Complete: "I go to school ___ Monday."',
      ['on', 'in', 'at', 'under'],
      'on',
    ),
    Question(
      'Which preposition is usually used with months?',
      ['on', 'in', 'under', 'behind'],
      'in',
    ),
    Question(
      'Complete: "My birthday is ___ May."',
      ['in', 'on', 'at', 'between'],
      'in',
    ),
    Question(
      'Complete: "I was born ___ 2010."',
      ['in', 'on', 'under', 'near'],
      'in',
    ),
    Question(
      'What does "outside" mean?',
      ['داخل', 'بیرون', 'بالا', 'بین'],
      'بیرون',
    ),
    Question(
      'What does "ceiling" mean?',
      ['کف', 'دیوار', 'سقف', 'پنجره'],
      'سقف',
    ),
    Question(
      'Which sentence is correct?',
      [
        'The book is in the bag.',
        'The book is in bag the.',
        'The book are in the bag.',
        'The book is on the bag.'
      ],
      'The book is in the bag.',
    ),
  ],
);
// ==========================================================
// LESSON 13: Can & Can't
// ==========================================================
final lesson13 = Lesson(
  id: 13,
  title: 'Can & Can\'t',
  subtitle: 'توانایی و ناتوانی',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور درباره توانایی‌ها و ناتوانی‌های خودت و دیگران صحبت کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. از can برای بیان توانایی استفاده می‌کنیم: I can swim. یعنی من می‌توانم شنا کنم.\n'
      '۲. از can\'t برای بیان ناتوانی استفاده می‌کنیم: I can\'t swim. یعنی من نمی‌توانم شنا کنم.\n'
      '۳. بعد از can و can\'t همیشه شکل ساده فعل می‌آید: can play, can speak, can run.\n'
      '۴. برای سوالی کردن، can را به ابتدای جمله می‌بریم: Can you swim?\n'
      '۵. جواب کوتاه مثبت: Yes, I can. جواب کوتاه منفی: No, I can\'t.\n'
      '۶. برای he, she و they هم خود can تغییر نمی‌کند: He can run. / She can sing. / They can dance.\n\n'
      '⚠️ نکته مهم\n'
      'بعد از can از to استفاده نمی‌کنیم. درست: I can swim. نادرست: I can to swim.',
  formula:
      'Positive: Subject + can + verb\n'
      'Negative: Subject + can\'t + verb\n'
      'Question: Can + subject + verb?\n\n'
      'I can swim.\n'
      'I can\'t swim.\n'
      'Can you swim?\n'
      'Yes, I can. / No, I can\'t.',
  words: const [
    Word('can', 'توانستن', 'KAN', '💪'),
    Word('cannot', 'نتوانستن', 'KAN-not', '🚫'),
    Word('swim', 'شنا کردن', 'SWIM', '🏊'),
    Word('run', 'دویدن', 'RUN', '🏃'),
    Word('walk', 'راه رفتن', 'WAWK', '🚶'),
    Word('jump', 'پریدن', 'JUMP', '🤸'),
    Word('dance', 'رقصیدن', 'DANS', '💃'),
    Word('sing', 'آواز خواندن', 'SING', '🎤'),
    Word('speak', 'صحبت کردن', 'SPEEK', '🗣️'),
    Word('read', 'خواندن', 'REED', '📖'),
    Word('write', 'نوشتن', 'RAIT', '✍️'),
    Word('cook', 'آشپزی کردن', 'KOOK', '🍳'),
    Word('drive', 'رانندگی کردن', 'DRAIV', '🚗'),
    Word('ride', 'سوار شدن', 'RAID', '🚲'),
    Word('draw', 'نقاشی کشیدن', 'DRAW', '🎨'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('help', 'کمک کردن', 'HELP', '🤝'),
    Word('use', 'استفاده کردن', 'YOOZ', '🔧'),
    Word('understand', 'متوجه شدن', 'un-der-STAND', '🧠'),
    Word('remember', 'به یاد آوردن', 'ree-MEM-ber', '🧠'),
    Word('learn', 'یاد گرفتن', 'LURN', '📚'),
    Word('make', 'ساختن', 'MEYK', '🛠️'),
    Word('fix', 'تعمیر کردن', 'FIKS', '🔨'),
    Word('open', 'باز کردن', 'OH-pen', '🔓'),
    Word('close', 'بستن', 'KLOHZ', '🔒'),
    Word('fast', 'سریع', 'FAST', '⚡'),
    Word('slow', 'آهسته', 'SLOH', '🐢'),
    Word('well', 'به خوبی', 'WEL', '👍'),
    Word('together', 'با هم', 'tuh-GETH-er', '🤝'),
  ],
  examples: const [
    'I can swim. — من می‌توانم شنا کنم.',
    'I can run fast. — من می‌توانم سریع بدوم.',
    'She can dance. — او می‌تواند برقصد.',
    'He can sing very well. — او می‌تواند خیلی خوب آواز بخواند.',
    'They can speak English. — آن‌ها می‌توانند انگلیسی صحبت کنند.',
    'We can play football. — ما می‌توانیم فوتبال بازی کنیم.',
    'I can read English. — من می‌توانم انگلیسی بخوانم.',
    'My sister can cook. — خواهرم می‌تواند آشپزی کند.',
    'He can drive a car. — او می‌تواند ماشین براند.',
    'I can ride a bike. — من می‌توانم دوچرخه‌سواری کنم.',
    'She can draw very well. — او می‌تواند خیلی خوب نقاشی بکشد.',
    'I can help you. — من می‌توانم به تو کمک کنم.',
    'I can understand English. — من می‌توانم انگلیسی را متوجه شوم.',
    'I can learn quickly. — من می‌توانم سریع یاد بگیرم.',
    'I can make a cake. — من می‌توانم کیک درست کنم.',
    'He can fix the computer. — او می‌تواند کامپیوتر را تعمیر کند.',
    'I can open the door. — من می‌توانم در را باز کنم.',
    'I can\'t swim. — من نمی‌توانم شنا کنم.',
    'He can\'t drive. — او نمی‌تواند رانندگی کند.',
    'She can\'t speak English. — او نمی‌تواند انگلیسی صحبت کند.',
    'I can\'t remember his name. — نمی‌توانم اسم او را به یاد بیاورم.',
    'Can you swim? — می‌توانی شنا کنی؟',
    'Can you speak English? — می‌توانی انگلیسی صحبت کنی؟',
    'Can he drive? — آیا او می‌تواند رانندگی کند؟',
    'Can she cook? — آیا او می‌تواند آشپزی کند؟',
    'Can they play football? — آیا آن‌ها می‌توانند فوتبال بازی کنند؟',
    'Yes, I can. — بله، می‌توانم.',
    'No, I can\'t. — نه، نمی‌توانم.',
    'Yes, she can. — بله، او می‌تواند.',
    'No, he can\'t. — نه، او نمی‌تواند.',
  ],
  questions: const [
    Question(
      'What does "can" mean?',
      ['توانستن', 'دویدن', 'خواندن', 'ساختن'],
      'توانستن',
    ),
    Question(
      'What does "swim" mean?',
      ['شنا کردن', 'دویدن', 'رقصیدن', 'خواندن'],
      'شنا کردن',
    ),
    Question(
      'Complete: "I ___ swim."',
      ['can', 'am', 'is', 'are'],
      'can',
    ),
    Question(
      'Complete: "I ___ swim." (I am not able)',
      ['can\'t', 'can', 'am', 'is'],
      'can\'t',
    ),
    Question(
      'What does "run" mean?',
      ['دویدن', 'راه رفتن', 'پریدن', 'شنا کردن'],
      'دویدن',
    ),
    Question(
      'How do you say "رقصیدن"?',
      ['Sing', 'Dance', 'Run', 'Walk'],
      'Dance',
    ),
    Question(
      'Complete: "She ___ sing."',
      ['can', 'can\'t', 'is', 'does'],
      'can',
    ),
    Question(
      'What does "speak" mean?',
      ['صحبت کردن', 'نوشتن', 'خواندن', 'کمک کردن'],
      'صحبت کردن',
    ),
    Question(
      'Complete: "They can ___ English."',
      ['speak', 'speaks', 'speaking', 'spoke'],
      'speak',
    ),
    Question(
      'How do you say "خواندن"?',
      ['Write', 'Read', 'Cook', 'Draw'],
      'Read',
    ),
    Question(
      'What does "write" mean?',
      ['نوشتن', 'خواندن', 'ساختن', 'تعمیر کردن'],
      'نوشتن',
    ),
    Question(
      'Complete: "Can you ___?"',
      ['swim', 'swims', 'swimming', 'swam'],
      'swim',
    ),
    Question(
      'How do you make a question with "can"?',
      ['Can + subject + verb', 'Subject + can + verb',
       'Do + can + verb', 'Can + verb + subject + to'],
      'Can + subject + verb',
    ),
    Question(
      'What is the correct answer to "Can you swim?"',
      ['Yes, I can.', 'Yes, I am.', 'Yes, I do.', 'Yes, I have.'],
      'Yes, I can.',
    ),
    Question(
      'What is the negative short answer?',
      ['No, I can\'t.', 'No, I don\'t.', 'No, I am not.', 'No, I haven\'t.'],
      'No, I can\'t.',
    ),
    Question(
      'Complete: "He ___ drive a car."',
      ['can', 'cans', 'can to', 'is can'],
      'can',
    ),
    Question(
      'What does "cook" mean?',
      ['آشپزی کردن', 'رانندگی کردن', 'خواندن', 'پریدن'],
      'آشپزی کردن',
    ),
    Question(
      'How do you say "رانندگی کردن"?',
      ['Ride', 'Drive', 'Walk', 'Run'],
      'Drive',
    ),
    Question(
      'Complete: "She can ___ very well."',
      ['dance', 'dances', 'dancing', 'to dance'],
      'dance',
    ),
    Question(
      'What does "draw" mean?',
      ['نقاشی کشیدن', 'نوشتن', 'ساختن', 'بستن'],
      'نقاشی کشیدن',
    ),
    Question(
      'Complete: "I can ___ a bike."',
      ['ride', 'rides', 'riding', 'to ride'],
      'ride',
    ),
    Question(
      'What does "help" mean?',
      ['کمک کردن', 'یاد گرفتن', 'استفاده کردن', 'ساختن'],
      'کمک کردن',
    ),
    Question(
      'Complete: "I can ___ you."',
      ['help', 'helps', 'helping', 'to help'],
      'help',
    ),
    Question(
      'What does "understand" mean?',
      ['متوجه شدن', 'به یاد آوردن', 'آشپزی کردن', 'صحبت کردن'],
      'متوجه شدن',
    ),
    Question(
      'Complete: "I can ___ English."',
      ['understand', 'understands', 'understanding', 'to understand'],
      'understand',
    ),
    Question(
      'What does "remember" mean?',
      ['به یاد آوردن', 'فراموش کردن', 'یاد گرفتن', 'ساختن'],
      'به یاد آوردن',
    ),
    Question(
      'Complete: "He can ___ the computer."',
      ['fix', 'fixes', 'fixing', 'to fix'],
      'fix',
    ),
    Question(
      'What does "fast" mean?',
      ['سریع', 'آهسته', 'خوب', 'ضعیف'],
      'سریع',
    ),
    Question(
      'What does "slow" mean?',
      ['سریع', 'آهسته', 'قوی', 'بلند'],
      'آهسته',
    ),
    Question(
      'Complete: "Can she cook?"',
      ['Yes, she can.', 'Yes, she is.', 'Yes, she does.', 'Yes, she has.'],
      'Yes, she can.',
    ),
  ],
);
// ==========================================================
// LESSON 14: Question Words
// ==========================================================
final lesson14 = Lesson(
  id: 14,
  title: 'Question Words',
  subtitle: 'کلمات پرسشی: What, Where, When, Who, Why, How',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری با کلمات پرسشی مهم انگلیسی سؤال بسازی و اطلاعات مختلف را بپرسی.\n\n'
      '📌 نکات مهم\n'
      '۱. What = چه / چی → برای پرسیدن درباره چیزها.\n'
      '۲. Where = کجا → برای پرسیدن درباره مکان.\n'
      '۳. When = کی / چه زمانی → برای پرسیدن درباره زمان.\n'
      '۴. Who = چه کسی / کی → برای پرسیدن درباره افراد.\n'
      '۵. Why = چرا → برای پرسیدن دلیل.\n'
      '۶. How = چگونه / چطور → برای پرسیدن روش یا وضعیت.\n'
      '۷. معمولاً بعد از کلمه پرسشی، فعل کمکی یا فعل to be می‌آید.\n'
      '۸. برای پرسیدن سن از How old و برای پرسیدن تعداد از How many استفاده می‌کنیم.\n'
      '۹. برای پرسیدن قیمت از How much استفاده می‌کنیم.\n\n'
      '💡 مثال\n'
      'What do you want? → چی می‌خواهی؟\n'
      'Where do you live? → کجا زندگی می‌کنی؟\n'
      'When do you study? → کی درس می‌خوانی؟\n'
      'Who is your teacher? → معلمت کیست؟\n'
      'Why are you late? → چرا دیر کردی؟\n'
      'How are you? → حالت چطوره؟',
  formula:
      'What + ...? → چه چیزی؟\n'
      'Where + ...? → کجا؟\n'
      'When + ...? → چه زمانی؟\n'
      'Who + ...? → چه کسی؟\n'
      'Why + ...? → چرا؟\n'
      'How + ...? → چگونه؟\n\n'
      'How old ...? → چند ساله؟\n'
      'How many ...? → چند تا؟\n'
      'How much ...? → چقدر؟',
  words: const [
    Word('what', 'چه / چی', 'WUT', '❓'),
    Word('where', 'کجا', 'WAIR', '📍'),
    Word('when', 'کی / چه زمانی', 'WEN', '⏰'),
    Word('who', 'چه کسی / کی', 'HOO', '👤'),
    Word('why', 'چرا', 'WAI', '🤔'),
    Word('how', 'چطور / چگونه', 'HOW', '❓'),
    Word('question', 'سؤال', 'KWES-chun', '❓'),
    Word('answer', 'جواب', 'AN-ser', '✅'),
    Word('place', 'مکان', 'PLEYS', '📍'),
    Word('time', 'زمان', 'TAIM', '⏰'),
    Word('person', 'شخص', 'PUR-sun', '👤'),
    Word('reason', 'دلیل', 'REE-zun', '💡'),
    Word('way', 'روش / راه', 'WEY', '🛣️'),
    Word('thing', 'چیز', 'THING', '📦'),
    Word('name', 'اسم', 'NEYM', '📛'),
    Word('address', 'آدرس', 'AD-res', '🏠'),
    Word('age', 'سن', 'EYJ', '🎂'),
    Word('number', 'عدد / شماره', 'NUM-ber', '🔢'),
    Word('price', 'قیمت', 'PRAIS', '💰'),
    Word('favorite', 'مورد علاقه', 'FEY-vuh-rit', '❤️'),
    Word('because', 'زیرا / چون', 'bi-KOZ', '💡'),
    Word('today', 'امروز', 'tuh-DEY', '📅'),
    Word('tomorrow', 'فردا', 'tuh-MOR-oh', '📆'),
    Word('yesterday', 'دیروز', 'YES-ter-dey', '📆'),
    Word('live', 'زندگی کردن', 'LIV', '🏠'),
    Word('work', 'کار کردن', 'WURK', '💼'),
    Word('study', 'درس خواندن', 'STUD-ee', '📚'),
    Word('want', 'خواستن', 'WONT', '⭐'),
    Word('need', 'نیاز داشتن', 'NEED', '🛒'),
    Word('know', 'دانستن', 'NOH', '🧠'),
  ],
  examples: const [
    'What is your name? — اسمت چیست؟',
    'What do you want? — چه می‌خواهی؟',
    'What is this? — این چیست؟',
    'What do you study? — چه چیزی می‌خوانی؟',
    'Where do you live? — کجا زندگی می‌کنی؟',
    'Where is my phone? — گوشی من کجاست؟',
    'Where is the school? — مدرسه کجاست؟',
    'Where do you work? — کجا کار می‌کنی؟',
    'When is your birthday? — تولدت چه زمانی است؟',
    'When do you study English? — چه زمانی انگلیسی می‌خوانی؟',
    'When do you go to school? — چه زمانی به مدرسه می‌روی؟',
    'When is the meeting? — جلسه چه زمانی است؟',
    'Who is your teacher? — معلمت کیست؟',
    'Who is that boy? — آن پسر کیست؟',
    'Who is your best friend? — بهترین دوستت کیست؟',
    'Who can help me? — چه کسی می‌تواند به من کمک کند؟',
    'Why are you late? — چرا دیر کردی؟',
    'Why are you sad? — چرا ناراحتی؟',
    'Why do you study English? — چرا انگلیسی می‌خوانی؟',
    'Why is he angry? — چرا او عصبانی است؟',
    'How are you? — حالت چطوره؟',
    'How do you go to school? — چطور به مدرسه می‌روی؟',
    'How do you make this? — چطور این را درست می‌کنی؟',
    'How can I help you? — چطور می‌توانم به تو کمک کنم؟',
    'How old are you? — چند سالت است؟',
    'How many brothers do you have? — چند برادر داری؟',
    'How much is this? — این چقدر قیمت دارد؟',
    'What is your favorite color? — رنگ مورد علاقه‌ات چیست؟',
    'Why do you need this? — چرا به این نیاز داری؟',
    'Where is your house? — خانه‌ات کجاست؟',
  ],
  questions: const [
    Question(
      'What does "what" mean?',
      ['چه / چی', 'کجا', 'چرا', 'چه کسی'],
      'چه / چی',
    ),
    Question(
      'What does "where" mean?',
      ['کی', 'کجا', 'چرا', 'چطور'],
      'کجا',
    ),
    Question(
      'What does "when" mean?',
      ['چه زمانی', 'چه کسی', 'کجا', 'چرا'],
      'چه زمانی',
    ),
    Question(
      'What does "who" mean?',
      ['چه چیزی', 'کجا', 'چه کسی', 'چطور'],
      'چه کسی',
    ),
    Question(
      'What does "why" mean?',
      ['چرا', 'کجا', 'کی', 'چه چیزی'],
      'چرا',
    ),
    Question(
      'What does "how" mean?',
      ['چطور / چگونه', 'چرا', 'کجا', 'چه کسی'],
      'چطور / چگونه',
    ),
    Question(
      'Complete: "___ is your name?"',
      ['What', 'Where', 'Why', 'When'],
      'What',
    ),
    Question(
      'Complete: "___ do you live?"',
      ['Where', 'What', 'Who', 'Why'],
      'Where',
    ),
    Question(
      'Complete: "___ is your birthday?"',
      ['When', 'Where', 'Who', 'How'],
      'When',
    ),
    Question(
      'Complete: "___ is your teacher?"',
      ['Who', 'What', 'Where', 'Why'],
      'Who',
    ),
    Question(
      'Complete: "___ are you late?"',
      ['Why', 'Who', 'When', 'Where'],
      'Why',
    ),
    Question(
      'Complete: "___ are you?"',
      ['How', 'What', 'Who', 'Where'],
      'How',
    ),
    Question(
      'Which question asks about a place?',
      ['Where do you live?', 'What is your name?', 'Why are you sad?', 'Who is he?'],
      'Where do you live?',
    ),
    Question(
      'Which question asks about a person?',
      ['Who is he?', 'Where is he?', 'When is it?', 'Why is he here?'],
      'Who is he?',
    ),
    Question(
      'Which question asks about a reason?',
      ['Why are you here?', 'Where are you?', 'Who are you?', 'What is this?'],
      'Why are you here?',
    ),
    Question(
      'Which question asks about time?',
      ['When do you study?', 'Where do you study?', 'Who studies?', 'Why do you study?'],
      'When do you study?',
    ),
    Question(
      'Which question asks about a thing?',
      ['What is this?', 'Where is this?', 'Who is this?', 'Why is this?'],
      'What is this?',
    ),
    Question(
      'Complete: "___ old are you?"',
      ['How', 'What', 'Where', 'Why'],
      'How',
    ),
    Question(
      'Complete: "___ many brothers do you have?"',
      ['How', 'What', 'Where', 'Who'],
      'How',
    ),
    Question(
      'Complete: "___ much is this?"',
      ['How', 'What', 'Why', 'When'],
      'How',
    ),
    Question(
      'What does "answer" mean?',
      ['جواب', 'سؤال', 'دلیل', 'مکان'],
      'جواب',
    ),
    Question(
      'What does "question" mean?',
      ['سؤال', 'جواب', 'زمان', 'آدرس'],
      'سؤال',
    ),
    Question(
      'What does "reason" mean?',
      ['دلیل', 'مکان', 'زمان', 'اسم'],
      'دلیل',
    ),
    Question(
      'What does "place" mean?',
      ['مکان', 'دلیل', 'جواب', 'سن'],
      'مکان',
    ),
    Question(
      'What does "age" mean?',
      ['سن', 'قیمت', 'شماره', 'آدرس'],
      'سن',
    ),
    Question(
      'What does "price" mean?',
      ['قیمت', 'اسم', 'سن', 'مکان'],
      'قیمت',
    ),
    Question(
      'Complete: "___ do you study English?"',
      ['Why', 'Who', 'Where', 'What'],
      'Why',
    ),
    Question(
      'Complete: "___ can help me?"',
      ['Who', 'Why', 'Where', 'When'],
      'Who',
    ),
    Question(
      'Complete: "___ do you go to school?"',
      ['How', 'Who', 'Why', 'What'],
      'How',
    ),
    Question(
      'Complete: "___ is your favorite color?"',
      ['What', 'Where', 'When', 'Who'],
      'What',
    ),
  ],
);
// ==========================================================
// LESSON 15: Adverbs of Frequency
// ==========================================================
final lesson15 = Lesson(
  id: 15,
  title: 'Adverbs of Frequency',
  subtitle: 'قیدهای تکرار',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور بگی یک کار را چند وقت یک‌بار انجام می‌دهی؛ مثلاً همیشه، معمولاً، اغلب، گاهی یا هرگز.\n\n'
      '📌 نکات مهم\n'
      '۱. always = همیشه؛ برای کاری که تقریباً همیشه انجام می‌شود.\n'
      '۲. usually = معمولاً؛ برای کاری که بیشتر اوقات انجام می‌شود.\n'
      '۳. often = اغلب؛ برای کاری که زیاد اتفاق می‌افتد.\n'
      '۴. sometimes = گاهی؛ برای کاری که بعضی وقت‌ها اتفاق می‌افتد.\n'
      '۵. rarely = به ندرت؛ برای کاری که خیلی کم اتفاق می‌افتد.\n'
      '۶. never = هرگز؛ برای کاری که اصلاً اتفاق نمی‌افتد.\n'
      '۷. با فعل‌های معمولی، قید تکرار معمولاً قبل از فعل اصلی می‌آید: I always study.\n'
      '۸. با فعل to be، قید معمولاً بعد از am/is/are می‌آید: I am always happy.\n'
      '۹. این قیدها معمولاً با Present Simple استفاده می‌شوند.\n\n'
      '💡 ترتیب تقریبی تکرار:\n'
      'Always → Usually → Often → Sometimes → Rarely → Never',
  formula:
      'Subject + adverb + main verb\n'
      'I always study English.\n'
      'She usually walks to school.\n\n'
      'Subject + be + adverb\n'
      'I am always happy.\n'
      'He is never late.\n\n'
      'Frequency: always → usually → often → sometimes → rarely → never',
  words: const [
    Word('always', 'همیشه', 'AWL-wayz', '🔄'),
    Word('usually', 'معمولاً', 'YOO-zhoo-uh-lee', '📅'),
    Word('often', 'اغلب', 'AW-fun', '🔁'),
    Word('sometimes', 'گاهی', 'SUM-taimz', '🔄'),
    Word('rarely', 'به ندرت', 'RAIR-lee', '🔽'),
    Word('never', 'هرگز', 'NEV-er', '🚫'),
    Word('often', 'اغلب', 'AW-fun', '🔁'),
    Word('every', 'هر', 'EV-ree', '📆'),
    Word('day', 'روز', 'DEY', '☀️'),
    Word('week', 'هفته', 'WEEK', '🗓️'),
    Word('weekend', 'آخر هفته', 'WEEK-end', '🎉'),
    Word('morning', 'صبح', 'MOR-ning', '🌅'),
    Word('night', 'شب', 'NAIT', '🌙'),
    Word('routine', 'روال روزانه', 'roo-TEEN', '📋'),
    Word('habit', 'عادت', 'HAB-it', '🔄'),
    Word('exercise', 'ورزش کردن', 'EK-ser-size', '🏃'),
    Word('study', 'درس خواندن', 'STUD-ee', '📚'),
    Word('work', 'کار کردن', 'WURK', '💼'),
    Word('sleep', 'خوابیدن', 'SLEEP', '😴'),
    Word('eat', 'خوردن', 'EET', '🍽️'),
    Word('drink', 'نوشیدن', 'DRINK', '🥤'),
    Word('read', 'خواندن', 'REED', '📖'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('go', 'رفتن', 'GOH', '🚶'),
    Word('come', 'آمدن', 'KUM', '👋'),
    Word('visit', 'دیدن / سر زدن', 'VIZ-it', '🏠'),
    Word('late', 'دیر', 'LEYT', '⏰'),
    Word('early', 'زود', 'ER-lee', '🌅'),
  ],
  examples: const [
    'I always study English. — من همیشه انگلیسی می‌خوانم.',
    'I always wake up early. — من همیشه زود بیدار می‌شوم.',
    'She always helps her mother. — او همیشه به مادرش کمک می‌کند.',
    'We usually eat breakfast at home. — ما معمولاً صبحانه را در خانه می‌خوریم.',
    'I usually go to school by bus. — من معمولاً با اتوبوس به مدرسه می‌روم.',
    'He usually studies at night. — او معمولاً شب درس می‌خواند.',
    'I often read books. — من اغلب کتاب می‌خوانم.',
    'She often plays football. — او اغلب فوتبال بازی می‌کند.',
    'We often watch movies. — ما اغلب فیلم تماشا می‌کنیم.',
    'I sometimes drink coffee. — من گاهی قهوه می‌نوشم.',
    'He sometimes walks to school. — او گاهی پیاده به مدرسه می‌رود.',
    'They sometimes visit their grandparents. — آن‌ها گاهی به پدربزرگ و مادربزرگشان سر می‌زنند.',
    'I rarely eat fast food. — من به ندرت فست‌فود می‌خورم.',
    'She rarely watches TV. — او به ندرت تلویزیون تماشا می‌کند.',
    'We rarely go there. — ما به ندرت به آنجا می‌رویم.',
    'I never smoke. — من هرگز سیگار نمی‌کشم.',
    'He never comes late. — او هرگز دیر نمی‌آید.',
    'She never misses school. — او هرگز مدرسه را از دست نمی‌دهد.',
    'I am always happy. — من همیشه خوشحالم.',
    'He is usually busy. — او معمولاً مشغول است.',
    'She is often tired. — او اغلب خسته است.',
    'They are sometimes late. — آن‌ها گاهی دیر می‌کنند.',
    'I am rarely angry. — من به ندرت عصبانی می‌شوم.',
    'He is never late. — او هرگز دیر نمی‌کند.',
    'I study every day. — من هر روز درس می‌خوانم.',
    'I exercise every morning. — من هر صبح ورزش می‌کنم.',
    'We play football every weekend. — ما هر آخر هفته فوتبال بازی می‌کنیم.',
    'I usually read before bed. — من معمولاً قبل از خواب مطالعه می‌کنم.',
    'Do you often study English? — آیا اغلب انگلیسی می‌خوانی؟',
    'How often do you exercise? — هر چند وقت یک‌بار ورزش می‌کنی؟',
  ],
  questions: const [
    Question(
      'What does "always" mean?',
      ['همیشه', 'گاهی', 'هرگز', 'به ندرت'],
      'همیشه',
    ),
    Question(
      'What does "usually" mean?',
      ['معمولاً', 'هرگز', 'گاهی', 'به ندرت'],
      'معمولاً',
    ),
    Question(
      'What does "often" mean?',
      ['اغلب', 'هرگز', 'گاهی', 'همیشه'],
      'اغلب',
    ),
    Question(
      'What does "sometimes" mean?',
      ['گاهی', 'همیشه', 'هرگز', 'معمولاً'],
      'گاهی',
    ),
    Question(
      'What does "rarely" mean?',
      ['به ندرت', 'اغلب', 'همیشه', 'معمولاً'],
      'به ندرت',
    ),
    Question(
      'What does "never" mean?',
      ['هرگز', 'همیشه', 'اغلب', 'گاهی'],
      'هرگز',
    ),
    Question(
      'Complete: "I ___ study English."',
      ['always', 'am', 'is', 'are'],
      'always',
    ),
    Question(
      'Complete: "She ___ goes to school by bus."',
      ['usually', 'is', 'are', 'am'],
      'usually',
    ),
    Question(
      'Complete: "He ___ reads books."',
      ['often', 'is', 'are', 'does'],
      'often',
    ),
    Question(
      'Complete: "I ___ watch TV."',
      ['sometimes', 'am', 'is', 'are'],
      'sometimes',
    ),
    Question(
      'Complete: "We ___ eat fast food."',
      ['rarely', 'are', 'is', 'am'],
      'rarely',
    ),
    Question(
      'Complete: "I ___ smoke."',
      ['never', 'always', 'usually', 'often'],
      'never',
    ),
    Question(
      'Where does the adverb usually go with a main verb?',
      ['Before the main verb', 'After the main verb', 'At the end always', 'Before the subject'],
      'Before the main verb',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'I always study.',
        'I study always.',
        'Always I study.',
        'I am study always.'
      ],
      'I always study.',
    ),
    Question(
      'Where does the adverb usually go with "be"?',
      ['After am/is/are', 'Before am/is/are', 'After every noun', 'Before the subject'],
      'After am/is/are',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'I am always happy.',
        'I always am happy.',
        'I am happy always.',
        'Always I am happy.'
      ],
      'I am always happy.',
    ),
    Question(
      'What does "habit" mean?',
      ['عادت', 'روز', 'هفته', 'صبح'],
      'عادت',
    ),
    Question(
      'What does "routine" mean?',
      ['روال روزانه', 'تعطیلات', 'ورزش', 'خواب'],
      'روال روزانه',
    ),
    Question(
      'Complete: "I study ___ day."',
      ['every', 'never', 'rarely', 'often'],
      'every',
    ),
    Question(
      'What does "exercise" mean?',
      ['ورزش کردن', 'خوابیدن', 'خواندن', 'نوشیدن'],
      'ورزش کردن',
    ),
    Question(
      'Complete: "I ___ exercise every morning."',
      ['usually', 'am', 'is', 'are'],
      'usually',
    ),
    Question(
      'What does "sleep" mean?',
      ['خوابیدن', 'خوردن', 'نوشیدن', 'رفتن'],
      'خوابیدن',
    ),
    Question(
      'Complete: "I ___ read before bed."',
      ['usually', 'am', 'is', 'are'],
      'usually',
    ),
    Question(
      'What does "visit" mean?',
      ['دیدن / سر زدن', 'خوابیدن', 'کار کردن', 'دویدن'],
      'دیدن / سر زدن',
    ),
    Question(
      'Complete: "They ___ visit their grandparents."',
      ['sometimes', 'is', 'am', 'are'],
      'sometimes',
    ),
    Question(
      'What does "early" mean?',
      ['زود', 'دیر', 'اغلب', 'هرگز'],
      'زود',
    ),
    Question(
      'What does "late" mean?',
      ['دیر', 'زود', 'همیشه', 'معمولاً'],
      'دیر',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'He is never late.',
        'He never is late.',
        'He is late never.',
        'Never he is late.'
      ],
      'He is never late.',
    ),
    Question(
      'Which sentence is correct?',
      [
        'She often reads books.',
        'She often read books.',
        'She reads often books.',
        'She is often read books.'
      ],
      'She often reads books.',
    ),
    Question(
      'What question asks about frequency?',
      [
        'How often do you exercise?',
        'Where do you exercise?',
        'Who do you exercise with?',
        'Why do you exercise?'
      ],
      'How often do you exercise?',
    ),
  ],
);
// ==========================================================
// LESSON 16: How Often?
// ==========================================================
final lesson16 = Lesson(
  id: 16,
  title: 'How Often?',
  subtitle: 'چند وقت یک‌بار؟',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور درباره‌ی تعداد دفعات انجام یک کار سؤال بپرسی و جواب بدهی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای پرسیدن «چند وقت یک‌بار؟» از How often استفاده می‌کنیم.\n'
      '۲. جواب می‌تواند شامل always، usually، often، sometimes، rarely و never باشد.\n'
      '۳. همچنین می‌توانیم از عبارت‌هایی مثل every day، once a week و twice a month استفاده کنیم.\n'
      '۴. برای تعداد دفعات می‌گوییم once = یک بار، twice = دو بار و three times = سه بار.\n'
      '۵. برای پرسیدن تعداد دفعات یک کار، ساختار رایج این است: How often + do/does + subject + verb?\n'
      '۶. برای he/she/it از does استفاده می‌کنیم: How often does he study?\n'
      '۷. برای I/you/we/they از do استفاده می‌کنیم: How often do you exercise?',
  formula:
      'How often + do/does + subject + verb?\n'
      'How often do you study? → Every day.\n'
      'How often does she exercise? → Twice a week.\n\n'
      'once = یک بار\n'
      'twice = دو بار\n'
      'three times = سه بار',
  words: const [
    Word('often', 'اغلب', 'OF-en', '🔄'),
    Word('always', 'همیشه', 'AWL-wayz', '♾️'),
    Word('usually', 'معمولاً', 'YOO-zhoo-uh-lee', '📅'),
    Word('sometimes', 'گاهی اوقات', 'SUM-taimz', '🔀'),
    Word('rarely', 'به‌ندرت', 'RAIR-lee', '🔽'),
    Word('never', 'هرگز', 'NEV-er', '🚫'),
    Word('once', 'یک بار', 'WUNS', '1️⃣'),
    Word('twice', 'دو بار', 'TWAIS', '2️⃣'),
    Word('times', 'بار/دفعات', 'TAIMZ', '🔢'),
    Word('daily', 'روزانه', 'DEY-lee', '☀️'),
    Word('weekly', 'هفتگی', 'WEEK-lee', '🗓️'),
    Word('monthly', 'ماهانه', 'MUNTH-lee', '📆'),
    Word('every', 'هر', 'EV-ree', '🔁'),
    Word('exercise', 'ورزش کردن', 'EK-ser-saiz', '🏃'),
    Word('study', 'مطالعه کردن', 'STUH-dee', '📚'),
    Word('practice', 'تمرین کردن', 'PRAK-tis', '✍️'),
    Word('read', 'خواندن', 'REED', '📖'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('visit', 'دیدن/بازدید کردن', 'VIZ-it', '🏠'),
    Word('travel', 'سفر کردن', 'TRAV-ul', '✈️'),
    Word('cook', 'آشپزی کردن', 'KOOK', '🍳'),
    Word('clean', 'تمیز کردن', 'KLEEN', '🧹'),
    Word('walk', 'پیاده‌روی کردن', 'WAWK', '🚶'),
    Word('run', 'دویدن', 'RUN', '🏃'),
    Word('drink', 'نوشیدن', 'DRINK', '🥤'),
    Word('eat', 'خوردن', 'EET', '🍎'),
    Word('sleep', 'خوابیدن', 'SLEEP', '😴'),
    Word('week', 'هفته', 'WEEK', '🗓️'),
    Word('month', 'ماه', 'MUNTH', '📅'),
  ],
  examples: const [
    'How often do you study English? — چند وقت یک‌بار انگلیسی مطالعه می‌کنی؟',
    'I study English every day. — من هر روز انگلیسی مطالعه می‌کنم.',
    'How often do you exercise? — چند وقت یک‌بار ورزش می‌کنی؟',
    'I exercise three times a week. — من سه بار در هفته ورزش می‌کنم.',
    'How often does he play football? — او چند وقت یک‌بار فوتبال بازی می‌کند؟',
    'He plays football twice a week. — او دو بار در هفته فوتبال بازی می‌کند.',
    'How often does she read? — او چند وقت یک‌بار مطالعه می‌کند؟',
    'She reads every night. — او هر شب مطالعه می‌کند.',
    'I always drink water in the morning. — من همیشه صبح آب می‌نوشم.',
    'I usually study at night. — من معمولاً شب مطالعه می‌کنم.',
    'I often watch movies. — من اغلب فیلم تماشا می‌کنم.',
    'I sometimes play games. — من گاهی بازی می‌کنم.',
    'I rarely eat fast food. — من به‌ندرت فست‌فود می‌خورم.',
    'I never smoke. — من هرگز سیگار نمی‌کشم.',
    'She always helps her mother. — او همیشه به مادرش کمک می‌کند.',
    'He usually walks to school. — او معمولاً پیاده به مدرسه می‌رود.',
    'We often visit our grandparents. — ما اغلب به دیدن پدربزرگ و مادربزرگمان می‌رویم.',
    'They sometimes travel in summer. — آن‌ها گاهی در تابستان سفر می‌کنند.',
    'I clean my room once a week. — من هفته‌ای یک بار اتاقم را تمیز می‌کنم.',
    'We go shopping twice a month. — ما ماهی دو بار خرید می‌رویم.',
    'I practice English three times a week. — من سه بار در هفته انگلیسی تمرین می‌کنم.',
    'She cooks every day. — او هر روز آشپزی می‌کند.',
    'He runs every morning. — او هر صبح می‌دود.',
    'Do you often read books? — آیا اغلب کتاب می‌خوانی؟',
    'Yes, I do. — بله.',
    'No, I don’t. — نه.',
    'Does he usually exercise? — آیا او معمولاً ورزش می‌کند؟',
    'Yes, he does. — بله.',
    'No, he doesn’t. — نه.',
    'How often do they travel? — آن‌ها چند وقت یک‌بار سفر می‌کنند؟',
  ],
  questions: const [
    Question(
      'What does "often" mean?',
      ['همیشه', 'اغلب', 'هرگز', 'به‌ندرت'],
      'اغلب',
    ),
    Question(
      'How do you say "همیشه"?',
      ['Never', 'Always', 'Rarely', 'Sometimes'],
      'Always',
    ),
    Question(
      'What does "usually" mean?',
      ['معمولاً', 'هرگز', 'گاهی', 'یک بار'],
      'معمولاً',
    ),
    Question(
      'Complete: "I ___ study English every day."',
      ['always', 'never', 'once', 'twice'],
      'always',
    ),
    Question(
      'What does "sometimes" mean?',
      ['همیشه', 'گاهی اوقات', 'هرگز', 'اغلب'],
      'گاهی اوقات',
    ),
    Question(
      'How do you say "به‌ندرت"?',
      ['Often', 'Rarely', 'Always', 'Usually'],
      'Rarely',
    ),
    Question(
      'What does "never" mean?',
      ['هرگز', 'معمولاً', 'اغلب', 'یک بار'],
      'هرگز',
    ),
    Question(
      'Complete: "How ___ do you exercise?"',
      ['often', 'many', 'old', 'much'],
      'often',
    ),
    Question(
      'What does "once" mean?',
      ['یک بار', 'دو بار', 'سه بار', 'هر روز'],
      'یک بار',
    ),
    Question(
      'How do you say "دو بار"?',
      ['Once', 'Twice', 'Three times', 'Every'],
      'Twice',
    ),
    Question(
      'Complete: "I exercise ___ a week."',
      ['twice', 'always', 'never', 'usually'],
      'twice',
    ),
    Question(
      'What does "every" mean?',
      ['هر', 'یک بار', 'هرگز', 'گاهی'],
      'هر',
    ),
    Question(
      'Complete: "How often ___ you study?"',
      ['do', 'does', 'is', 'are'],
      'do',
    ),
    Question(
      'Complete: "How often ___ he exercise?"',
      ['do', 'does', 'is', 'are'],
      'does',
    ),
    Question(
      'What does "daily" mean?',
      ['هفتگی', 'روزانه', 'ماهانه', 'سالانه'],
      'روزانه',
    ),
    Question(
      'How do you say "هفتگی"?',
      ['Daily', 'Weekly', 'Monthly', 'Yearly'],
      'Weekly',
    ),
    Question(
      'What does "exercise" mean?',
      ['مطالعه کردن', 'ورزش کردن', 'خوابیدن', 'خواندن'],
      'ورزش کردن',
    ),
    Question(
      'Complete: "She ___ every night."',
      ['reads', 'read', 'reading', 'to read'],
      'reads',
    ),
    Question(
      'What does "practice" mean?',
      ['تمرین کردن', 'سفر کردن', 'خوردن', 'تمیز کردن'],
      'تمرین کردن',
    ),
    Question(
      'Complete: "I practice English three ___ a week."',
      ['times', 'time', 'often', 'every'],
      'times',
    ),
    Question(
      'What does "rarely" mean?',
      ['اغلب', 'به‌ندرت', 'همیشه', 'معمولاً'],
      'به‌ندرت',
    ),
    Question(
      'How do you say "هرگز"?',
      ['Never', 'Always', 'Often', 'Usually'],
      'Never',
    ),
    Question(
      'Complete: "I ___ eat fast food."',
      ['rarely', 'once', 'twice', 'every'],
      'rarely',
    ),
    Question(
      'What does "weekly" mean?',
      ['روزانه', 'هفتگی', 'ماهانه', 'سالانه'],
      'هفتگی',
    ),
    Question(
      'Complete: "We go shopping ___ a month."',
      ['twice', 'always', 'never', 'often'],
      'twice',
    ),
    Question(
      'What does "monthly" mean?',
      ['ماهانه', 'روزانه', 'هفتگی', 'هرگز'],
      'ماهانه',
    ),
    Question(
      'Complete: "How often ___ they travel?"',
      ['do', 'does', 'is', 'am'],
      'do',
    ),
    Question(
      'Complete: "How often ___ she reads?"',
      ['does', 'do', 'is', 'are'],
      'does',
    ),
    Question(
      'What does "three times" mean?',
      ['یک بار', 'دو بار', 'سه بار', 'هر روز'],
      'سه بار',
    ),
    Question(
      'Complete: "He ___ plays football twice a week."',
      ['usually', 'once', 'never', 'every'],
      'usually',
    ),
  ],
);
// ==========================================================
// LESSON 17: Simple Past - Regular Verbs
// ==========================================================
final lesson17 = Lesson(
  id: 17,
  title: 'Simple Past - Regular Verbs',
  subtitle: 'گذشته ساده — افعال باقاعده',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری درباره‌ی کارهایی که در گذشته انجام شده‌اند صحبت کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای صحبت درباره‌ی کاری که در گذشته تمام شده، از Simple Past استفاده می‌کنیم.\n'
      '۲. در افعال باقاعده معمولاً به آخر فعل ed اضافه می‌کنیم: play → played.\n'
      '۳. شکل گذشته برای همه‌ی فاعل‌ها یکسان است: I played, She played, They played.\n'
      '۴. برای منفی کردن از did not یا didn’t + شکل ساده فعل استفاده می‌کنیم: I didn’t play.\n'
      '۵. برای سؤال از Did + subject + base verb استفاده می‌کنیم: Did you play?\n'
      '۶. بعد از did و didn’t، فعل به شکل ساده برمی‌گردد؛ نمی‌گوییم didn’t played.\n'
      '۷. yesterday، last night، last week و ago از نشانه‌های رایج گذشته هستند.',
  formula:
      'Positive:\n'
      'Subject + past verb\n'
      'I played football.\n\n'
      'Negative:\n'
      'Subject + did not/didn’t + base verb\n'
      'I didn’t play football.\n\n'
      'Question:\n'
      'Did + subject + base verb?\n'
      'Did you play football?',
  words: const [
    Word('yesterday', 'دیروز', 'YES-ter-dey', '📅'),
    Word('ago', 'پیش', 'uh-GOH', '⏳'),
    Word('last', 'قبلی/گذشته', 'LAST', '⏮️'),
    Word('played', 'بازی کرد', 'PLEYD', '🎮'),
    Word('watched', 'تماشا کرد', 'WOTCHT', '📺'),
    Word('worked', 'کار کرد', 'WERKT', '💼'),
    Word('walked', 'راه رفت', 'WAWKT', '🚶'),
    Word('talked', 'صحبت کرد', 'TAWKT', '🗣️'),
    Word('called', 'تماس گرفت', 'KAWLD', '📞'),
    Word('helped', 'کمک کرد', 'HELPT', '🤝'),
    Word('cleaned', 'تمیز کرد', 'KLEEND', '🧹'),
    Word('opened', 'باز کرد', 'OH-pənd', '🚪'),
    Word('closed', 'بست', 'KLOHZD', '🚪'),
    Word('started', 'شروع کرد', 'STAR-tid', '▶️'),
    Word('finished', 'تمام کرد', 'FIN-isht', '🏁'),
    Word('visited', 'دیدن کرد', 'VIZ-it-id', '🏠'),
    Word('wanted', 'خواست', 'WON-tid', '⭐'),
    Word('needed', 'نیاز داشت', 'NEE-did', '📌'),
    Word('liked', 'دوست داشت', 'LAIKT', '❤️'),
    Word('loved', 'دوست داشت/عاشق بود', 'LUVD', '❤️'),
    Word('studied', 'مطالعه کرد', 'STUH-deed', '📚'),
    Word('practiced', 'تمرین کرد', 'PRAK-tist', '✍️'),
    Word('cooked', 'آشپزی کرد', 'KOOKT', '🍳'),
    Word('washed', 'شست', 'WOSHT', '🧼'),
    Word('waited', 'صبر کرد', 'WEY-tid', '⏳'),
    Word('answered', 'جواب داد', 'AN-serd', '💬'),
    Word('arrived', 'رسید', 'uh-RAIVD', '📍'),
    Word('stayed', 'ماند', 'STEYD', '🏠'),
    Word('danced', 'رقصید', 'DANST', '💃'),
    Word('visited', 'بازدید کرد', 'VIZ-it-id', '🧳'),
  ],
  examples: const [
    'I played football yesterday. — من دیروز فوتبال بازی کردم.',
    'She watched a movie last night. — او دیشب یک فیلم تماشا کرد.',
    'I worked yesterday. — من دیروز کار کردم.',
    'We walked to school. — ما به مدرسه پیاده رفتیم.',
    'They talked for an hour. — آن‌ها یک ساعت صحبت کردند.',
    'He called his friend. — او با دوستش تماس گرفت.',
    'I helped my mother. — من به مادرم کمک کردم.',
    'She cleaned her room. — او اتاقش را تمیز کرد.',
    'He opened the door. — او در را باز کرد.',
    'I closed the window. — من پنجره را بستم.',
    'The class started at eight. — کلاس ساعت هشت شروع شد.',
    'The lesson finished at ten. — درس ساعت ده تمام شد.',
    'We visited our grandparents. — ما به دیدن پدربزرگ و مادربزرگمان رفتیم.',
    'I wanted a new phone. — من یک گوشی جدید می‌خواستم.',
    'She needed some help. — او به کمی کمک نیاز داشت.',
    'I liked the movie. — من فیلم را دوست داشتم.',
    'They loved the food. — آن‌ها غذا را خیلی دوست داشتند.',
    'I studied English yesterday. — من دیروز انگلیسی مطالعه کردم.',
    'He practiced English for one hour. — او یک ساعت انگلیسی تمرین کرد.',
    'My father cooked dinner. — پدرم شام پخت.',
    'I washed my hands. — من دست‌هایم را شستم.',
    'We waited for the bus. — ما منتظر اتوبوس ماندیم.',
    'She answered the question. — او به سؤال جواب داد.',
    'They arrived late. — آن‌ها دیر رسیدند.',
    'I stayed at home. — من در خانه ماندم.',
    'We danced at the party. — ما در مهمانی رقصیدیم.',
    'Did you play football? — آیا فوتبال بازی کردی؟',
    'Yes, I did. — بله.',
    'No, I didn’t. — نه.',
    'I didn’t watch TV yesterday. — من دیروز تلویزیون تماشا نکردم.',
  ],
  questions: const [
    Question(
      'What does "yesterday" mean?',
      ['امروز', 'فردا', 'دیروز', 'هفته بعد'],
      'دیروز',
    ),
    Question(
      'What does "ago" mean?',
      ['بعد', 'پیش', 'امروز', 'همیشه'],
      'پیش',
    ),
    Question(
      'Complete: "I ___ football yesterday."',
      ['played', 'play', 'playing', 'plays'],
      'played',
    ),
    Question(
      'What is the past of "play"?',
      ['played', 'plays', 'playing', 'play'],
      'played',
    ),
    Question(
      'Complete: "She ___ a movie last night."',
      ['watched', 'watch', 'watches', 'watching'],
      'watched',
    ),
    Question(
      'What does "worked" mean?',
      ['کار کرد', 'بازی کرد', 'خوابید', 'دوید'],
      'کار کرد',
    ),
    Question(
      'How do you say "راه رفت" in English?',
      ['Walked', 'Played', 'Called', 'Helped'],
      'Walked',
    ),
    Question(
      'Complete: "They ___ yesterday."',
      ['talked', 'talk', 'talks', 'talking'],
      'talked',
    ),
    Question(
      'What does "called" mean?',
      ['تماس گرفت', 'کمک کرد', 'تمیز کرد', 'باز کرد'],
      'تماس گرفت',
    ),
    Question(
      'Complete: "I ___ my mother."',
      ['helped', 'help', 'helps', 'helping'],
      'helped',
    ),
    Question(
      'What does "cleaned" mean?',
      ['تمیز کرد', 'بست', 'باز کرد', 'صبر کرد'],
      'تمیز کرد',
    ),
    Question(
      'Complete: "He ___ the door."',
      ['opened', 'open', 'opens', 'opening'],
      'opened',
    ),
    Question(
      'What does "closed" mean?',
      ['باز کرد', 'بست', 'شروع کرد', 'تمام کرد'],
      'بست',
    ),
    Question(
      'Complete: "The class ___ at eight."',
      ['started', 'start', 'starts', 'starting'],
      'started',
    ),
    Question(
      'What does "finished" mean?',
      ['شروع کرد', 'تمام کرد', 'رسید', 'ماند'],
      'تمام کرد',
    ),
    Question(
      'Complete: "We ___ our grandparents."',
      ['visited', 'visit', 'visits', 'visiting'],
      'visited',
    ),
    Question(
      'What does "wanted" mean?',
      ['خواست', 'نیاز داشت', 'دوست داشت', 'کمک کرد'],
      'خواست',
    ),
    Question(
      'Complete: "She ___ some help."',
      ['needed', 'need', 'needs', 'needing'],
      'needed',
    ),
    Question(
      'What is the past of "like"?',
      ['liked', 'likes', 'liking', 'like'],
      'liked',
    ),
    Question(
      'Complete: "I ___ English yesterday."',
      ['studied', 'study', 'studies', 'studying'],
      'studied',
    ),
    Question(
      'What does "practiced" mean?',
      ['تمرین کرد', 'آشپزی کرد', 'شست', 'تماشا کرد'],
      'تمرین کرد',
    ),
    Question(
      'Complete: "My father ___ dinner."',
      ['cooked', 'cook', 'cooks', 'cooking'],
      'cooked',
    ),
    Question(
      'What does "washed" mean?',
      ['شست', 'صبر کرد', 'جواب داد', 'رسید'],
      'شست',
    ),
    Question(
      'Complete: "We ___ for the bus."',
      ['waited', 'wait', 'waits', 'waiting'],
      'waited',
    ),
    Question(
      'What does "arrived" mean?',
      ['رسید', 'ماند', 'رقصید', 'باز کرد'],
      'رسید',
    ),
    Question(
      'Complete: "I ___ at home."',
      ['stayed', 'stay', 'stays', 'staying'],
      'stayed',
    ),
    Question(
      'Which sentence is correct?',
      [
        'I played football yesterday.',
        'I play football yesterday.',
        'I plays football yesterday.',
        'I playing football yesterday.'
      ],
      'I played football yesterday.',
    ),
    Question(
      'Choose the correct negative sentence:',
      [
        'I didn’t play.',
        'I didn’t played.',
        'I don’t played.',
        'I not played.'
      ],
      'I didn’t play.',
    ),
    Question(
      'Choose the correct question:',
      [
        'Did you play?',
        'Did you played?',
        'Do you played?',
        'You did play?'
      ],
      'Did you play?',
    ),
    Question(
      'Complete: "She didn’t ___ TV."',
      ['watch', 'watched', 'watches', 'watching'],
      'watch',
    ),
  ],
);
// ==========================================================
// LESSON 18: Simple Past - Negative & Questions
// ==========================================================
final lesson18 = Lesson(
  id: 18,
  title: 'Simple Past - Negative & Questions',
  subtitle: 'گذشته ساده — منفی و سوالی',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری جمله‌های گذشته ساده را منفی و سوالی کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای منفی کردن گذشته ساده از did not یا شکل کوتاه didn’t استفاده می‌کنیم.\n'
      '۲. بعد از didn’t همیشه فعل به شکل ساده می‌آید: I didn’t play.\n'
      '۳. برای سوالی کردن از Did در ابتدای جمله استفاده می‌کنیم.\n'
      '۴. بعد از Did هم فعل به شکل ساده می‌آید: Did you watch?\n'
      '۵. جواب کوتاه مثبت: Yes, I did.\n'
      '۶. جواب کوتاه منفی: No, I didn’t.\n'
      '۷. برای همه فاعل‌ها در گذشته ساده از did استفاده می‌کنیم.',
  formula:
      'Positive:\n'
      'I played football.\n\n'
      'Negative:\n'
      'I did not play football.\n'
      'I didn’t play football.\n\n'
      'Question:\n'
      'Did you play football?\n\n'
      'Short answers:\n'
      'Yes, I did.\n'
      'No, I didn’t.',
  words: const [
    Word('did', 'انجام داد/فعل کمکی گذشته', 'DID', '🔧'),
    Word('didn’t', 'نکرد/انجام نداد', 'DID-unt', '❌'),
    Word('yesterday', 'دیروز', 'YES-ter-dey', '📅'),
    Word('last', 'گذشته/قبلی', 'LAST', '⏮️'),
    Word('ago', 'پیش', 'uh-GOH', '⏳'),
    Word('ask', 'پرسیدن', 'ASK', '❓'),
    Word('answer', 'جواب دادن', 'AN-ser', '💬'),
    Word('visit', 'دیدن/بازدید کردن', 'VIZ-it', '🏠'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('study', 'مطالعه کردن', 'STUH-dee', '📚'),
    Word('work', 'کار کردن', 'WERK', '💼'),
    Word('walk', 'راه رفتن', 'WAWK', '🚶'),
    Word('call', 'تماس گرفتن', 'KAWL', '📞'),
    Word('help', 'کمک کردن', 'HELP', '🤝'),
    Word('clean', 'تمیز کردن', 'KLEEN', '🧹'),
    Word('open', 'باز کردن', 'OH-pun', '🚪'),
    Word('close', 'بستن', 'KLOHZ', '🚪'),
    Word('start', 'شروع کردن', 'START', '▶️'),
    Word('finish', 'تمام کردن', 'FIN-ish', '🏁'),
    Word('remember', 'به یاد آوردن', 'ree-MEM-ber', '🧠'),
    Word('forget', 'فراموش کردن', 'fer-GET', '🤔'),
    Word('understand', 'متوجه شدن', 'un-der-STAND', '💡'),
    Word('need', 'نیاز داشتن', 'NEED', '📌'),
    Word('want', 'خواستن', 'WONT', '⭐'),
    Word('like', 'دوست داشتن', 'LAIK', '❤️'),
    Word('love', 'دوست داشتن', 'LUV', '❤️'),
    Word('stay', 'ماندن', 'STEY', '🏠'),
    Word('arrive', 'رسیدن', 'uh-RAIV', '📍'),
    Word('travel', 'سفر کردن', 'TRAV-ul', '✈️'),
  ],
  examples: const [
    'I didn’t play football yesterday. — من دیروز فوتبال بازی نکردم.',
    'She didn’t watch TV last night. — او دیشب تلویزیون تماشا نکرد.',
    'We didn’t study yesterday. — ما دیروز درس نخواندیم.',
    'He didn’t work on Friday. — او جمعه کار نکرد.',
    'They didn’t walk to school. — آن‌ها پیاده به مدرسه نرفتند.',
    'I didn’t call my friend. — من به دوستم زنگ نزدم.',
    'She didn’t help me. — او به من کمک نکرد.',
    'He didn’t clean his room. — او اتاقش را تمیز نکرد.',
    'We didn’t open the door. — ما در را باز نکردیم.',
    'They didn’t close the window. — آن‌ها پنجره را نبستند.',
    'I didn’t start the lesson. — من درس را شروع نکردم.',
    'She didn’t finish her homework. — او تکالیفش را تمام نکرد.',
    'I didn’t remember his name. — من اسم او را به یاد نیاوردم.',
    'He didn’t forget the answer. — او جواب را فراموش نکرد.',
    'I didn’t understand the question. — من سؤال را متوجه نشدم.',
    'Did you play football? — آیا فوتبال بازی کردی؟',
    'Did she watch the movie? — آیا او فیلم را تماشا کرد؟',
    'Did they study English? — آیا آن‌ها انگلیسی مطالعه کردند؟',
    'Did he work yesterday? — آیا او دیروز کار کرد؟',
    'Did you call your friend? — آیا به دوستت زنگ زدی؟',
    'Did she help her mother? — آیا او به مادرش کمک کرد؟',
    'Did he clean his room? — آیا او اتاقش را تمیز کرد؟',
    'Did you open the door? — آیا در را باز کردی؟',
    'Did they arrive on time? — آیا آن‌ها به‌موقع رسیدند؟',
    'Did you travel last summer? — آیا تابستان گذشته سفر کردی؟',
    'Yes, I did. — بله.',
    'No, I didn’t. — نه.',
    'Yes, she did. — بله، او انجام داد.',
    'No, she didn’t. — نه، او انجام نداد.',
    'Did you understand? — متوجه شدی؟',
  ],
  questions: const [
    Question(
      'Which word makes a past sentence negative?',
      ['do', 'didn’t', 'does', 'will'],
      'didn’t',
    ),
    Question(
      'Complete: "I ___ play yesterday."',
      ['didn’t', 'don’t', 'doesn’t', 'am not'],
      'didn’t',
    ),
    Question(
      'Complete: "She didn’t ___ TV."',
      ['watch', 'watched', 'watches', 'watching'],
      'watch',
    ),
    Question(
      'Which sentence is correct?',
      [
        'I didn’t play.',
        'I didn’t played.',
        'I don’t played.',
        'I not played.'
      ],
      'I didn’t play.',
    ),
    Question(
      'How do you make a past question?',
      ['Did + subject + verb', 'Do + subject + verb', 'Does + subject + verb', 'Will + subject + verb'],
      'Did + subject + verb',
    ),
    Question(
      'Complete: "___ you watch the movie?"',
      ['Did', 'Do', 'Does', 'Are'],
      'Did',
    ),
    Question(
      'Complete: "Did you ___ English?"',
      ['study', 'studied', 'studies', 'studying'],
      'study',
    ),
    Question(
      'What is the short form of "did not"?',
      ['doesn’t', 'don’t', 'didn’t', 'isn’t'],
      'didn’t',
    ),
    Question(
      'What does "remember" mean?',
      ['فراموش کردن', 'به یاد آوردن', 'پرسیدن', 'جواب دادن'],
      'به یاد آوردن',
    ),
    Question(
      'How do you say "فراموش کردن"?',
      ['Remember', 'Forget', 'Understand', 'Answer'],
      'Forget',
    ),
    Question(
      'Complete: "I didn’t ___ the question."',
      ['understand', 'understood', 'understands', 'understanding'],
      'understand',
    ),
    Question(
      'What does "need" mean?',
      ['خواستن', 'نیاز داشتن', 'دوست داشتن', 'ماندن'],
      'نیاز داشتن',
    ),
    Question(
      'Complete: "Did she ___ her mother?"',
      ['help', 'helped', 'helps', 'helping'],
      'help',
    ),
    Question(
      'Choose the correct answer: "Did you play?"',
      ['Yes, I did.', 'Yes, I played.', 'Yes, I do.', 'Yes, I am.'],
      'Yes, I did.',
    ),
    Question(
      'Choose the correct negative answer:',
      ['No, I didn’t.', 'No, I don’t.', 'No, I wasn’t.', 'No, I not.'],
      'No, I didn’t.',
    ),
    Question(
      'Complete: "They ___ arrive yesterday."',
      ['didn’t', 'don’t', 'doesn’t', 'aren’t'],
      'didn’t',
    ),
    Question(
      'What does "arrive" mean?',
      ['رسیدن', 'ماندن', 'سفر کردن', 'کار کردن'],
      'رسیدن',
    ),
    Question(
      'Complete: "Did he ___ yesterday?"',
      ['work', 'worked', 'works', 'working'],
      'work',
    ),
    Question(
      'Which sentence is correct?',
      [
        'Did she watch TV?',
        'Did she watched TV?',
        'Does she watched TV?',
        'She did watched TV?'
      ],
      'Did she watch TV?',
    ),
    Question(
      'Complete: "We didn’t ___ last summer."',
      ['travel', 'traveled', 'travels', 'traveling'],
      'travel',
    ),
    Question(
      'What does "stay" mean?',
      ['ماندن', 'رسیدن', 'باز کردن', 'بستن'],
      'ماندن',
    ),
    Question(
      'Complete: "I didn’t ___ his name."',
      ['remember', 'remembered', 'remembers', 'remembering'],
      'remember',
    ),
    Question(
      'What does "answer" mean?',
      ['سؤال پرسیدن', 'جواب دادن', 'فراموش کردن', 'سفر کردن'],
      'جواب دادن',
    ),
    Question(
      'Complete: "Did you ___ the question?"',
      ['answer', 'answered', 'answers', 'answering'],
      'answer',
    ),
    Question(
      'Which is the correct negative sentence?',
      [
        'She didn’t study.',
        'She didn’t studied.',
        'She doesn’t studied.',
        'She not studied.'
      ],
      'She didn’t study.',
    ),
    Question(
      'Which is the correct question?',
      [
        'Did they arrive?',
        'Did they arrived?',
        'Do they arrived?',
        'They did arrive?'
      ],
      'Did they arrive?',
    ),
    Question(
      'What does "last" mean in "last week"?',
      ['آینده', 'گذشته/قبلی', 'امروز', 'هر روز'],
      'گذشته/قبلی',
    ),
    Question(
      'Complete: "I didn’t ___ the movie."',
      ['like', 'liked', 'likes', 'liking'],
      'like',
    ),
    Question(
      'Complete: "Did she ___ the lesson?"',
      ['finish', 'finished', 'finishes', 'finishing'],
      'finish',
    ),
    Question(
      'After "didn’t", which form of the verb do we use?',
      ['Base form', 'Past form', 'Past participle', '- ing form'],
      'Base form',
    ),
  ],
);
// ==========================================================
// LESSON 19: Be Going To - Future Plans
// ==========================================================
final lesson19 = Lesson(
  id: 19,
  title: 'Be Going To - Future Plans',
  subtitle: 'آینده و برنامه‌ها با Going to',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری درباره‌ی برنامه‌ها و کارهایی که قصد داری در آینده انجام بدهی صحبت کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای برنامه یا قصد آینده از be going to استفاده می‌کنیم.\n'
      '۲. بعد از going to همیشه شکل ساده فعل می‌آید: I am going to study.\n'
      '۳. فعل be با فاعل تغییر می‌کند: I am، You/We/They are، He/She/It is.\n'
      '۴. برای منفی کردن، not را بعد از am/is/are می‌آوریم: I am not going to go.\n'
      '۵. برای سوالی کردن، am/is/are را به ابتدای جمله می‌بریم: Are you going to study?\n'
      '۶. going to برای برنامه‌ها و تصمیم‌هایی که از قبل قصد انجامشان را داریم بسیار رایج است.',
  formula:
      'Positive:\n'
      'Subject + am/is/are + going to + verb\n'
      'I am going to study.\n\n'
      'Negative:\n'
      'Subject + am/is/are + not + going to + verb\n'
      'I am not going to study.\n\n'
      'Question:\n'
      'Am/Is/Are + subject + going to + verb?\n'
      'Are you going to study?',
  words: const [
    Word('future', 'آینده', 'FYOO-cher', '🔮'),
    Word('plan', 'برنامه', 'PLAN', '📝'),
    Word('tonight', 'امشب', 'tuh-NAIT', '🌙'),
    Word('tomorrow', 'فردا', 'tuh-MOR-oh', '📅'),
    Word('next', 'بعدی/آینده', 'NEKST', '➡️'),
    Word('week', 'هفته', 'WEEK', '🗓️'),
    Word('weekend', 'آخر هفته', 'WEEK-end', '🎉'),
    Word('holiday', 'تعطیلات', 'HOL-uh-dey', '🏖️'),
    Word('decide', 'تصمیم گرفتن', 'di-SAID', '🤔'),
    Word('hope', 'امیدوار بودن', 'HOHP', '🌟'),
    Word('learn', 'یاد گرفتن', 'LURN', '📚'),
    Word('study', 'مطالعه کردن', 'STUH-dee', '📖'),
    Word('work', 'کار کردن', 'WERK', '💼'),
    Word('travel', 'سفر کردن', 'TRAV-ul', '✈️'),
    Word('visit', 'دیدن/بازدید کردن', 'VIZ-it', '🏠'),
    Word('meet', 'ملاقات کردن', 'MEET', '🤝'),
    Word('buy', 'خریدن', 'BAI', '🛒'),
    Word('make', 'ساختن/درست کردن', 'MEYK', '🛠️'),
    Word('build', 'ساختن', 'BILD', '🏗️'),
    Word('start', 'شروع کردن', 'START', '▶️'),
    Word('finish', 'تمام کردن', 'FIN-ish', '🏁'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('cook', 'آشپزی کردن', 'KOOK', '🍳'),
    Word('clean', 'تمیز کردن', 'KLEEN', '🧹'),
    Word('call', 'تماس گرفتن', 'KAWL', '📞'),
    Word('help', 'کمک کردن', 'HELP', '🤝'),
    Word('read', 'خواندن', 'REED', '📚'),
    Word('practice', 'تمرین کردن', 'PRAK-tis', '✍️'),
    Word('tomorrowPlan', 'فردا', 'tuh-MOR-oh', '🔜'),
  ],
  examples: const [
    'I am going to study tonight. — من قصد دارم امشب مطالعه کنم.',
    'I am going to learn English. — من قصد دارم انگلیسی یاد بگیرم.',
    'She is going to visit her grandmother. — او قصد دارد مادربزرگش را ببیند.',
    'He is going to play football tomorrow. — او قصد دارد فردا فوتبال بازی کند.',
    'We are going to travel next week. — ما قصد داریم هفته آینده سفر کنیم.',
    'They are going to watch a movie. — آن‌ها قصد دارند یک فیلم تماشا کنند.',
    'I am going to buy a new book. — من قصد دارم یک کتاب جدید بخرم.',
    'She is going to cook dinner. — او قصد دارد شام درست کند.',
    'He is going to clean his room. — او قصد دارد اتاقش را تمیز کند.',
    'We are going to meet our friends. — ما قصد داریم دوستانمان را ملاقات کنیم.',
    'I am going to practice English. — من قصد دارم انگلیسی تمرین کنم.',
    'They are going to start a new project. — آن‌ها قصد دارند یک پروژه جدید شروع کنند.',
    'I am not going to work tomorrow. — من قصد ندارم فردا کار کنم.',
    'She is not going to travel this weekend. — او قصد ندارد این آخر هفته سفر کند.',
    'They are not going to play today. — آن‌ها قصد ندارند امروز بازی کنند.',
    'Are you going to study tonight? — آیا قصد داری امشب مطالعه کنی؟',
    'Is he going to work tomorrow? — آیا او قصد دارد فردا کار کند؟',
    'Is she going to visit her aunt? — آیا او قصد دارد عمه‌اش را ببیند؟',
    'Are they going to travel next month? — آیا آن‌ها قصد دارند ماه آینده سفر کنند؟',
    'Are you going to learn English? — آیا قصد داری انگلیسی یاد بگیری؟',
    'Yes, I am. — بله.',
    'No, I am not. — نه.',
    'Yes, she is. — بله.',
    'No, she isn’t. — نه.',
    'Yes, they are. — بله.',
    'No, they aren’t. — نه.',
    'What are you going to do tomorrow? — فردا قصد داری چه کار کنی؟',
    'I am going to study English. — من قصد دارم انگلیسی مطالعه کنم.',
    'Where are you going to go? — قصد داری کجا بروی؟',
    'I am going to visit my friend. — قصد دارم دوستم را ببینم.',
  ],
  questions: const [
    Question(
      'What does "future" mean?',
      ['گذشته', 'آینده', 'امروز', 'دیروز'],
      'آینده',
    ),
    Question(
      'What does "plan" mean?',
      ['برنامه', 'تعطیلات', 'تصمیم', 'سفر'],
      'برنامه',
    ),
    Question(
      'Complete: "I ___ going to study."',
      ['am', 'is', 'are', 'be'],
      'am',
    ),
    Question(
      'Complete: "She ___ going to travel."',
      ['am', 'is', 'are', 'be'],
      'is',
    ),
    Question(
      'Complete: "They ___ going to play."',
      ['am', 'is', 'are', 'be'],
      'are',
    ),
    Question(
      'What comes after "going to"?',
      ['Base verb', 'Past verb', 'Noun only', 'Adjective'],
      'Base verb',
    ),
    Question(
      'Complete: "I am going to ___ English."',
      ['learn', 'learned', 'learning', 'learns'],
      'learn',
    ),
    Question(
      'What does "tomorrow" mean?',
      ['دیروز', 'امروز', 'فردا', 'هفته گذشته'],
      'فردا',
    ),
    Question(
      'Complete: "We are going to ___ next week."',
      ['travel', 'traveled', 'travels', 'traveling'],
      'travel',
    ),
    Question(
      'What does "visit" mean?',
      ['ساختن', 'دیدن/بازدید کردن', 'خریدن', 'شروع کردن'],
      'دیدن/بازدید کردن',
    ),
    Question(
      'Complete: "She is going to ___ her grandmother."',
      ['visit', 'visited', 'visits', 'visiting'],
      'visit',
    ),
    Question(
      'What does "buy" mean?',
      ['فروختن', 'خریدن', 'ساختن', 'کمک کردن'],
      'خریدن',
    ),
    Question(
      'Complete: "I am going to ___ a book."',
      ['buy', 'bought', 'buys', 'buying'],
      'buy',
    ),
    Question(
      'What does "make" mean?',
      ['ساختن/درست کردن', 'دیدن', 'خواندن', 'سفر کردن'],
      'ساختن/درست کردن',
    ),
    Question(
      'What does "build" mean?',
      ['ساختن', 'خریدن', 'خواندن', 'تماشا کردن'],
      'ساختن',
    ),
    Question(
      'Complete: "They are going to ___ a house."',
      ['build', 'built', 'building', 'builds'],
      'build',
    ),
    Question(
      'Which sentence is negative?',
      [
        'I am going to study.',
        'I am not going to study.',
        'Am I going to study?',
        'I study every day.'
      ],
      'I am not going to study.',
    ),
    Question(
      'Complete: "She ___ not going to work."',
      ['is', 'am', 'are', 'be'],
      'is',
    ),
    Question(
      'Choose the correct question:',
      [
        'Are you going to study?',
        'Do you going to study?',
        'Are you go to study?',
        'You are going to study?'
      ],
      'Are you going to study?',
    ),
    Question(
      'Complete: "___ they going to travel?"',
      ['Are', 'Is', 'Am', 'Do'],
      'Are',
    ),
    Question(
      'Complete: "___ he going to play?"',
      ['Is', 'Are', 'Am', 'Does'],
      'Is',
    ),
    Question(
      'What does "tonight" mean?',
      ['امشب', 'فردا', 'دیشب', 'صبح'],
      'امشب',
    ),
    Question(
      'Complete: "I am going to study ___."',
      ['tonight', 'yesterday', 'last week', 'ago'],
      'tonight',
    ),
    Question(
      'What does "next week" mean?',
      ['هفته گذشته', 'این هفته', 'هفته آینده', 'هر هفته'],
      'هفته آینده',
    ),
    Question(
      'Complete: "We are going to meet our friends ___."',
      ['tomorrow', 'yesterday', 'last year', 'ago'],
      'tomorrow',
    ),
    Question(
      'What does "decide" mean?',
      ['تصمیم گرفتن', 'امیدوار بودن', 'یاد گرفتن', 'تماشا کردن'],
      'تصمیم گرفتن',
    ),
    Question(
      'Complete: "I am going to ___ English."',
      ['practice', 'practiced', 'practices', 'practicing'],
      'practice',
    ),
    Question(
      'Choose the correct answer: "Are you going to study?"',
      ['Yes, I am.', 'Yes, I do.', 'Yes, I did.', 'Yes, I study.'],
      'Yes, I am.',
    ),
    Question(
      'Choose the correct negative answer:',
      ['No, I am not.', 'No, I don’t.', 'No, I didn’t.', 'No, I not.'],
      'No, I am not.',
    ),
    Question(
      'Complete: "What ___ you going to do?"',
      ['are', 'is', 'am', 'do'],
      'are',
    ),
  ],
);
// ==========================================================
// LESSON 20: Be Going To — Questions & Negatives
// ==========================================================
final lesson20 = Lesson(
  id: 20,
  title: 'Be Going To — Questions & Negatives',
  subtitle: 'آینده با going to — منفی و سوالی',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور با be going to درباره برنامه‌ها و تصمیم‌های آینده صحبت کنی، جمله‌ها را منفی کنی و سوال بسازی.\n\n'
      '📌 نکات مهم\n'
      '۱. ساختار مثبت: Subject + am/is/are + going to + verb.\n'
      '۲. ساختار منفی: Subject + am/is/are + not + going to + verb.\n'
      '۳. برای سوال بله/خیر، am/is/are را به ابتدای جمله می‌بریم.\n'
      '۴. برای I از am، برای He/She/It از is و برای You/We/They از are استفاده می‌کنیم.\n'
      '۵. بعد از going to همیشه شکل ساده فعل می‌آید: going to study، going to play، going to work.\n'
      '۶. برای برنامه‌های آینده از going to زیاد استفاده می‌کنیم: I am going to study tonight.\n\n'
      '❌ منفی:\n'
      'I am not going to study.\n'
      'He is not going to come.\n'
      'They are not going to play.\n\n'
      '❓ سوالی:\n'
      'Are you going to study?\n'
      'Is she going to come?\n'
      'Are they going to travel?',
  formula:
      'Positive:\n'
      'Subject + am/is/are + going to + verb\n\n'
      'Negative:\n'
      'Subject + am/is/are + not + going to + verb\n\n'
      'Question:\n'
      'Am/Is/Are + subject + going to + verb?\n\n'
      'Short answers:\n'
      'Yes, I am. / No, I am not.\n'
      'Yes, he is. / No, he isn’t.\n'
      'Yes, they are. / No, they aren’t.',
  words: const [
    Word('plan', 'برنامه', 'PLAN', '📋'),
    Word('future', 'آینده', 'FYOO-cher', '🔮'),
    Word('tonight', 'امشب', 'tuh-NAIT', '🌙'),
    Word('tomorrow', 'فردا', 'tuh-MOR-oh', '📅'),
    Word('next', 'بعدی/آینده', 'NEKST', '➡️'),
    Word('week', 'هفته', 'WEEK', '🗓️'),
    Word('travel', 'سفر کردن', 'TRAV-ul', '✈️'),
    Word('visit', 'دیدن/بازدید کردن', 'VIZ-it', '🏠'),
    Word('study', 'درس خواندن', 'STUD-ee', '📚'),
    Word('work', 'کار کردن', 'WERK', '💼'),
    Word('play', 'بازی کردن', 'PLEY', '🎮'),
    Word('watch', 'تماشا کردن', 'WOTCH', '📺'),
    Word('buy', 'خریدن', 'BAI', '🛒'),
    Word('make', 'ساختن/درست کردن', 'MEYK', '🔨'),
    Word('cook', 'آشپزی کردن', 'KOOK', '🍳'),
    Word('clean', 'تمیز کردن', 'KLEEN', '🧹'),
    Word('meet', 'ملاقات کردن', 'MEET', '🤝'),
    Word('come', 'آمدن', 'KUM', '🚶'),
    Word('leave', 'ترک کردن/رفتن', 'LEEV', '🚪'),
    Word('stay', 'ماندن', 'STEY', '🏠'),
    Word('start', 'شروع کردن', 'START', '▶️'),
    Word('finish', 'تمام کردن', 'FIN-ish', '🏁'),
    Word('learn', 'یاد گرفتن', 'LERN', '🧠'),
    Word('practice', 'تمرین کردن', 'PRAK-tis', '✍️'),
    Word('prepare', 'آماده کردن', 'pri-PAIR', '🎒'),
    Word('decide', 'تصمیم گرفتن', 'di-SAID', '🤔'),
    Word('ready', 'آماده', 'RED-ee', '✅'),
    Word('busy', 'مشغول', 'BIZ-ee', '⏳'),
    Word('free', 'آزاد', 'FREE', '🕊️'),
  ],
  examples: const [
    'I am going to study tonight. — من امشب قرار است درس بخوانم.',
    'I am not going to study tonight. — من امشب قرار نیست درس بخوانم.',
    'She is going to visit her grandmother. — او قرار است مادربزرگش را ببیند.',
    'She is not going to visit her grandmother. — او قرار نیست مادربزرگش را ببیند.',
    'Are you going to study tomorrow? — آیا فردا قرار است درس بخوانی؟',
    'Yes, I am. — بله.',
    'No, I am not. — نه.',
    'Is he going to work tomorrow? — آیا او فردا قرار است کار کند؟',
    'Yes, he is. — بله.',
    'No, he is not. — نه.',
    'Are they going to travel next week? — آیا آن‌ها هفته آینده قرار است سفر کنند؟',
    'They are not going to travel next week. — آن‌ها هفته آینده قرار نیست سفر کنند.',
    'We are going to watch a movie tonight. — ما امشب قرار است یک فیلم تماشا کنیم.',
    'We are not going to watch a movie tonight. — ما امشب قرار نیست فیلم تماشا کنیم.',
    'Is she going to cook dinner? — آیا او قرار است شام بپزد؟',
    'She is going to cook dinner. — او قرار است شام بپزد.',
    'He is not going to play football. — او قرار نیست فوتبال بازی کند.',
    'Are you going to buy a new phone? — آیا قرار است یک گوشی جدید بخری؟',
    'I am going to learn English. — من قرار است انگلیسی یاد بگیرم.',
    'I am not going to leave early. — من قرار نیست زود بروم.',
    'Are we going to meet tomorrow? — آیا قرار است فردا همدیگر را ببینیم؟',
    'We are going to meet tomorrow. — ما قرار است فردا همدیگر را ببینیم.',
    'They are going to start a new project. — آن‌ها قرار است یک پروژه جدید شروع کنند.',
    'They are not going to start today. — آن‌ها قرار نیست امروز شروع کنند.',
    'Is he going to clean his room? — آیا او قرار است اتاقش را تمیز کند؟',
    'He is going to clean his room. — او قرار است اتاقش را تمیز کند.',
    'I am going to practice English. — من قرار است انگلیسی تمرین کنم.',
    'She is going to prepare for the exam. — او قرار است برای امتحان آماده شود.',
    'Are you going to come with us? — آیا قرار است با ما بیایی؟',
    'No, I am not going to come. — نه، قرار نیست بیایم.',
  ],
  questions: const [
    Question(
      'What does "plan" mean?',
      ['برنامه', 'آینده', 'سفر', 'تمرین'],
      'برنامه',
    ),
    Question(
      'Complete: "I ___ going to study."',
      ['am', 'is', 'are', 'be'],
      'am',
    ),
    Question(
      'Complete: "She ___ going to travel."',
      ['am', 'is', 'are', 'be'],
      'is',
    ),
    Question(
      'Complete: "They ___ going to play."',
      ['am', 'is', 'are', 'be'],
      'are',
    ),
    Question(
      'How do you make this negative: "I am going to study."?',
      [
        'I am not going to study.',
        'I not am going to study.',
        'I am going not to study.',
        'I do not going to study.'
      ],
      'I am not going to study.',
    ),
    Question(
      'Choose the correct question.',
      [
        'Are you going to study?',
        'You are going to study?',
        'Do you are going to study?',
        'Are going you to study?'
      ],
      'Are you going to study?',
    ),
    Question(
      'What does "future" mean?',
      ['گذشته', 'آینده', 'امروز', 'شب'],
      'آینده',
    ),
    Question(
      'What does "tonight" mean?',
      ['امشب', 'فردا', 'دیروز', 'صبح'],
      'امشب',
    ),
    Question(
      'Complete: "He is ___ going to come."',
      ['not', 'no', 'doesn’t', 'isn’t'],
      'not',
    ),
    Question(
      'What does "travel" mean?',
      ['کار کردن', 'سفر کردن', 'خریدن', 'ماندن'],
      'سفر کردن',
    ),
    Question(
      'Complete: "Are you going to ___ English?"',
      ['learn', 'learns', 'learning', 'learned'],
      'learn',
    ),
    Question(
      'What does "visit" mean?',
      ['دیدن/بازدید کردن', 'ساختن', 'تمیز کردن', 'شروع کردن'],
      'دیدن/بازدید کردن',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'She is going to cook.',
        'She are going to cook.',
        'She am going to cook.',
        'She going to cook.'
      ],
      'She is going to cook.',
    ),
    Question(
      'What does "buy" mean?',
      ['خریدن', 'فروختن', 'ساختن', 'پختن'],
      'خریدن',
    ),
    Question(
      'Complete: "We are not going to ___."',
      ['leave', 'leaves', 'leaving', 'left'],
      'leave',
    ),
    Question(
      'What does "ready" mean?',
      ['مشغول', 'آماده', 'آزاد', 'خسته'],
      'آماده',
    ),
    Question(
      'Choose the correct short answer: "Are they going to travel?"',
      ['Yes, they are.', 'Yes, they is.', 'Yes, they am.', 'Yes, they be.'],
      'Yes, they are.',
    ),
    Question(
      'Choose the correct negative answer: "Is he going to come?"',
      ['No, he isn’t.', 'No, he aren’t.', 'No, he don’t.', 'No, he not.'],
      'No, he isn’t.',
    ),
    Question(
      'What does "practice" mean?',
      ['تمرین کردن', 'تصمیم گرفتن', 'ماندن', 'رفتن'],
      'تمرین کردن',
    ),
    Question(
      'Complete: "I am going to ___ English."',
      ['practice', 'practices', 'practicing', 'practiced'],
      'practice',
    ),
    Question(
      'What does "next week" mean?',
      ['هفته گذشته', 'هفته بعد', 'امروز', 'ماه بعد'],
      'هفته بعد',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'They are not going to play.',
        'They is not going to play.',
        'They not are going to play.',
        'They do not going to play.'
      ],
      'They are not going to play.',
    ),
    Question(
      'Complete: "___ she going to cook?"',
      ['Is', 'Are', 'Am', 'Do'],
      'Is',
    ),
    Question(
      'What does "clean" mean?',
      ['تمیز کردن', 'پختن', 'خریدن', 'ملاقات کردن'],
      'تمیز کردن',
    ),
    Question(
      'Complete: "We ___ going to watch a movie."',
      ['are', 'is', 'am', 'be'],
      'are',
    ),
    Question(
      'What does "decide" mean?',
      ['تصمیم گرفتن', 'شروع کردن', 'تمام کردن', 'یاد گرفتن'],
      'تصمیم گرفتن',
    ),
    Question(
      'Choose the correct question.',
      [
        'Is he going to work?',
        'Does he going to work?',
        'Is going he to work?',
        'He is going to work?'
      ],
      'Is he going to work?',
    ),
    Question(
      'What does "busy" mean?',
      ['مشغول', 'آماده', 'آزاد', 'تنبل'],
      'مشغول',
    ),
    Question(
      'Complete: "I am not going to ___ early."',
      ['leave', 'leaves', 'leaving', 'left'],
      'leave',
    ),
    Question(
      'What is the correct structure?',
      [
        'am/is/are + going to + verb',
        'do + going to + verb',
        'am/is/are + going + verb-ing',
        'have + going to + verb'
      ],
      'am/is/are + going to + verb',
    ),
  ],
);
// ==========================================================
// LESSON 21: Will — Future Decisions & Predictions
// ==========================================================
final lesson21 = Lesson(
  id: 21,
  title: 'Will — Future',
  subtitle: 'آینده با Will',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور با will درباره آینده صحبت کنی؛ مخصوصاً برای تصمیم‌هایی که همان لحظه می‌گیری، قول دادن و پیش‌بینی کردن.\n\n'
      '📌 نکات مهم\n'
      '۱. بعد از will همیشه شکل ساده فعل می‌آید: will go, will study, will help.\n'
      '۲. will برای همه فاعل‌ها یکسان است: I will, he will, they will.\n'
      '۳. شکل کوتاه will معمولاً به صورت \'ll می‌آید: I\'ll, you\'ll, he\'ll, they\'ll.\n'
      '۴. منفی will می‌شود will not یا شکل کوتاه won\'t.\n'
      '۵. برای سوال، will را به ابتدای جمله می‌بریم: Will you come?\n'
      '۶. برای قول و پیشنهاد هم از will استفاده می‌کنیم: I\'ll help you.\n\n'
      'مثبت:\n'
      'I will study tomorrow.\n\n'
      'منفی:\n'
      'I will not study tomorrow.\n'
      'I won\'t study tomorrow.\n\n'
      'سوالی:\n'
      'Will you study tomorrow?\n'
      'Yes, I will. / No, I won\'t.',
  formula:
      'Positive:\n'
      'Subject + will + verb\n\n'
      'Negative:\n'
      'Subject + will not + verb\n'
      'Subject + won\'t + verb\n\n'
      'Question:\n'
      'Will + subject + verb?\n\n'
      'Short answers:\n'
      'Yes, I will.\n'
      'No, I won\'t.',
  words: const [
    Word('will', 'خواهد / خواهم', 'WIL', '🔮'),
    Word('future', 'آینده', 'FYOO-cher', '🚀'),
    Word('tomorrow', 'فردا', 'tuh-MOR-oh', '📅'),
    Word('later', 'بعداً', 'LEY-ter', '⏳'),
    Word('soon', 'به‌زودی', 'SOON', '⚡'),
    Word('maybe', 'شاید', 'MEY-bee', '🤔'),
    Word('probably', 'احتمالاً', 'PROB-uh-blee', '🎯'),
    Word('promise', 'قول دادن', 'PROM-is', '🤝'),
    Word('help', 'کمک کردن', 'HELP', '🆘'),
    Word('call', 'تماس گرفتن', 'KAWL', '📞'),
    Word('answer', 'پاسخ دادن', 'AN-ser', '💬'),
    Word('wait', 'صبر کردن', 'WEYT', '⏳'),
    Word('open', 'باز کردن', 'OH-pen', '🚪'),
    Word('close', 'بستن', 'KLOHZ', '🔒'),
    Word('bring', 'آوردن', 'BRING', '🎒'),
    Word('give', 'دادن', 'GIV', '🎁'),
    Word('take', 'گرفتن/بردن', 'TEYK', '✋'),
    Word('send', 'فرستادن', 'SEND', '📨'),
    Word('tell', 'گفتن', 'TEL', '🗣️'),
    Word('show', 'نشان دادن', 'SHOH', '👀'),
    Word('remember', 'به یاد آوردن', 'ri-MEM-ber', '🧠'),
    Word('forget', 'فراموش کردن', 'fer-GET', '😵'),
    Word('rain', 'باریدن', 'REYN', '🌧️'),
    Word('win', 'برنده شدن', 'WIN', '🏆'),
    Word('lose', 'باختن', 'LOOZ', '❌'),
    Word('become', 'شدن', 'bi-KUM', '📈'),
    Word('grow', 'رشد کردن', 'GROH', '🌱'),
    Word('change', 'تغییر کردن', 'CHEYNJ', '🔄'),
    Word('decide', 'تصمیم گرفتن', 'di-SAID', '🤔'),
    Word('believe', 'باور کردن', 'bi-LEEV', '💭'),
  ],
  examples: const [
    'I will study tomorrow. — من فردا درس خواهم خواند.',
    'She will come soon. — او به‌زودی خواهد آمد.',
    'They will travel next week. — آن‌ها هفته آینده سفر خواهند کرد.',
    'He will help me. — او به من کمک خواهد کرد.',
    'I will call you later. — بعداً با تو تماس خواهم گرفت.',
    'We will meet tomorrow. — ما فردا همدیگر را خواهیم دید.',
    'I will help you. — به تو کمک خواهم کرد.',
    'I will open the door. — در را باز خواهم کرد.',
    'I will close the window. — پنجره را خواهم بست.',
    'I will bring your book. — کتابت را خواهم آورد.',
    'She will give me the answer. — او جواب را به من خواهد داد.',
    'I will take this bag. — این کیف را خواهم برد.',
    'He will send a message. — او یک پیام خواهد فرستاد.',
    'I will tell you later. — بعداً به تو خواهم گفت.',
    'I will show you my project. — پروژه‌ام را به تو نشان خواهم داد.',
    'I will remember your name. — اسم تو را به یاد خواهم داشت.',
    'I will not forget this. — این را فراموش نخواهم کرد.',
    'I won\'t be late. — دیر نخواهم کرد.',
    'She won\'t come today. — او امروز نخواهد آمد.',
    'They won\'t play tomorrow. — آن‌ها فردا بازی نخواهند کرد.',
    'Will you help me? — به من کمک خواهی کرد؟',
    'Will you come tomorrow? — فردا خواهی آمد؟',
    'Will he call us? — آیا او با ما تماس خواهد گرفت؟',
    'Will they win the game? — آیا آن‌ها بازی را خواهند برد؟',
    'Yes, I will. — بله.',
    'No, I won\'t. — نه.',
    'Maybe it will rain tomorrow. — شاید فردا باران ببارد.',
    'I think he will become successful. — فکر می‌کنم او موفق خواهد شد.',
    'People will change in the future. — مردم در آینده تغییر خواهند کرد.',
    'I believe you will succeed. — باور دارم که موفق خواهی شد.',
  ],
  questions: const [
    Question(
      'What is the basic structure of will?',
      ['will + verb', 'will + verb-ing', 'will + past verb', 'will + to + verb'],
      'will + verb',
    ),
    Question(
      'Complete: "I ___ study tomorrow."',
      ['will', 'am', 'do', 'have'],
      'will',
    ),
    Question(
      'Complete: "She ___ come soon."',
      ['will', 'is', 'does', 'has'],
      'will',
    ),
    Question(
      'What does "promise" mean?',
      ['قول دادن', 'فراموش کردن', 'بردن', 'تغییر کردن'],
      'قول دادن',
    ),
    Question(
      'Complete: "I will ___ you."',
      ['help', 'helps', 'helping', 'helped'],
      'help',
    ),
    Question(
      'Which is the correct negative?',
      [
        'I won\'t go.',
        'I don\'t will go.',
        'I won\'t going.',
        'I not will go.'
      ],
      'I won\'t go.',
    ),
    Question(
      'What does "later" mean?',
      ['بعداً', 'امروز', 'دیروز', 'همیشه'],
      'بعداً',
    ),
    Question(
      'Complete: "They ___ travel next week."',
      ['will', 'are', 'do', 'have'],
      'will',
    ),
    Question(
      'What is the short form of "will not"?',
      ['won\'t', 'willn\'t', 'don\'t', 'isn\'t'],
      'won\'t',
    ),
    Question(
      'Choose the correct question.',
      [
        'Will you come?',
        'You will come?',
        'Do you will come?',
        'Will come you?'
      ],
      'Will you come?',
    ),
    Question(
      'What does "soon" mean?',
      ['به‌زودی', 'بعداً', 'دیروز', 'دیر'],
      'به‌زودی',
    ),
    Question(
      'Complete: "He will ___ me."',
      ['call', 'calls', 'calling', 'called'],
      'call',
    ),
    Question(
      'What does "bring" mean?',
      ['آوردن', 'بردن', 'گرفتن', 'فرستادن'],
      'آوردن',
    ),
    Question(
      'Complete: "I will ___ your book."',
      ['bring', 'brings', 'bringing', 'brought'],
      'bring',
    ),
    Question(
      'What does "send" mean?',
      ['فرستادن', 'گفتن', 'نشان دادن', 'باز کردن'],
      'فرستادن',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'She will help me.',
        'She will helps me.',
        'She will helping me.',
        'She will helped me.'
      ],
      'She will help me.',
    ),
    Question(
      'What does "forget" mean?',
      ['فراموش کردن', 'یاد گرفتن', 'به یاد آوردن', 'باور کردن'],
      'فراموش کردن',
    ),
    Question(
      'Complete: "I won\'t ___ this."',
      ['forget', 'forgets', 'forgetting', 'forgot'],
      'forget',
    ),
    Question(
      'What does "remember" mean?',
      ['به یاد آوردن', 'فراموش کردن', 'تصمیم گرفتن', 'تغییر کردن'],
      'به یاد آوردن',
    ),
    Question(
      'Choose the correct short answer: "Will you come?"',
      ['Yes, I will.', 'Yes, I am.', 'Yes, I do.', 'Yes, I can.'],
      'Yes, I will.',
    ),
    Question(
      'Choose the correct negative answer: "Will he come?"',
      ['No, he won\'t.', 'No, he isn\'t.', 'No, he doesn\'t.', 'No, he not.'],
      'No, he won\'t.',
    ),
    Question(
      'What does "maybe" mean?',
      ['شاید', 'حتماً', 'هرگز', 'همیشه'],
      'شاید',
    ),
    Question(
      'Complete: "Maybe it ___ rain tomorrow."',
      ['will', 'is', 'does', 'has'],
      'will',
    ),
    Question(
      'What does "win" mean?',
      ['برنده شدن', 'باختن', 'رشد کردن', 'شدن'],
      'برنده شدن',
    ),
    Question(
      'Complete: "They will ___ the game."',
      ['win', 'wins', 'winning', 'won'],
      'win',
    ),
    Question(
      'What does "become" mean?',
      ['شدن', 'تغییر کردن', 'رشد کردن', 'باور کردن'],
      'شدن',
    ),
    Question(
      'Choose the correct sentence.',
      [
        'I will call you later.',
        'I will calls you later.',
        'I will calling you later.',
        'I will called you later.'
      ],
      'I will call you later.',
    ),
    Question(
      'What does "believe" mean?',
      ['باور کردن', 'تصمیم گرفتن', 'کمک کردن', 'منتظر ماندن'],
      'باور کردن',
    ),
    Question(
      'Complete: "I believe you ___ succeed."',
      ['will', 'are', 'do', 'have'],
      'will',
    ),
    Question(
      'Which sentence uses will correctly?',
      [
        'I will study tomorrow.',
        'I will studying tomorrow.',
        'I will studied tomorrow.',
        'I will to study tomorrow.'
      ],
      'I will study tomorrow.',
    ),
  ],
);
// ==========================================================
// LESSON 23: Superlative Adjectives
// ==========================================================
final lesson23 = Lesson(
  id: 23,
  title: 'Superlative Adjectives',
  subtitle: 'صفت‌های عالی',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور وقتی یک چیز را با همه‌ی اعضای یک گروه مقایسه می‌کنی، بگویی آن چیز "بزرگ‌ترین"، "سریع‌ترین"، "بهترین" و... است.\n\n'
      '📌 نکات مهم\n'
      '۱. برای صفت‌های کوتاه معمولاً از the + adjective + est استفاده می‌کنیم: '
      'big → the biggest.\n'
      '۲. اگر صفت به e ختم شود، فقط st اضافه می‌کنیم: nice → the nicest.\n'
      '۳. اگر صفت کوتاه به یک صامت + صدادار + صامت ختم شود، حرف آخر دو برابر می‌شود: '
      'big → the biggest, hot → the hottest.\n'
      '۴. برای صفت‌های بلند معمولاً از the most استفاده می‌کنیم: '
      'beautiful → the most beautiful.\n'
      '۵. بعضی صفت‌ها بی‌قاعده هستند: good → the best, bad → the worst.\n'
      '۶. قبل از صفت عالی معمولاً از "the" استفاده می‌کنیم: '
      'He is the tallest student in the class.',
  formula:
      'Short adjective → the + adjective-est\n'
      'big → the biggest\n'
      'fast → the fastest\n\n'
      'Long adjective → the most + adjective\n'
      'beautiful → the most beautiful\n\n'
      'Irregular:\n'
      'good → the best\n'
      'bad → the worst',
  words: const [
    Word('biggest', 'بزرگ‌ترین', 'BIG-ist', '🐘'),
    Word('smallest', 'کوچک‌ترین', 'SMAWL-ist', '🐜'),
    Word('tallest', 'بلندقدترین', 'TAWL-ist', '🧍'),
    Word('shortest', 'کوتاه‌ترین', 'SHORT-ist', '📏'),
    Word('fastest', 'سریع‌ترین', 'FAST-ist', '🏎️'),
    Word('slowest', 'کندترین', 'SLOH-ist', '🐢'),
    Word('oldest', 'قدیمی‌ترین/مسن‌ترین', 'OHL-dist', '👴'),
    Word('youngest', 'جوان‌ترین', 'YUNG-ist', '🧒'),
    Word('longest', 'طولانی‌ترین', 'LONG-ist', '📏'),
    Word('shortest', 'کوتاه‌ترین', 'SHORT-ist', '📐'),
    Word('highest', 'بالاترین', 'HAI-ist', '⬆️'),
    Word('lowest', 'پایین‌ترین', 'LOH-ist', '⬇️'),
    Word('strongest', 'قوی‌ترین', 'STRONG-ist', '💪'),
    Word('weakest', 'ضعیف‌ترین', 'WEEK-ist', '🫥'),
    Word('easiest', 'آسان‌ترین', 'EE-zee-ist', '😊'),
    Word('hardest', 'سخت‌ترین', 'HARD-ist', '🧠'),
    Word('best', 'بهترین', 'BEST', '🏆'),
    Word('worst', 'بدترین', 'WURST', '👎'),
    Word('most', 'بیشترین', 'MOHST', '🔝'),
    Word('beautiful', 'زیبا', 'BYOO-tuh-ful', '🌸'),
    Word('interesting', 'جالب', 'IN-ter-es-ting', '🤔'),
    Word('important', 'مهم', 'im-POR-tunt', '⭐'),
    Word('expensive', 'گران', 'ik-SPEN-siv', '💰'),
    Word('difficult', 'سخت', 'DIF-i-kult', '🧩'),
    Word('popular', 'محبوب', 'POP-yuh-ler', '❤️'),
    Word('dangerous', 'خطرناک', 'DEYN-jer-us', '⚠️'),
    Word('famous', 'مشهور', 'FEY-mus', '🌟'),
    Word('clean', 'تمیز', 'KLEEN', '🧼'),
    Word('cheap', 'ارزان', 'CHEEP', '💵'),
    Word('easy', 'آسان', 'EE-zee', '😊'),
  ],
  examples: const [
    'Ahmad is the tallest student in the class. — احمد بلندقدترین دانش‌آموز کلاس است.',
    'This is the biggest house in the street. — این بزرگ‌ترین خانه در خیابان است.',
    'This is the smallest room. — این کوچک‌ترین اتاق است.',
    'Ali is the fastest runner in our team. — علی سریع‌ترین دونده‌ی تیم ماست.',
    'This is the slowest car. — این کندترین ماشین است.',
    'My grandfather is the oldest person in my family. — پدربزرگم مسن‌ترین فرد خانواده‌ام است.',
    'She is the youngest student here. — او جوان‌ترین دانش‌آموز اینجاست.',
    'This is the longest road in the city. — این طولانی‌ترین جاده‌ی شهر است.',
    'This is the highest mountain in the country. — این بلندترین کوه کشور است.',
    'This is the lowest price. — این پایین‌ترین قیمت است.',
    'He is the strongest player on the team. — او قوی‌ترین بازیکن تیم است.',
    'This is the easiest question. — این آسان‌ترین سؤال است.',
    'This is the hardest lesson. — این سخت‌ترین درس است.',
    'Today is the best day of my life. — امروز بهترین روز زندگی من است.',
    'That was the worst movie I watched. — آن بدترین فیلمی بود که دیدم.',
    'She is the most beautiful girl in the story. — او زیباترین دختر داستان است.',
    'This is the most interesting book. — این جالب‌ترین کتاب است.',
    'English is one of the most important languages. — انگلیسی یکی از مهم‌ترین زبان‌هاست.',
    'This is the most expensive phone. — این گران‌ترین گوشی است.',
    'This is the most difficult question. — این سخت‌ترین سؤال است.',
    'He is the most famous person in the city. — او مشهورترین فرد شهر است.',
    'This is the cheapest restaurant here. — این ارزان‌ترین رستوران اینجاست.',
    'That is the cleanest room in the house. — آن تمیزترین اتاق خانه است.',
    'This is the fastest way to learn. — این سریع‌ترین راه برای یادگیری است.',
    'Who is the tallest student? — بلندقدترین دانش‌آموز کیست؟',
    'What is the best choice? — بهترین انتخاب چیست؟',
    'Which is the most expensive car? — کدام گران‌ترین ماشین است؟',
    'This is the easiest way. — این آسان‌ترین راه است.',
    'He is the strongest person here. — او قوی‌ترین فرد اینجاست.',
    'This is the most popular game. — این محبوب‌ترین بازی است.',
  ],
  questions: const [
    Question('What does "biggest" mean?', ['بزرگ‌ترین', 'کوچک‌ترین', 'سریع‌ترین', 'بلندترین'], 'بزرگ‌ترین'),
    Question('How do you say "کوچک‌ترین"?', ['Biggest', 'Smallest', 'Fastest', 'Highest'], 'Smallest'),
    Question('Complete: "He is the ___ student."', ['tallest', 'tall', 'taller', 'height'], 'tallest'),
    Question('What does "fastest" mean?', ['کندترین', 'سریع‌ترین', 'قوی‌ترین', 'سخت‌ترین'], 'سریع‌ترین'),
    Question('How do you say "قدیمی‌ترین/مسن‌ترین"?', ['Youngest', 'Oldest', 'Strongest', 'Lowest'], 'Oldest'),
    Question('Complete: "She is the ___ person in the family."', ['youngest', 'young', 'younger', 'youngly'], 'youngest'),
    Question('What does "highest" mean?', ['بالاترین', 'پایین‌ترین', 'بلندترین', 'کوتاه‌ترین'], 'بالاترین'),
    Question('How do you say "قوی‌ترین"?', ['Weakest', 'Strongest', 'Fastest', 'Lowest'], 'Strongest'),
    Question('Complete: "This is the ___ question."', ['easiest', 'easy', 'easier', 'easily'], 'easiest'),
    Question('What does "hardest" mean?', ['آسان‌ترین', 'سخت‌ترین', 'بزرگ‌ترین', 'بهترین'], 'سخت‌ترین'),
    Question('How do you say "بهترین"?', ['Worst', 'Best', 'Most', 'Good'], 'Best'),
    Question('Complete: "Today is the ___ day."', ['best', 'good', 'better', 'well'], 'best'),
    Question('What does "worst" mean?', ['بهترین', 'بدترین', 'بزرگ‌ترین', 'سریع‌ترین'], 'بدترین'),
    Question('Complete: "This is the ___ movie."', ['worst', 'bad', 'worse', 'badly'], 'worst'),
    Question('Which is correct?', ['the beautifulest', 'the most beautiful', 'most beautifulest', 'beautiful more'], 'the most beautiful'),
    Question('Complete: "This is the ___ book."', ['most interesting', 'interestingest', 'more interesting', 'interest'], 'most interesting'),
    Question('What does "expensive" mean?', ['ارزان', 'گران', 'سریع', 'سخت'], 'گران'),
    Question('How do you say "مشهورترین"?', ['The most famous', 'The famousest', 'The more famous', 'Most fame'], 'The most famous'),
    Question('Complete: "This is the ___ phone."', ['most expensive', 'expensiveest', 'more expensive', 'expensive'], 'most expensive'),
    Question('What does "popular" mean?', ['محبوب', 'خطرناک', 'سخت', 'زیبا'], 'محبوب'),
    Question('Complete: "This is the ___ game."', ['most popular', 'popularest', 'more popular', 'popular'], 'most popular'),
    Question('Which is correct?', ['the biggest', 'biggest the', 'the big', 'big the'], 'the biggest'),
    Question('Complete: "He is ___ strongest player."', ['the', 'a', 'an', 'no word'], 'the'),
    Question('What is the superlative of "good"?', ['goodest', 'better', 'the best', 'the good'], 'the best'),
    Question('What is the superlative of "bad"?', ['badest', 'worse', 'the worst', 'the bad'], 'the worst'),
    Question('What is the superlative of "fast"?', ['the faster', 'the fastest', 'fastest the', 'most fast'], 'the fastest'),
    Question('What is the superlative of "beautiful"?', ['the beautifulest', 'the most beautiful', 'the beautiful', 'most beautifulest'], 'the most beautiful'),
    Question('Complete: "This is the ___ way."', ['easiest', 'easy', 'easier', 'most easy'], 'easiest'),
    Question('What does "difficult" mean?', ['آسان', 'سخت', 'محبوب', 'ارزان'], 'سخت'),
    Question('Complete: "English is one of the ___ important languages."', ['most', 'more', 'much', 'many'], 'most'),
  ],
);
// ==========================================================
// LESSON 24: Adverbs of Manner
// ==========================================================
final lesson24 = Lesson(
  id: 24,
  title: 'Adverbs of Manner',
  subtitle: 'قیدهای حالت و چگونگی انجام کار',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور توضیح بدهی یک کار چگونه انجام می‌شود؛ مثلاً سریع، آرام، خوب یا با دقت.\n\n'
      '📌 نکات مهم\n'
      '۱. قیدهای حالت معمولاً توضیح می‌دهند یک فعل چگونه انجام می‌شود: He runs quickly.\n'
      '۲. بسیاری از قیدها با اضافه کردن ly به صفت ساخته می‌شوند: slow → slowly.\n'
      '۳. اگر صفت به y ختم شود، معمولاً y به i تبدیل می‌شود: easy → easily.\n'
      '۴. بعضی کلمات بی‌قاعده هستند: good → well.\n'
      '۵. بعد از فعل‌های حرکتی و عملی می‌توانیم از قید حالت استفاده کنیم: She speaks slowly.\n'
      '۶. سؤال رایج برای قید حالت "How?" است: How does he speak? — He speaks slowly.',
  formula:
      'Adjective + ly → Adverb\n'
      'slow → slowly\n'
      'quick → quickly\n'
      'careful → carefully\n'
      'easy → easily\n\n'
      'Irregular:\n'
      'good → well\n'
      'fast → fast',
  words: const [
    Word('quickly', 'به‌سرعت', 'KWIK-lee', '⚡'),
    Word('slowly', 'آهسته', 'SLOH-lee', '🐢'),
    Word('carefully', 'با دقت', 'KAIR-ful-lee', '🔍'),
    Word('easily', 'به‌آسانی', 'EE-zuh-lee', '😊'),
    Word('quietly', 'آرام و بی‌صدا', 'KWAI-et-lee', '🤫'),
    Word('loudly', 'با صدای بلند', 'LOWD-lee', '📢'),
    Word('happily', 'با خوشحالی', 'HAP-uh-lee', '😄'),
    Word('sadly', 'با ناراحتی', 'SAD-lee', '😔'),
    Word('angrily', 'با عصبانیت', 'ANG-gri-lee', '😠'),
    Word('politely', 'مودبانه', 'puh-LAIT-lee', '🙏'),
    Word('badly', 'بد', 'BAD-lee', '👎'),
    Word('well', 'خوب', 'WEL', '👍'),
    Word('fast', 'سریع', 'FAST', '🏎️'),
    Word('hard', 'سخت', 'HARD', '💪'),
    Word('beautifully', 'به زیبایی', 'BYOO-tuh-ful-lee', '🌸'),
    Word('correctly', 'به‌درستی', 'kuh-REKT-lee', '✅'),
    Word('wrongly', 'به‌اشتباه', 'RONG-lee', '❌'),
    Word('clearly', 'واضح', 'KLEER-lee', '💡'),
    Word('slow', 'آهسته', 'SLOH', '🐌'),
    Word('quick', 'سریع', 'KWIK', '⚡'),
    Word('careful', 'مراقب/دقیق', 'KAIR-ful', '🧐'),
    Word('easy', 'آسان', 'EE-zee', '🙂'),
    Word('quiet', 'ساکت', 'KWAI-et', '🤫'),
    Word('loud', 'بلند', 'LOWD', '🔊'),
    Word('happy', 'خوشحال', 'HAP-ee', '😃'),
    Word('angry', 'عصبانی', 'ANG-gree', '😡'),
    Word('polite', 'مودب', 'puh-LAIT', '🎩'),
    Word('correct', 'درست', 'kuh-REKT', '✔️'),
    Word('clear', 'واضح', 'KLEER', '💬'),
    Word('speak', 'صحبت کردن', 'SPEEK', '🗣️'),
  ],
  examples: const [
    'He runs quickly. — او سریع می‌دود.',
    'She walks slowly. — او آهسته راه می‌رود.',
    'Please drive carefully. — لطفاً با دقت رانندگی کن.',
    'I can do it easily. — من می‌توانم آن را به‌آسانی انجام دهم.',
    'The baby sleeps quietly. — نوزاد آرام می‌خوابد.',
    'He speaks loudly. — او با صدای بلند صحبت می‌کند.',
    'She smiled happily. — او با خوشحالی لبخند زد.',
    'He answered sadly. — او با ناراحتی جواب داد.',
    'She spoke angrily. — او با عصبانیت صحبت کرد.',
    'He answered politely. — او مودبانه جواب داد.',
    'You did it well. — تو آن را خوب انجام دادی.',
    'He runs fast. — او سریع می‌دود.',
    'She works hard. — او سخت کار می‌کند.',
    'He sings beautifully. — او زیبا آواز می‌خواند.',
    'Please write correctly. — لطفاً درست بنویس.',
    'He answered wrongly. — او اشتباه جواب داد.',
    'Please speak clearly. — لطفاً واضح صحبت کن.',
    'She drives carefully. — او با دقت رانندگی می‌کند.',
    'He learns quickly. — او سریع یاد می‌گیرد.',
    'They work quietly. — آن‌ها بی‌صدا کار می‌کنند.',
    'How does he speak? — او چگونه صحبت می‌کند؟',
    'He speaks slowly. — او آهسته صحبت می‌کند.',
    'How does she work? — او چگونه کار می‌کند؟',
    'She works carefully. — او با دقت کار می‌کند.',
    'How do you learn English? — چطور انگلیسی یاد می‌گیری؟',
    'I learn English easily. — من انگلیسی را به‌آسانی یاد می‌گیرم.',
    'He plays well. — او خوب بازی می‌کند.',
    'The car moves quickly. — ماشین سریع حرکت می‌کند.',
    'Please listen carefully. — لطفاً با دقت گوش بده.',
    'She answered correctly. — او درست جواب داد.',
  ],
  questions: const [
    Question('What does "quickly" mean?', ['به‌سرعت', 'آهسته', 'با دقت', 'آرام'], 'به‌سرعت'),
    Question('How do you say "آهسته"?', ['Quickly', 'Slowly', 'Loudly', 'Happily'], 'Slowly'),
    Question('Complete: "Please drive ___."', ['carefully', 'careful', 'care', 'caring'], 'carefully'),
    Question('What does "easily" mean?', ['به‌سختی', 'به‌آسانی', 'با عصبانیت', 'بلند'], 'به‌آسانی'),
    Question('How do you say "آرام و بی‌صدا"?', ['Loudly', 'Quietly', 'Quickly', 'Sadly'], 'Quietly'),
    Question('Complete: "He speaks ___."', ['loudly', 'loud', 'louder', 'loudness'], 'loudly'),
    Question('What does "happily" mean?', ['با ناراحتی', 'با خوشحالی', 'با عصبانیت', 'آرام'], 'با خوشحالی'),
    Question('How do you say "با عصبانیت"?', ['Sadly', 'Happily', 'Angrily', 'Politely'], 'Angrily'),
    Question('Complete: "She answered ___."', ['politely', 'polite', 'politest', 'politeness'], 'politely'),
    Question('What does "well" mean?', ['بد', 'خوب', 'سریع', 'آهسته'], 'خوب'),
    Question('Which is correct?', ['He runs fastly.', 'He runs fast.', 'He runs fastestly.', 'He fast runs.'], 'He runs fast.'),
    Question('Complete: "She sings ___."', ['beautifully', 'beautiful', 'beauty', 'beautifulest'], 'beautifully'),
    Question('What does "correctly" mean?', ['به‌اشتباه', 'به‌درستی', 'آهسته', 'بلند'], 'به‌درستی'),
    Question('How do you say "واضح"?', ['Clearly', 'Wrongly', 'Badly', 'Slowly'], 'Clearly'),
    Question('Complete: "Please speak ___."', ['clearly', 'clear', 'clearness', 'clearest'], 'clearly'),
    Question('What is the adverb of "slow"?', ['slowly', 'slowy', 'slowness', 'slowest'], 'slowly'),
    Question('What is the adverb of "quick"?', ['quickly', 'quickful', 'quickness', 'quickest'], 'quickly'),
    Question('What is the adverb of "careful"?', ['carefully', 'carefuly', 'care', 'careless'], 'carefully'),
    Question('What is the adverb of "easy"?', ['easyly', 'easily', 'easly', 'easiest'], 'easily'),
    Question('What is the adverb of "happy"?', ['happyly', 'happily', 'happily', 'happiest'], 'happily'),
    Question('What is the adverb of "polite"?', ['politely', 'politeful', 'politeness', 'polited'], 'politely'),
    Question('Complete: "He works ___."', ['hard', 'hardly', 'hardness', 'hardest'], 'hard'),
    Question('How do you ask about the way someone does something?', ['Why?', 'How?', 'When?', 'Who?'], 'How?'),
    Question('Complete: "How does he ___?"', ['speak', 'speaks', 'speaking', 'spoke'], 'speak'),
    Question('Complete: "He speaks ___."', ['slowly', 'slow', 'slowness', 'slower'], 'slowly'),
    Question('What does "badly" mean?', ['خوب', 'بد', 'سریع', 'واضح'], 'بد'),
    Question('Complete: "She did the job ___."', ['well', 'good', 'best', 'better'], 'well'),
    Question('What does "wrongly" mean?', ['به‌درستی', 'به‌اشتباه', 'به‌سرعت', 'مودبانه'], 'به‌اشتباه'),
    Question('Complete: "Please listen ___."', ['carefully', 'careful', 'care', 'cared'], 'carefully'),
    Question('Which word is an adverb?', ['quick', 'quickly', 'quickness', 'quicker'], 'quickly'),
  ],
);
// ==========================================================
// LESSON 25: Must / Mustn't
// ==========================================================
final lesson25 = Lesson(
  id: 25,
  title: 'Must / Mustn’t',
  subtitle: 'باید و نباید',
  explanation:
      '🎯 هدف درس\n'
      'در این درس یاد می‌گیری چطور درباره‌ی اجبار، قوانین و کارهایی که نباید انجام شوند صحبت کنی.\n\n'
      '📌 نکات مهم\n'
      '۱. برای بیان اجبار از must + فعل ساده استفاده می‌کنیم: You must study.\n'
      '۲. بعد از must همیشه شکل ساده‌ی فعل می‌آید و به فعل s اضافه نمی‌کنیم.\n'
      '۳. برای بیان ممنوعیت از mustn’t استفاده می‌کنیم: You mustn’t smoke.\n'
      '۴. mustn’t یعنی "نباید / ممنوع است" و با don’t have to فرق دارد.\n'
      '۵. must برای همه‌ی فاعل‌ها یکسان است: I must, He must, They must.\n'
      '۶. برای سؤال می‌توانیم بگوییم: Must I go? — آیا باید بروم؟',
  formula:
      'Positive:\n'
      'Subject + must + base verb\n'
      'You must study.\n\n'
      'Negative:\n'
      'Subject + mustn’t + base verb\n'
      'You mustn’t run.\n\n'
      'Question:\n'
      'Must + subject + base verb?\n'
      'Must I go?',
  words: const [
    Word('must', 'باید', 'MUST', '✅'),
    Word('mustn’t', 'نباید/ممنوع است', 'MUS-ent', '🚫'),
    Word('rule', 'قانون', 'ROOL', '📜'),
    Word('important', 'مهم', 'im-POR-tunt', '⭐'),
    Word('necessary', 'ضروری', 'NES-uh-ser-ee', '❗'),
    Word('allowed', 'مجاز', 'uh-LOWD', '✅'),
    Word('forbidden', 'ممنوع', 'fer-BID-un', '🚫'),
    Word('safe', 'امن', 'SEYF', '🛡️'),
    Word('dangerous', 'خطرناک', 'DEYN-jer-us', '⚠️'),
    Word('careful', 'مراقب/دقیق', 'KAIR-ful', '👀'),
    Word('wear', 'پوشیدن', 'WAIR', '👕'),
    Word('follow', 'دنبال کردن/رعایت کردن', 'FAH-loh', '📋'),
    Word('obey', 'اطاعت کردن', 'oh-BEY', '🫡'),
    Word('stop', 'متوقف شدن', 'STOP', '🛑'),
    Word('wait', 'صبر کردن', 'WEYT', '⏳'),
    Word('listen', 'گوش دادن', 'LIS-un', '👂'),
    Word('study', 'مطالعه کردن', 'STUD-ee', '📚'),
    Word('work', 'کار کردن', 'WURK', '💼'),
    Word('help', 'کمک کردن', 'HELP', '🤝'),
    Word('clean', 'تمیز کردن', 'KLEEN', '🧹'),
    Word('respect', 'احترام گذاشتن', 'ree-SPEKT', '🙏'),
    Word('remember', 'به یاد داشتن', 'ree-MEM-ber', '🧠'),
    Word('forget', 'فراموش کردن', 'fer-GET', '🤦'),
    Word('enter', 'وارد شدن', 'EN-ter', '🚪'),
    Word('leave', 'ترک کردن', 'LEEV', '🚶'),
    Word('touch', 'دست زدن', 'TUCH', '☝️'),
    Word('smoke', 'سیگار کشیدن', 'SMOHK', '🚭'),
    Word('drive', 'رانندگی کردن', 'DRAIV', '🚗'),
    Word('seatbelt', 'کمربند ایمنی', 'SEET-belt', '🚘'),
    Word('permission', 'اجازه', 'per-MISH-un', '📝'),
    Word('responsible', 'مسئول', 'ree-SPON-suh-bul', '🎯'),
  ],
  examples: const [
    'I must study today. — من باید امروز درس بخوانم.',
    'You must listen to the teacher. — تو باید به معلم گوش بدهی.',
    'We must follow the rules. — ما باید قوانین را رعایت کنیم.',
    'You must be careful. — باید مراقب باشی.',
    'He must work hard. — او باید سخت کار کند.',
    'She must finish her homework. — او باید تکالیفش را تمام کند.',
    'They must wait here. — آن‌ها باید اینجا صبر کنند.',
    'You must wear a seatbelt. — باید کمربند ایمنی ببندی.',
    'We must respect other people. — ما باید به دیگران احترام بگذاریم.',
    'I must remember this rule. — من باید این قانون را به یاد داشته باشم.',
    'You mustn’t run here. — نباید اینجا بدوی.',
    'You mustn’t touch this. — نباید به این دست بزنی.',
    'We mustn’t be late. — ما نباید دیر کنیم.',
    'You mustn’t smoke here. — نباید اینجا سیگار بکشی.',
    'He mustn’t drive too fast. — او نباید خیلی سریع رانندگی کند.',
    'Students mustn’t use phones in class. — دانش‌آموزان نباید در کلاس از گوشی استفاده کنند.',
    'You mustn’t forget your homework. — نباید تکالیفت را فراموش کنی.',
    'We mustn’t enter this room. — ما نباید وارد این اتاق شویم.',
    'Must I finish this today? — آیا باید این را امروز تمام کنم؟',
    'Must we wait here? — آیا باید اینجا صبر کنیم؟',
    'Must he come with us? — آیا او باید با ما بیاید؟',
    'Yes, you must. — بله، باید.',
    'No, you mustn’t. — نه، نباید.',
    'You must be careful because it is dangerous. — باید مراقب باشی چون خطرناک است.',
    'Everyone must follow the rules. — همه باید قوانین را رعایت کنند.',
    'You must have permission to enter. — برای ورود باید اجازه داشته باشی.',
    'We must keep the room clean. — ما باید اتاق را تمیز نگه داریم.',
    'You must stop here. — باید اینجا توقف کنی.',
    'You must listen carefully. — باید با دقت گوش بدهی.',
    'Students must study for the exam. — دانش‌آموزان باید برای امتحان درس بخوانند.',
  ],
  questions: const [
    Question('What does "must" mean?', ['باید', 'نباید', 'ممنوع', 'اجازه'], 'باید'),
    Question('What does "mustn’t" mean?', ['باید', 'نباید', 'می‌تواند', 'لازم نیست'], 'نباید'),
    Question('Complete: "You ___ study."', ['must', 'mustn’t', 'are', 'have'], 'must'),
    Question('Complete: "You ___ run here."', ['must', 'mustn’t', 'must to', 'are'], 'mustn’t'),
    Question('What does "rule" mean?', ['قانون', 'اجازه', 'خطر', 'کار'], 'قانون'),
    Question('How do you say "ممنوع"?', ['Allowed', 'Forbidden', 'Safe', 'Important'], 'Forbidden'),
    Question('Complete: "You must ___ careful."', ['be', 'are', 'is', 'being'], 'be'),
    Question('Which is correct?', ['He must studies.', 'He must study.', 'He must studying.', 'He must to study.'], 'He must study.'),
    Question('Complete: "We must ___ the rules."', ['follow', 'follows', 'following', 'to follow'], 'follow'),
    Question('What does "safe" mean?', ['خطرناک', 'امن', 'ممنوع', 'مهم'], 'امن'),
    Question('How do you say "خطرناک"?', ['Safe', 'Dangerous', 'Allowed', 'Careful'], 'Dangerous'),
    Question('Complete: "You mustn’t ___ this."', ['touch', 'touches', 'touching', 'to touch'], 'touch'),
    Question('What does "wear" mean?', ['پوشیدن', 'خوردن', 'دویدن', 'شنیدن'], 'پوشیدن'),
    Question('Complete: "You must ___ a seatbelt."', ['wear', 'wears', 'wearing', 'to wearing'], 'wear'),
    Question('What does "permission" mean?', ['قانون', 'اجازه', 'خطر', 'مسئولیت'], 'اجازه'),
    Question('Complete: "Must I ___ now?"', ['go', 'goes', 'going', 'to go'], 'go'),
    Question('Which sentence is correct?', ['You mustn’t smoke here.', 'You mustn’t smokes here.', 'You mustn’t to smoke here.', 'You mustn’t smoking here.'], 'You mustn’t smoke here.'),
    Question('What does "respect" mean?', ['احترام گذاشتن', 'فراموش کردن', 'ترک کردن', 'وارد شدن'], 'احترام گذاشتن'),
    Question('Complete: "We must ___ other people."', ['respect', 'respects', 'respecting', 'to respects'], 'respect'),
    Question('What does "obey" mean?', ['اطاعت کردن', 'صبر کردن', 'کمک کردن', 'تمیز کردن'], 'اطاعت کردن'),
    Question('Complete: "You must ___ the rules."', ['obey', 'obeys', 'obeying', 'to obeying'], 'obey'),
    Question('What does "forget" mean?', ['به یاد داشتن', 'فراموش کردن', 'گوش دادن', 'پوشیدن'], 'فراموش کردن'),
    Question('Complete: "You mustn’t ___ your homework."', ['forget', 'forgets', 'forgetting', 'to forgetting'], 'forget'),
    Question('Which word means "ضروری"?', ['Necessary', 'Dangerous', 'Forbidden', 'Allowed'], 'Necessary'),
    Question('Complete: "Students ___ listen to the teacher."', ['must', 'mustn’t', 'is', 'has'], 'must'),
    Question('Which sentence means "نباید اینجا وارد شوی"?', ['You must enter here.', 'You mustn’t enter here.', 'You must entering here.', 'You must to enter here.'], 'You mustn’t enter here.'),
    Question('Complete: "You ___ stop here."', ['must', 'mustn’t', 'are', 'has'], 'must'),
    Question('Can we use "must" with "he"?', ['Yes', 'No', 'Only in questions', 'Only in negatives'], 'Yes'),
    Question('Which is correct?', ['They must work.', 'They must works.', 'They must working.', 'They must to work.'], 'They must work.'),
    Question('What does "responsible" mean?', ['مسئول', 'ممنوع', 'خطرناک', 'آرام'], 'مسئول'),
  ],
);
