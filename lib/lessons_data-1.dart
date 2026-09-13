import 'models.dart';

// ==========================================================
// LESSON 1: To Be: am / is / are
// ==========================================================
final lesson1 = Lesson(
  id: 1,
  title: 'To Be: am / is / are',
  subtitle: 'فعل to be: am, is, are',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری فعل to be برای معرفی افراد، گفتن سن، شغل، ملیت و حالت‌ها.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I از am، برای He/She/It از is و برای You/We/They از are استفاده می‌کنیم.\n'
      '۲. منفی با افزودن not بعد از فعل to be ساخته می‌شود: am not, is not, are not.\n'
      '۳. برای سؤال، فعل to be به اول جمله منتقل می‌شود: Am/Is/Are + subject + ...?\n'
      '۴. شکل کوتاه: I\'m, you\'re, he\'s, she\'s, we\'re, they\'re.',
  formula: 'I + am + ...\nYou/We/They + are + ...\nHe/She/It + is + ...',
  examples: const [
    'I am Ahmad. — من احمد هستم.',
    'She is a student. — او یک دانش‌آموز است.',
    'They are happy. — آن‌ها خوشحال هستند.',
  ],
  negativeExamples: const [
    'I am not tired. — من خسته نیستم.',
    'He is not a teacher. — او معلم نیست.',
  ],
  questionExamples: const [
    'Are you a student? — آیا تو دانش‌آموز هستی؟',
    'Is she happy? — آیا او خوشحال است؟',
  ],
  questions: const [
    Question('I ___ a doctor.', ['am', 'is', 'are', 'be'], 'am'),
    Question('She ___ from Iran.', ['am', 'is', 'are', 'be'], 'is'),
    Question('We ___ friends.', ['am', 'is', 'are', 'be'], 'are'),
    Question('He ___ not busy today.', ['am', 'is', 'are', 'do'], 'is'),
    Question('___ they students?', ['Am', 'Is', 'Are', 'Do'], 'Are'),
    Question('Choose the correct sentence.', ['She am happy.', 'She are happy.', 'She is happy.', 'She be happy.'], 'She is happy.'),
  ],
);

// ==========================================================
// LESSON 2: Subject & Object Pronouns
// ==========================================================
final lesson2 = Lesson(
  id: 2,
  title: 'Subject & Object Pronouns',
  subtitle: 'ضمایر فاعلی و مفعولی',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری ضمیرهای فاعلی و مفعولی برای جلوگیری از تکرار اسم‌ها.\n\n'
      '📌 نکات مهم\n'
      '۱. ضمیر فاعلی قبل از فعل می‌آید: I, you, he, she, it, we, they.\n'
      '۲. ضمیر مفعولی بعد از فعل یا حرف اضافه می‌آید: me, you, him, her, it, us, them.\n'
      '۳. هرگز دو ضمیر فاعلی و مفعولی رو جای هم استفاده نکن؛ "I like he" غلط است، درستش "I like him" است.',
  formula: 'Subject: I, you, he, she, it, we, they\nObject: me, you, him, her, it, us, them',
  examples: const [
    'I like him. — من او را دوست دارم.',
    'She helps me. — او به من کمک می‌کند.',
    'We know them. — ما آن‌ها را می‌شناسیم.',
  ],
  negativeExamples: const [
    'I do not know him. — من او را نمی‌شناسم.',
  ],
  questionExamples: const [
    'Do you know her? — آیا او را می‌شناسی؟',
  ],
  questions: const [
    Question('I like ___ (she).', ['she', 'her', 'hers', 'herself'], 'her'),
    Question('___ (he) is my friend.', ['Him', 'His', 'He', 'Her'], 'He'),
    Question('Give it to ___ (they).', ['they', 'them', 'their', 'theirs'], 'them'),
    Question('___ (we) are late.', ['Us', 'We', 'Our', 'Ours'], 'We'),
    Question('She called ___ (I) yesterday.', ['I', 'me', 'my', 'mine'], 'me'),
    Question('Choose the correct sentence.', ['Him likes she.', 'He likes her.', 'He like her.', 'Him like she.'], 'He likes her.'),
  ],
);

// ==========================================================
// LESSON 3: Possessive Adjectives
// ==========================================================
final lesson3 = Lesson(
  id: 3,
  title: 'Possessive Adjectives',
  subtitle: 'صفت‌های ملکی: my, your, his...',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری my, your, his, her, its, our, their برای نشان دادن مالکیت.\n\n'
      '📌 نکات مهم\n'
      '۱. صفت ملکی همیشه قبل از اسم می‌آید: my book, her bag.\n'
      '۲. صفت ملکی هرگز به تنهایی نمی‌آید؛ باید حتماً یک اسم بعدش باشد.\n'
      '۳. its برای اشیا و حیوانات، his/her برای انسان استفاده می‌شود.',
  formula:
      'Possessive adjective + noun\n'
      'my + book\nyour + phone\nhis + car\nher + bag\nour + house\ntheir + school',
  examples: const [
    'This is my phone. — این گوشی من است.',
    'Her name is Sara. — اسم او سارا است.',
    'Their house is big. — خانه آن‌ها بزرگ است.',
  ],
  negativeExamples: const [
    'This is not my bag. — این کیف من نیست.',
  ],
  questionExamples: const [
    'Is this your phone? — آیا این گوشی تو است؟',
  ],
  questions: const [
    Question('This is ___ (I) book.', ['I', 'me', 'my', 'mine'], 'my'),
    Question('___ (she) car is red.', ['She', 'Her', 'Hers', 'He'], 'Her'),
    Question('That is ___ (they) house.', ['them', 'their', 'theirs', 'they'], 'their'),
    Question('The dog wagged ___ (it) tail.', ['it', 'its', 'it\'s', 'itself'], 'its'),
    Question('Choose the correct sentence.', ['This is her book.', 'This is she book.', 'This is hers book.', 'This is herself book.'], 'This is her book.'),
    Question('___ (we) teacher is kind.', ['Us', 'Our', 'Ours', 'We'], 'Our'),
  ],
);

// ==========================================================
// LESSON 4: A / An / The
// ==========================================================
final lesson4 = Lesson(
  id: 4,
  title: 'A / An / The',
  subtitle: 'حروف تعریف a, an, the',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری کاربرد حروف تعریف برای اسم‌های مفرد و مشخص.\n\n'
      '📌 نکات مهم\n'
      '۱. قبل از صدای صامت از a استفاده می‌کنیم: a car.\n'
      '۲. قبل از صدای مصوت از an استفاده می‌کنیم: an apple.\n'
      '۳. برای چیزی که مشخص و شناخته‌شده است از the استفاده می‌کنیم.',
  formula: 'a + consonant sound\nan + vowel sound\nthe + specific noun',
  examples: const [
    'I have a car. — من یک ماشین دارم.',
    'She is an engineer. — او یک مهندس است.',
    'The car is new. — آن ماشین جدید است.',
  ],
  negativeExamples: const [
    'I do not have a car. — من ماشین ندارم.',
  ],
  questionExamples: const [
    'Do you have a car? — آیا ماشین داری؟',
  ],
  questions: const [
    Question('I have ___ orange.', ['a', 'an', 'the', '—'], 'an'),
    Question('She is ___ university student.', ['a', 'an', 'the', '—'], 'a'),
    Question('___ sun is bright today.', ['A', 'An', 'The', '—'], 'The'),
    Question('He is ___ honest man.', ['a', 'an', 'the', '—'], 'an'),
    Question('I saw ___ elephant at the zoo.', ['a', 'an', 'the', '—'], 'an'),
    Question('Choose the correct sentence.', ['I have a apple.', 'I have an apple.', 'I have the apple a.', 'I have apple a.'], 'I have an apple.'),
  ],
);

// ==========================================================
// LESSON 5: Plural Nouns
// ==========================================================
final lesson5 = Lesson(
  id: 5,
  title: 'Plural Nouns',
  subtitle: 'اسم‌های جمع',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری ساخت اسم‌های جمع در انگلیسی.\n\n'
      '📌 نکات مهم\n'
      '۱. بیشتر اسم‌ها با افزودن s جمع می‌شوند: book → books.\n'
      '۲. اسم‌های ختم به s, x, ch, sh با es جمع می‌شوند: box → boxes.\n'
      '۳. برخی اسم‌ها بی‌قاعده هستند: child → children, man → men.',
  formula: 'Most nouns: noun + s\nbox → boxes\ncity → cities\nchild → children',
  examples: const [
    'I have two books. — من دو کتاب دارم.',
    'There are three cars. — سه ماشین وجود دارد.',
  ],
  negativeExamples: const [
    'I do not have any books. — من هیچ کتابی ندارم.',
  ],
  questionExamples: const [
    'How many books do you have? — چند کتاب داری؟',
  ],
  questions: const [
    Question('Plural of "box" is ___.', ['boxs', 'boxes', 'boxies', 'box'], 'boxes'),
    Question('Plural of "child" is ___.', ['childs', 'childes', 'children', 'childrens'], 'children'),
    Question('Plural of "city" is ___.', ['citys', 'cities', 'citties', 'city'], 'cities'),
    Question('I have three ___ (dog).', ['dog', 'dogs', 'doges', 'doges'], 'dogs'),
    Question('Plural of "man" is ___.', ['mans', 'men', 'mens', 'manes'], 'men'),
    Question('Choose the correct sentence.', ['There are two mans.', 'There are two men.', 'There are two mens.', 'There are two man.'], 'There are two men.'),
  ],
);

// ==========================================================
// LESSON 6: This / That / These / Those
// ==========================================================
final lesson6 = Lesson(
  id: 6,
  title: 'This / That / These / Those',
  subtitle: 'اشاره: this, that, these, those',
  explanation:
      '🎯 هدف درس\n'
      'اشاره کردن به افراد و اشیای نزدیک و دور، مفرد و جمع.\n\n'
      '📌 نکات مهم\n'
      '۱. this و that برای مفرد، these و those برای جمع استفاده می‌شوند.\n'
      '۲. this/these برای چیز نزدیک، that/those برای چیز دور استفاده می‌شوند.',
  formula: 'This + singular\nThat + singular\nThese + plural\nThose + plural',
  examples: const [
    'This is my phone. — این گوشی من است.',
    'That is your car. — آن ماشین تو است.',
    'These are my books. — این‌ها کتاب‌های من هستند.',
    'Those are expensive. — آن‌ها گران هستند.',
  ],
  negativeExamples: const [
    'This is not my phone. — این گوشی من نیست.',
  ],
  questionExamples: const [
    'Is this your bag? — آیا این کیف تو است؟',
  ],
  questions: const [
    Question('___ is my pen. (near, singular)', ['This', 'That', 'These', 'Those'], 'This'),
    Question('___ are my shoes. (near, plural)', ['This', 'That', 'These', 'Those'], 'These'),
    Question('___ is your house over there. (far, singular)', ['This', 'That', 'These', 'Those'], 'That'),
    Question('___ are nice flowers over there. (far, plural)', ['This', 'That', 'These', 'Those'], 'Those'),
    Question('Choose the correct sentence.', ['This are my books.', 'These is my books.', 'These are my books.', 'That are my books.'], 'These are my books.'),
    Question('Is ___ your bag? (near, singular)', ['this', 'these', 'those', 'that'], 'this'),
  ],
);

// ==========================================================
// LESSON 7: There is / There are
// ==========================================================
final lesson7 = Lesson(
  id: 7,
  title: 'There is / There are',
  subtitle: 'وجود داشتن: there is/are',
  explanation:
      '🎯 هدف درس\n'
      'گفتن اینکه چیزی یا کسی در یک مکان وجود دارد.\n\n'
      '📌 نکات مهم\n'
      '۱. there is برای اسم مفرد، there are برای اسم جمع استفاده می‌شود.\n'
      '۲. منفی: there is not / there are not (there isn\'t / there aren\'t).\n'
      '۳. سؤال با جابجایی is/are به اول جمله ساخته می‌شود: Is there...? / Are there...?',
  formula: 'There is + singular noun\nThere are + plural noun',
  examples: const [
    'There is a bed in my room. — یک تخت در اتاق من وجود دارد.',
    'There are two chairs. — دو صندلی وجود دارد.',
  ],
  negativeExamples: const [
    'There is not a TV here. — اینجا تلویزیون وجود ندارد.',
  ],
  questionExamples: const [
    'Is there a bathroom? — آیا حمام وجود دارد؟',
    'Are there any chairs? — آیا صندلی‌ای وجود دارد؟',
  ],
  questions: const [
    Question('___ a book on the table.', ['There is', 'There are', 'There am', 'There be'], 'There is'),
    Question('___ three windows in this room.', ['There is', 'There are', 'There am', 'There be'], 'There are'),
    Question('___ any milk in the fridge? (singular/uncountable)', ['Is there', 'Are there', 'Do there', 'Does there'], 'Is there'),
    Question('___ not any students here.', ['There is', 'There are', 'There am', 'There be'], 'There are'),
    Question('Choose the correct sentence.', ['There is two cats.', 'There are two cats.', 'There a two cats.', 'There am two cats.'], 'There are two cats.'),
    Question('___ a park near your house?', ['Is there', 'Are there', 'Has there', 'Do there'], 'Is there'),
  ],
);

// ==========================================================
// LESSON 8: Present Simple - Affirmative
// ==========================================================
final lesson8 = Lesson(
  id: 8,
  title: 'Present Simple - Affirmative',
  subtitle: 'حال ساده - مثبت',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره عادت‌ها، برنامه‌های معمول و واقعیت‌ها.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/You/We/They فعل بدون تغییر می‌آید.\n'
      '۲. برای He/She/It به فعل s یا es اضافه می‌شود: works, watches.\n'
      '۳. افعالی که به y ختم می‌شوند و قبلش صامت است، y به ies تبدیل می‌شود: study → studies.',
  formula: 'I/You/We/They + verb\nHe/She/It + verb + s/es',
  examples: const [
    'I work every day. — من هر روز کار می‌کنم.',
    'He works in a shop. — او در یک مغازه کار می‌کند.',
    'She likes programming. — او برنامه‌نویسی را دوست دارد.',
  ],
  negativeExamples: const [
    'I do not work on Friday. — من جمعه کار نمی‌کنم.',
    'He does not work here. — او اینجا کار نمی‌کند.',
  ],
  questionExamples: const [
    'Do you work every day? — آیا هر روز کار می‌کنی؟',
    'Does he work here? — آیا او اینجا کار می‌کند؟',
  ],
  questions: const [
    Question('She ___ (like) tea.', ['like', 'likes', 'liking', 'liked'], 'likes'),
    Question('I ___ (work) every morning.', ['work', 'works', 'working', 'worked'], 'work'),
    Question('He ___ (study) English.', ['study', 'studys', 'studies', 'studying'], 'studies'),
    Question('They ___ (play) football on Fridays.', ['play', 'plays', 'played', 'playing'], 'play'),
    Question('It ___ (rain) a lot in winter.', ['rain', 'rains', 'raining', 'rained'], 'rains'),
    Question('Choose the correct sentence.', ['She work here.', 'She works here.', 'She working here.', 'She to work here.'], 'She works here.'),
  ],
);

// ==========================================================
// LESSON 9: Present Simple - Negative
// ==========================================================
final lesson9 = Lesson(
  id: 9,
  title: 'Present Simple - Negative',
  subtitle: 'حال ساده - منفی',
  explanation:
      '🎯 هدف درس\n'
      'ساخت جمله‌های منفی درباره عادت‌ها و کارهای معمول.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/You/We/They از do not (don\'t) قبل از فعل ساده استفاده می‌کنیم.\n'
      '۲. برای He/She/It از does not (doesn\'t) استفاده می‌کنیم و فعل s نمی‌گیرد.',
  formula: 'I/You/We/They + do not + verb\nHe/She/It + does not + verb',
  examples: const [
    'I do not watch TV every day. — من هر روز تلویزیون تماشا نمی‌کنم.',
    'She does not like coffee. — او قهوه دوست ندارد.',
  ],
  negativeExamples: const [
    'We do not live here. — ما اینجا زندگی نمی‌کنیم.',
  ],
  questionExamples: const [
    'Do you not like football? — فوتبال دوست نداری؟',
  ],
  questions: const [
    Question('She ___ (not/like) fish.', ['do not like', 'does not like', 'does not likes', 'not likes'], 'does not like'),
    Question('I ___ (not/play) chess.', ['do not play', 'does not play', 'do not plays', 'not play'], 'do not play'),
    Question('He ___ (not/work) on Sundays.', ['do not work', 'does not work', 'does not works', 'not works'], 'does not work'),
    Question('They ___ (not/live) in Tehran.', ['do not live', 'does not live', 'do not lives', 'not live'], 'do not live'),
    Question('Choose the correct sentence.', ['She don\'t like tea.', 'She doesn\'t like tea.', 'She not like tea.', 'She doesn\'t likes tea.'], 'She doesn\'t like tea.'),
    Question('We ___ (not/have) class today.', ['do not have', 'does not have', 'do not has', 'not have'], 'do not have'),
  ],
);

// ==========================================================
// LESSON 10: Do / Does Questions
// ==========================================================
final lesson10 = Lesson(
  id: 10,
  title: 'Do / Does Questions',
  subtitle: 'سؤالات بله/خیر با do/does',
  explanation:
      '🎯 هدف درس\n'
      'ساخت سؤال‌های بله/خیر در زمان حال ساده.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/You/We/They از Do در اول جمله استفاده می‌کنیم.\n'
      '۲. برای He/She/It از Does استفاده می‌کنیم و فعل اصلی بدون s می‌آید.\n'
      '۳. جواب کوتاه: Yes, I do. / No, he doesn\'t.',
  formula: 'Do + I/you/we/they + verb?\nDoes + he/she/it + verb?',
  examples: const [
    'Do you speak English? — آیا انگلیسی صحبت می‌کنی؟',
    'Does she work here? — آیا او اینجا کار می‌کند؟',
  ],
  negativeExamples: const [
    'I do not speak French. — من فرانسوی صحبت نمی‌کنم.',
  ],
  questionExamples: const [
    'Do we need this? — آیا ما به این نیاز داریم؟',
    'Does he know you? — آیا او تو را می‌شناسد؟',
  ],
  questions: const [
    Question('___ you like pizza?', ['Do', 'Does', 'Are', 'Is'], 'Do'),
    Question('___ she speak Spanish?', ['Do', 'Does', 'Is', 'Are'], 'Does'),
    Question('___ they live in London?', ['Do', 'Does', 'Is', 'Are'], 'Do'),
    Question('___ he play the piano?', ['Do', 'Does', 'Is', 'Are'], 'Does'),
    Question('Choose the correct question.', ['Does you work here?', 'Do you work here?', 'Do you works here?', 'Is you work here?'], 'Do you work here?'),
    Question('Short answer: "Does she like tea?" → Yes, she ___.', ['do', 'does', 'is', 'has'], 'does'),
  ],
);
// ==========================================================
// LESSON 11: Wh- Questions
// ==========================================================
final lesson11 = Lesson(
  id: 11,
  title: 'Wh- Questions',
  subtitle: 'سؤالات با What, Where, When...',
  explanation:
      '🎯 هدف درس\n'
      'پرسیدن اطلاعات با What, Where, When, Who, Why, How.\n\n'
      '📌 نکات مهم\n'
      '۱. ترتیب جمله: Wh-word + do/does + subject + verb?\n'
      '۲. What برای چیز، Where برای مکان، When برای زمان، Who برای شخص، Why برای دلیل، How برای روش استفاده می‌شود.',
  formula: 'Wh-word + do/does + subject + verb?',
  examples: const [
    'What do you do? — چه کار می‌کنی؟',
    'Where do you live? — کجا زندگی می‌کنی؟',
    'Why do you study English? — چرا انگلیسی می‌خوانی؟',
  ],
  negativeExamples: const [
    'I do not know where he lives. — نمی‌دانم او کجا زندگی می‌کند.',
  ],
  questionExamples: const [
    'What do you like? — چه چیزی دوست داری؟',
    'When do you work? — چه زمانی کار می‌کنی؟',
  ],
  questions: const [
    Question('___ do you live?', ['What', 'Where', 'Who', 'Why'], 'Where'),
    Question('___ is your name?', ['What', 'Where', 'When', 'Who'], 'What'),
    Question('___ do you go to school? — Because I want to learn.', ['What', 'When', 'Why', 'Who'], 'Why'),
    Question('___ does the class start?', ['What', 'When', 'Who', 'Why'], 'When'),
    Question('___ is that man? — He is my teacher.', ['What', 'Where', 'Who', 'How'], 'Who'),
    Question('Choose the correct question.', ['Where you live?', 'Where do you live?', 'Where does you live?', 'Where you do live?'], 'Where do you live?'),
  ],
);

// ==========================================================
// LESSON 12: Adverbs of Frequency
// ==========================================================
final lesson12 = Lesson(
  id: 12,
  title: 'Adverbs of Frequency',
  subtitle: 'قیدهای تکرار',
  explanation:
      '🎯 هدف درس\n'
      'گفتن اینکه یک کار با چه میزان تکراری انجام می‌شود.\n\n'
      '📌 نکات مهم\n'
      '۱. قید تکرار معمولاً بین فاعل و فعل اصلی می‌آید: I always study.\n'
      '۲. با فعل to be، قید تکرار بعد از آن می‌آید: He is always late.',
  formula: 'Subject + frequency adverb + main verb\nalways / usually / often / sometimes / rarely / never',
  examples: const [
    'I always study English. — من همیشه انگلیسی می‌خوانم.',
    'I usually work in the morning. — من معمولاً صبح کار می‌کنم.',
    'He never drinks coffee. — او هرگز قهوه نمی‌نوشد.',
  ],
  negativeExamples: const [
    'I do not usually watch TV. — من معمولاً تلویزیون تماشا نمی‌کنم.',
  ],
  questionExamples: const [
    'Do you often play football? — آیا اغلب فوتبال بازی می‌کنی؟',
  ],
  questions: const [
    Question('I ___ (always) drink tea in the morning.', ['I always drink', 'I drink always', 'always I drink', 'drink I always'], 'I always drink'),
    Question('She is ___ (never) late.', ['never is', 'is never', 'is not never', 'not is never'], 'is never'),
    Question('He ___ eats fast food. (rarely)', ['rarely', 'is rarely', 'rarely is', 'do rarely'], 'rarely'),
    Question('Choose the correct sentence.', ['I usually am tired.', 'I am usually tired.', 'Usually I am tired am.', 'I am tired usually am.'], 'I am usually tired.'),
    Question('They ___ visit their grandparents. (often)', ['often', 'are often', 'often are', 'do often'], 'often'),
    Question('Put in order: always / I / breakfast / eat', ['I eat always breakfast', 'Always I eat breakfast', 'I always eat breakfast', 'Eat I always breakfast'], 'I always eat breakfast'),
  ],
);

// ==========================================================
// LESSON 13: How Often
// ==========================================================
final lesson13 = Lesson(
  id: 13,
  title: 'How Often',
  subtitle: 'پرسیدن تعداد دفعات',
  explanation:
      '🎯 هدف درس\n'
      'پرسیدن و جواب دادن درباره تعداد دفعات انجام یک کار.\n\n'
      '📌 نکات مهم\n'
      '۱. ساختار سؤال: How often + do/does + subject + verb?\n'
      '۲. جواب معمولاً با یک قید تکرار یا عبارتی مثل "three times a week" داده می‌شود.',
  formula: 'How often + do/does + subject + verb?',
  examples: const [
    'I exercise three times a week. — من هفته‌ای سه بار ورزش می‌کنم.',
    'I study English every day. — من هر روز انگلیسی می‌خوانم.',
  ],
  negativeExamples: const [
    'I do not exercise often. — من زیاد ورزش نمی‌کنم.',
  ],
  questionExamples: const [
    'How often do you study English? — هر چند وقت یک‌بار انگلیسی می‌خوانی؟',
  ],
  questions: const [
    Question('How often ___ you go to the gym?', ['do', 'does', 'are', 'is'], 'do'),
    Question('How often ___ she call her mother?', ['do', 'does', 'is', 'are'], 'does'),
    Question('Answer: "How often do you read?" → I read ___.', ['every day', 'yesterday', 'tomorrow', 'now'], 'every day'),
    Question('Choose the correct question.', ['How often you exercise?', 'How often do you exercise?', 'How often does you exercise?', 'How often you do exercise?'], 'How often do you exercise?'),
    Question('He goes swimming ___ a week. (two times)', ['two times', 'two time', 'twice times', 'two-time'], 'two times'),
    Question('How ___ do they meet?', ['much', 'many', 'often', 'long'], 'often'),
  ],
);

// ==========================================================
// LESSON 14: Present Simple Review
// ==========================================================
final lesson14 = Lesson(
  id: 14,
  title: 'Present Simple Review',
  subtitle: 'مرور حال ساده',
  explanation:
      '🎯 هدف درس\n'
      'تسلط کامل بر حال ساده در جمله مثبت، منفی و سوالی.\n\n'
      '📌 نکات مهم\n'
      '۱. مثبت: Subject + verb(+s/es).\n'
      '۲. منفی: Subject + do/does not + verb.\n'
      '۳. سؤالی: Do/Does + subject + verb?',
  formula:
      'Positive: Subject + verb\nNegative: Subject + do/does not + verb\nQuestion: Do/Does + subject + verb?',
  examples: const [
    'I work and study every day. — من هر روز کار و مطالعه می‌کنم.',
    'She studies English every morning. — او هر صبح انگلیسی می‌خواند.',
  ],
  negativeExamples: const [
    'I do not work on Fridays. — من جمعه‌ها کار نمی‌کنم.',
  ],
  questionExamples: const [
    'Do you study English every day? — آیا هر روز انگلیسی می‌خوانی؟',
  ],
  questions: const [
    Question('He ___ (not/go) to school on Fridays.', ['do not go', 'does not go', 'not goes', 'does not goes'], 'does not go'),
    Question('___ they speak French? — No, they don\'t.', ['Do', 'Does', 'Are', 'Is'], 'Do'),
    Question('She ___ (watch) TV every night.', ['watch', 'watches', 'watching', 'watched'], 'watches'),
    Question('Choose the correct sentence.', ['She don\'t study hard.', 'She doesn\'t studies hard.', 'She doesn\'t study hard.', 'She not study hard.'], 'She doesn\'t study hard.'),
    Question('___ does he do on weekends?', ['What', 'Who', 'Why', 'When'], 'What'),
    Question('We ___ (not/like) loud music.', ['do not like', 'does not like', 'not like', 'do not likes'], 'do not like'),
  ],
);

// ==========================================================
// LESSON 15: Present Continuous
// ==========================================================
final lesson15 = Lesson(
  id: 15,
  title: 'Present Continuous',
  subtitle: 'حال استمراری',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره کاری که همین الان یا در یک بازه موقت در حال انجام است.\n\n'
      '📌 نکات مهم\n'
      '۱. ساختار: Subject + am/is/are + verb-ing.\n'
      '۲. برای منفی، not بعد از am/is/are می‌آید.\n'
      '۳. برای سؤال، am/is/are به اول جمله می‌آید.',
  formula: 'Subject + am/is/are + verb-ing',
  examples: const [
    'I am studying English. — من دارم انگلیسی می‌خوانم.',
    'She is working. — او در حال کار کردن است.',
    'They are playing football. — آن‌ها در حال فوتبال بازی کردن هستند.',
  ],
  negativeExamples: const [
    'I am not sleeping. — من در حال خوابیدن نیستم.',
  ],
  questionExamples: const [
    'Are you studying? — آیا داری مطالعه می‌کنی؟',
  ],
  questions: const [
    Question('She ___ (write) a letter now.', ['write', 'writes', 'is writing', 'was writing'], 'is writing'),
    Question('We ___ (not/watch) TV right now.', ['are not watching', 'is not watching', 'do not watch', 'not watching'], 'are not watching'),
    Question('___ he sleeping right now?', ['Do', 'Does', 'Is', 'Are'], 'Is'),
    Question('I ___ (read) a book at the moment.', ['read', 'reads', 'am reading', 'was reading'], 'am reading'),
    Question('Choose the correct sentence.', ['They is playing outside.', 'They are play outside.', 'They are playing outside.', 'They play are outside.'], 'They are playing outside.'),
    Question('What ___ you doing now?', ['do', 'does', 'are', 'is'], 'are'),
  ],
);

// ==========================================================
// LESSON 16: Present Simple vs Present Continuous
// ==========================================================
final lesson16 = Lesson(
  id: 16,
  title: 'Present Simple vs Present Continuous',
  subtitle: 'حال ساده در برابر حال استمراری',
  explanation:
      '🎯 هدف درس\n'
      'تشخیص تفاوت عادت‌ها با کارهایی که اکنون در حال انجام هستند.\n\n'
      '📌 نکات مهم\n'
      '۱. برای عادت و واقعیت ثابت از حال ساده استفاده می‌کنیم.\n'
      '۲. برای کاری که همین الان در حال وقوع است از حال استمراری استفاده می‌کنیم.\n'
      '۳. کلماتی مثل always/usually/every day → حال ساده؛ now/right now/at the moment → حال استمراری.',
  formula: 'Habit → Present Simple\nNow → Present Continuous',
  examples: const [
    'I work every day. — من هر روز کار می‌کنم.',
    'I am working now. — من الان در حال کار کردن هستم.',
  ],
  negativeExamples: const [
    'I do not work on Sundays. — من یکشنبه‌ها کار نمی‌کنم.',
  ],
  questionExamples: const [
    'Are you working now? — آیا الان در حال کار هستی؟',
  ],
  questions: const [
    Question('I usually ___ (walk) to school.', ['walk', 'walks', 'am walking', 'walking'], 'walk'),
    Question('Look! He ___ (run).', ['run', 'runs', 'is running', 'was running'], 'is running'),
    Question('She ___ (not/like) coffee. (general fact)', ['does not like', 'is not liking', 'do not like', 'not likes'], 'does not like'),
    Question('Right now, they ___ (study) for the exam.', ['study', 'studies', 'are studying', 'studied'], 'are studying'),
    Question('Choose the correct sentence for a habit.', ['She is going to work every day.', 'She go to work every day.', 'She goes to work every day.', 'She going to work every day.'], 'She goes to work every day.'),
    Question('Choose the correct sentence for "now".', ['He watches TV now.', 'He is watching TV now.', 'He watch TV now.', 'He was watch TV now.'], 'He is watching TV now.'),
  ],
);

// ==========================================================
// LESSON 17: Can / Cannot
// ==========================================================
final lesson17 = Lesson(
  id: 17,
  title: 'Can / Cannot',
  subtitle: 'توانایی: can, cannot',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره توانایی، امکان و ناتوانی.\n\n'
      '📌 نکات مهم\n'
      '۱. can برای همه‌ی فاعل‌ها یکسان است و بعدش فعل ساده می‌آید (بدون to).\n'
      '۲. منفی: cannot یا can\'t.\n'
      '۳. سؤال: Can + subject + verb?',
  formula: 'Subject + can + base verb\nSubject + cannot/can’t + base verb',
  examples: const [
    'I can speak English. — من می‌توانم انگلیسی صحبت کنم.',
    'I can program. — من می‌توانم برنامه‌نویسی کنم.',
  ],
  negativeExamples: const [
    'I cannot speak French. — من نمی‌توانم فرانسوی صحبت کنم.',
  ],
  questionExamples: const [
    'Can you swim? — آیا می‌توانی شنا کنی؟',
  ],
  questions: const [
    Question('She ___ speak three languages.', ['can', 'cans', 'can to', 'is can'], 'can'),
    Question('I ___ (not) drive a car.', ['can not', 'cannot', 'not can', 'do can not'], 'cannot'),
    Question('___ you play the guitar?', ['Do', 'Are', 'Can', 'Is'], 'Can'),
    Question('He can ___ (swim) very well.', ['swim', 'swims', 'to swim', 'swimming'], 'swim'),
    Question('Choose the correct sentence.', ['She cans cook.', 'She can cooks.', 'She can cook.', 'She can to cook.'], 'She can cook.'),
    Question('Negative short answer: "Can you fly?" → No, I ___.', ['can\'t', 'don\'t', 'am not', 'not'], 'can\'t'),
  ],
);

// ==========================================================
// LESSON 18: Can + Wh- Questions
// ==========================================================
final lesson18 = Lesson(
  id: 18,
  title: 'Can + Wh- Questions',
  subtitle: 'سؤال با can و کلمات پرسشی',
  explanation:
      '🎯 هدف درس\n'
      'پرسیدن درباره توانایی‌ها و مهارت‌ها با کلمات پرسشی.\n\n'
      '📌 نکات مهم\n'
      '۱. ترتیب جمله: Wh-word + can + subject + base verb?\n'
      '۲. بعد از can همیشه فعل ساده (بدون to و بدون s) می‌آید.',
  formula: 'Wh-word + can + subject + base verb?',
  examples: const [
    'I can build software. — من می‌توانم نرم‌افزار بسازم.',
    'She can speak three languages. — او می‌تواند سه زبان صحبت کند.',
  ],
  negativeExamples: const [
    'I cannot explain it. — من نمی‌توانم آن را توضیح بدهم.',
  ],
  questionExamples: const [
    'What can you do? — چه کاری می‌توانی انجام بدهی؟',
    'What can she build? — او چه چیزی می‌تواند بسازد؟',
  ],
  questions: const [
    Question('___ can you speak? — I can speak Persian and English.', ['What languages', 'Who', 'When', 'Why'], 'What languages'),
    Question('___ can help me with this? — Ali can.', ['What', 'Who', 'Where', 'When'], 'Who'),
    Question('Choose the correct question.', ['What you can do?', 'What can you do?', 'What can do you?', 'What do you can?'], 'What can you do?'),
    Question('___ can we meet? — At the library.', ['Where', 'Who', 'Why', 'What'], 'Where'),
    Question('How ___ you cook this dish?', ['can', 'cans', 'do can', 'is can'], 'can'),
    Question('___ can she finish the project? — By Friday.', ['When', 'Who', 'What', 'Where'], 'When'),
  ],
);

// ==========================================================
// LESSON 19: Past Simple - Regular Verbs
// ==========================================================
final lesson19 = Lesson(
  id: 19,
  title: 'Past Simple - Regular Verbs',
  subtitle: 'گذشته ساده - افعال باقاعده',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره کارهایی که در گذشته اتفاق افتاده‌اند.\n\n'
      '📌 نکات مهم\n'
      '۱. افعال باقاعده در گذشته با افزودن ed ساخته می‌شوند: work → worked.\n'
      '۲. اگر فعل به e ختم شود فقط d اضافه می‌شود: like → liked.\n'
      '۳. اگر فعل به یک صامت + y ختم شود، y به ied تبدیل می‌شود: study → studied.',
  formula: 'Subject + verb-ed',
  examples: const [
    'I worked yesterday. — من دیروز کار کردم.',
    'I watched a movie. — من یک فیلم تماشا کردم.',
    'She played football. — او فوتبال بازی کرد.',
  ],
  negativeExamples: const [
    'I did not work yesterday. — من دیروز کار نکردم.',
  ],
  questionExamples: const [
    'Did you work yesterday? — آیا دیروز کار کردی؟',
  ],
  questions: const [
    Question('I ___ (watch) a movie last night.', ['watch', 'watches', 'watched', 'watching'], 'watched'),
    Question('She ___ (study) hard for the exam.', ['study', 'studies', 'studied', 'studying'], 'studied'),
    Question('They ___ (play) tennis yesterday.', ['play', 'plays', 'played', 'playing'], 'played'),
    Question('He ___ (like) the new song.', ['like', 'likes', 'liked', 'liking'], 'liked'),
    Question('Choose the correct sentence.', ['I worked yesterday.', 'I work yesterday.', 'I working yesterday.', 'I works yesterday.'], 'I worked yesterday.'),
    Question('We ___ (clean) the house on Sunday.', ['clean', 'cleaned', 'cleans', 'cleaning'], 'cleaned'),
  ],
);

// ==========================================================
// LESSON 20: Past Simple - Irregular Verbs
// ==========================================================
final lesson20 = Lesson(
  id: 20,
  title: 'Past Simple - Irregular Verbs',
  subtitle: 'گذشته ساده - افعال بی‌قاعده',
  explanation:
      '🎯 هدف درس\n'
      'یادگیری افعال بی‌قاعده در گذشته.\n\n'
      '📌 نکات مهم\n'
      '۱. افعال بی‌قاعده قانون خاصی ندارند و باید حفظ شوند: go → went, see → saw, buy → bought.\n'
      '۲. این افعال هم مثل باقاعده‌ها در منفی و سؤال از did استفاده می‌کنند و خودشان به شکل ساده برمی‌گردند.',
  formula: 'Subject + irregular past verb',
  examples: const [
    'I went home. — من به خانه رفتم.',
    'She saw a movie. — او یک فیلم دید.',
    'We bought a new phone. — ما یک گوشی جدید خریدیم.',
  ],
  negativeExamples: const [
    'I did not go there. — من به آنجا نرفتم.',
  ],
  questionExamples: const [
    'Did you see him? — آیا او را دیدی؟',
  ],
  questions: const [
    Question('I ___ (go) to the market yesterday.', ['go', 'goes', 'went', 'going'], 'went'),
    Question('She ___ (see) a good movie last week.', ['see', 'sees', 'saw', 'seeing'], 'saw'),
    Question('They ___ (buy) a new car.', ['buy', 'buys', 'bought', 'buying'], 'bought'),
    Question('He ___ (eat) breakfast at 7 AM.', ['eat', 'eats', 'ate', 'eating'], 'ate'),
    Question('Negative: I ___ (not/go) to the party.', ['did not went', 'did not go', 'do not go', 'not went'], 'did not go'),
    Question('Choose the correct sentence.', ['She goed home.', 'She went home.', 'She go home.', 'She going home.'], 'She went home.'),
  ],
);
// ==========================================================
// LESSON 21: Did / Didn't
// ==========================================================
final lesson21 = Lesson(
  id: 21,
  title: 'Did / Didn’t',
  subtitle: 'سؤال و منفی گذشته با did',
  explanation:
      '🎯 هدف درس\n'
      'ساخت سؤال و جمله منفی در گذشته ساده.\n\n'
      '📌 نکات مهم\n'
      '۱. منفی: Subject + did not (didn\'t) + فعل ساده.\n'
      '۲. سؤال: Did + subject + فعل ساده؟\n'
      '۳. در منفی و سؤال، فعل هرگز به شکل گذشته نمی‌آید؛ did خودش نشانه‌ی گذشته است.',
  formula: 'Question: Did + subject + base verb?\nNegative: Subject + did not + base verb',
  examples: const [
    'I visited my friend. — من دوستم را ملاقات کردم.',
  ],
  negativeExamples: const [
    'I didn’t see him. — من او را ندیدم.',
    'She didn’t go to school. — او به مدرسه نرفت.',
  ],
  questionExamples: const [
    'Did you watch the movie? — آیا فیلم را تماشا کردی؟',
  ],
  questions: const [
    Question('___ you call her yesterday?', ['Do', 'Does', 'Did', 'Were'], 'Did'),
    Question('I ___ (not/see) that film.', ['did not saw', 'did not see', 'do not see', 'not saw'], 'did not see'),
    Question('She ___ (not/come) to the party.', ['did not came', 'did not come', 'does not come', 'not came'], 'did not come'),
    Question('Choose the correct question.', ['Did you went there?', 'Did you go there?', 'Did you goes there?', 'Do you went there?'], 'Did you go there?'),
    Question('They ___ (not/finish) their homework.', ['did not finished', 'did not finish', 'do not finish', 'not finish'], 'did not finish'),
    Question('Short answer: "Did he call you?" → No, he ___.', ['don\'t', 'didn\'t', 'doesn\'t', 'isn\'t'], 'didn\'t'),
  ],
);

// ==========================================================
// LESSON 22: Was / Were
// ==========================================================
final lesson22 = Lesson(
  id: 22,
  title: 'Was / Were',
  subtitle: 'گذشته‌ی فعل to be',
  explanation:
      '🎯 هدف درس\n'
      'استفاده از شکل گذشته فعل to be.\n\n'
      '📌 نکات مهم\n'
      '۱. برای I/He/She/It از was استفاده می‌کنیم.\n'
      '۲. برای You/We/They از were استفاده می‌کنیم.\n'
      '۳. منفی: was not (wasn\'t) / were not (weren\'t). سؤال: Was/Were + subject + ...؟',
  formula: 'I/He/She/It + was\nYou/We/They + were',
  examples: const [
    'I was tired. — من خسته بودم.',
    'They were happy. — آن‌ها خوشحال بودند.',
  ],
  negativeExamples: const [
    'I was not at home. — من در خانه نبودم.',
  ],
  questionExamples: const [
    'Were you tired? — آیا خسته بودی؟',
    'Was he at school? — آیا او در مدرسه بود؟',
  ],
  questions: const [
    Question('I ___ at home last night.', ['was', 'were', 'am', 'is'], 'was'),
    Question('They ___ at the party.', ['was', 'were', 'is', 'am'], 'were'),
    Question('___ she happy yesterday?', ['Was', 'Were', 'Is', 'Are'], 'Was'),
    Question('We ___ not ready.', ['was', 'were', 'is', 'are'], 'were'),
    Question('Choose the correct sentence.', ['You was late.', 'You were late.', 'You is late.', 'You are was late.'], 'You were late.'),
    Question('___ you at school yesterday?', ['Was', 'Were', 'Did', 'Do'], 'Were'),
  ],
);

// ==========================================================
// LESSON 23: Past Continuous
// ==========================================================
final lesson23 = Lesson(
  id: 23,
  title: 'Past Continuous',
  subtitle: 'گذشته استمراری',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره کاری که در یک زمان مشخص در گذشته در حال انجام بوده.\n\n'
      '📌 نکات مهم\n'
      '۱. ساختار: Subject + was/were + verb-ing.\n'
      '۲. معمولاً همراه با یک زمان مشخص یا رخداد دیگر استفاده می‌شود.',
  formula: 'Subject + was/were + verb-ing',
  examples: const [
    'I was studying. — من داشتم مطالعه می‌کردم.',
    'They were playing football. — آن‌ها داشتند فوتبال بازی می‌کردند.',
  ],
  negativeExamples: const [
    'I was not sleeping. — من در حال خوابیدن نبودم.',
  ],
  questionExamples: const [
    'What were you doing? — داشتی چه کار می‌کردی؟',
  ],
  questions: const [
    Question('At 8 PM, I ___ (watch) TV.', ['watch', 'watched', 'was watching', 'am watching'], 'was watching'),
    Question('They ___ (not/sleep) at midnight.', ['were not sleeping', 'was not sleeping', 'did not sleep', 'not sleeping'], 'were not sleeping'),
    Question('___ she reading at 9 AM?', ['Was', 'Were', 'Did', 'Is'], 'Was'),
    Question('We ___ (cook) dinner when you called.', ['cook', 'cooked', 'were cooking', 'are cooking'], 'were cooking'),
    Question('Choose the correct sentence.', ['He was working late.', 'He were working late.', 'He is working late was.', 'He working was late.'], 'He was working late.'),
    Question('What ___ you doing at 7 PM yesterday?', ['was', 'were', 'did', 'do'], 'were'),
  ],
);

// ==========================================================
// LESSON 24: Past Simple vs Past Continuous
// ==========================================================
final lesson24 = Lesson(
  id: 24,
  title: 'Past Simple vs Past Continuous',
  subtitle: 'گذشته ساده در برابر استمراری',
  explanation:
      '🎯 هدف درس\n'
      'تفاوت بین یک اتفاق کامل‌شده و کاری که در گذشته در حال انجام بوده.\n\n'
      '📌 نکات مهم\n'
      '۱. برای کار در حال انجام از گذشته استمراری و برای رخداد کوتاه‌تری که وسط آن اتفاق افتاده از گذشته ساده استفاده می‌کنیم.\n'
      '۲. الگوی رایج: Past Continuous + when + Past Simple.',
  formula: 'Past Continuous + when + Past Simple\nWhile + Past Continuous',
  examples: const [
    'I was studying when he called. — وقتی او زنگ زد، من داشتم درس می‌خواندم.',
    'I was working when it started raining. — وقتی باران شروع شد، من داشتم کار می‌کردم.',
  ],
  negativeExamples: const [
    'I was not sleeping when you called. — وقتی زنگ زدی من خواب نبودم.',
  ],
  questionExamples: const [
    'What were you doing when I called? — وقتی من زنگ زدم داشتی چه کار می‌کردی؟',
  ],
  questions: const [
    Question('I ___ (watch) TV when the phone rang.', ['watched', 'was watching', 'watch', 'am watching'], 'was watching'),
    Question('While she ___ (cook), the phone rang.', ['cooked', 'was cooking', 'cooks', 'cooking'], 'was cooking'),
    Question('When he arrived, we ___ (already/leave).', ['were leaving', 'left', 'leave', 'was leaving'], 'left'),
    Question('Choose the correct sentence.', ['I was reading when she came in.', 'I read when she was coming in.', 'I was reading when she was coming in.', 'I reading was when she came.'], 'I was reading when she came in.'),
    Question('They ___ (play) football when it started to rain.', ['played', 'were playing', 'play', 'plays'], 'were playing'),
    Question('___ were you doing when the accident happened?', ['What', 'When', 'Who', 'Why'], 'What'),
  ],
);

// ==========================================================
// LESSON 25: Going to
// ==========================================================
final lesson25 = Lesson(
  id: 25,
  title: 'Going to',
  subtitle: 'آینده با going to',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره برنامه‌ها و قصدهای آینده.\n\n'
      '📌 نکات مهم\n'
      '۱. ساختار: Subject + am/is/are + going to + فعل ساده.\n'
      '۲. برای تصمیم‌ها و برنامه‌ریزی‌های از قبل استفاده می‌شود.',
  formula: 'Subject + am/is/are + going to + base verb',
  examples: const [
    'I am going to study tonight. — من قصد دارم امشب مطالعه کنم.',
    'I am going to learn Python. — من قصد دارم پایتون یاد بگیرم.',
  ],
  negativeExamples: const [
    'I am not going to watch TV. — من قصد ندارم تلویزیون تماشا کنم.',
  ],
  questionExamples: const [
    'What are you going to do? — قصد داری چه کار کنی؟',
  ],
  questions: const [
    Question('She ___ going to visit her aunt.', ['am', 'is', 'are', 'be'], 'is'),
    Question('We ___ (not/going) to travel this year.', ['are not going', 'is not going', 'do not going', 'not going'], 'are not going'),
    Question('___ you going to call him?', ['Do', 'Does', 'Are', 'Is'], 'Are'),
    Question('They are going to ___ (buy) a new house.', ['buy', 'buys', 'buying', 'bought'], 'buy'),
    Question('Choose the correct sentence.', ['He going to work tomorrow.', 'He is going to work tomorrow.', 'He is going work tomorrow.', 'He go to work tomorrow.'], 'He is going to work tomorrow.'),
    Question('What ___ they going to do this weekend?', ['is', 'are', 'do', 'does'], 'are'),
  ],
);

// ==========================================================
// LESSON 26: Will
// ==========================================================
final lesson26 = Lesson(
  id: 26,
  title: 'Will',
  subtitle: 'آینده با will',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره آینده، تصمیم‌های لحظه‌ای، وعده‌ها و پیش‌بینی‌ها.\n\n'
      '📌 نکات مهم\n'
      '۱. will برای همه‌ی فاعل‌ها یکسان است و بعدش فعل ساده می‌آید.\n'
      '۲. منفی: will not (won\'t). سؤال: Will + subject + verb?',
  formula: 'Subject + will + base verb',
  examples: const [
    'I will help you. — من به تو کمک خواهم کرد.',
    'I will learn English. — من انگلیسی یاد خواهم گرفت.',
  ],
  negativeExamples: const [
    'I will not forget. — من فراموش نخواهم کرد.',
  ],
  questionExamples: const [
    'Will you help me? — آیا به من کمک می‌کنی؟',
  ],
  questions: const [
    Question('I think it ___ rain tomorrow.', ['will', 'is will', 'wills', 'am will'], 'will'),
    Question('She ___ (not/come) to the meeting.', ['will not come', 'will not comes', 'not will come', 'won\'t comes'], 'will not come'),
    Question('___ you help me with this?', ['Do', 'Are', 'Will', 'Is'], 'Will'),
    Question('Choose the correct sentence.', ['I will to call you.', 'I will call you.', 'I will calls you.', 'I am will call you.'], 'I will call you.'),
    Question('They ___ (arrive) tomorrow.', ['will arrive', 'will arrives', 'arrives', 'are arrive'], 'will arrive'),
    Question('Short answer: "Will he come?" → Yes, he ___.', ['will', 'is', 'does', 'won\'t'], 'will'),
  ],
);

// ==========================================================
// LESSON 27: Comparatives
// ==========================================================
final lesson27 = Lesson(
  id: 27,
  title: 'Comparatives',
  subtitle: 'صفت تفضیلی (مقایسه)',
  explanation:
      '🎯 هدف درس\n'
      'مقایسه دو شخص، شیء یا مکان.\n\n'
      '📌 نکات مهم\n'
      '۱. صفت کوتاه: صفت + er + than (faster than).\n'
      '۲. صفت بلند: more + صفت + than (more expensive than).\n'
      '۳. برخی صفت‌ها بی‌قاعده‌اند: good → better, bad → worse.',
  formula: 'Short adjective + er + than\nmore + long adjective + than',
  examples: const [
    'This car is faster than that car. — این ماشین از آن ماشین سریع‌تر است.',
    'English is easier than Chinese. — انگلیسی از چینی آسان‌تر است.',
    'This phone is more expensive. — این گوشی گران‌تر است.',
  ],
  negativeExamples: const [
    'This phone is not cheaper. — این گوشی ارزان‌تر نیست.',
  ],
  questionExamples: const [
    'Which one is better? — کدام بهتر است؟',
  ],
  questions: const [
    Question('This book is ___ (interesting) than that one.', ['interestinger', 'more interesting', 'most interesting', 'interesting'], 'more interesting'),
    Question('My car is ___ (fast) than yours.', ['fast', 'faster', 'fastest', 'more fast'], 'faster'),
    Question('This exercise is ___ (bad) than the last one.', ['bad', 'badder', 'worse', 'more bad'], 'worse'),
    Question('She is ___ (tall) than her brother.', ['tall', 'taller', 'tallest', 'more tall'], 'taller'),
    Question('Choose the correct sentence.', ['This is more better than that.', 'This is better than that.', 'This is gooder than that.', 'This is more good than that.'], 'This is better than that.'),
    Question('This city is ___ (big) than mine.', ['big', 'bigger', 'biggest', 'more big'], 'bigger'),
  ],
);

// ==========================================================
// LESSON 28: Superlatives
// ==========================================================
final lesson28 = Lesson(
  id: 28,
  title: 'Superlatives',
  subtitle: 'صفت عالی (برترین)',
  explanation:
      '🎯 هدف درس\n'
      'گفتن اینکه چیزی از میان چند چیز بهترین، بزرگ‌ترین یا مهم‌ترین است.\n\n'
      '📌 نکات مهم\n'
      '۱. صفت کوتاه: the + صفت + est (the fastest).\n'
      '۲. صفت بلند: the most + صفت (the most expensive).\n'
      '۳. حتماً قبل از صفت عالی از the استفاده کن.',
  formula: 'the + adjective-est\nthe most + long adjective',
  examples: const [
    'This is the best phone. — این بهترین گوشی است.',
    'He is the tallest student. — او قدبلندترین دانش‌آموز است.',
    'This is the most useful app. — این کاربردی‌ترین برنامه است.',
  ],
  negativeExamples: const [
    'This is not the best option. — این بهترین گزینه نیست.',
  ],
  questionExamples: const [
    'What is the best choice? — بهترین انتخاب چیست؟',
  ],
  questions: const [
    Question('This is ___ (interesting) book I have read.', ['the interestingest', 'the more interesting', 'the most interesting', 'interesting'], 'the most interesting'),
    Question('He is ___ (tall) boy in the class.', ['taller', 'the tallest', 'tallest', 'the taller'], 'the tallest'),
    Question('This is ___ (good) restaurant in town.', ['the goodest', 'the best', 'better', 'the better'], 'the best'),
    Question('That was ___ (bad) movie ever.', ['the worse', 'the worst', 'worse', 'badder'], 'the worst'),
    Question('Choose the correct sentence.', ['She is the most tall in class.', 'She is the tallest in class.', 'She is tallest in class.', 'She is more tallest in class.'], 'She is the tallest in class.'),
    Question('This is ___ (expensive) car in the shop.', ['more expensive', 'the most expensive', 'expensiver', 'the expensivest'], 'the most expensive'),
  ],
);

// ==========================================================
// LESSON 29: Must / Have to
// ==========================================================
final lesson29 = Lesson(
  id: 29,
  title: 'Must / Have to',
  subtitle: 'اجبار: must, have to',
  explanation:
      '🎯 هدف درس\n'
      'صحبت درباره اجبار، قوانین و کارهایی که باید انجام شوند.\n\n'
      '📌 نکات مهم\n'
      '۱. must برای همه‌ی فاعل‌ها یکسان است.\n'
      '۲. have to برای I/You/We/They و has to برای He/She/It استفاده می‌شود.\n'
      '۳. منفی have to (do not have to) به معنی "لازم نیست"، ولی must not به معنی "ممنوع است".',
  formula: 'Must + base verb\nHave to + base verb\nHe/She/It + has to + base verb',
  examples: const [
    'I must study. — من باید مطالعه کنم.',
    'I have to work today. — من باید امروز کار کنم.',
    'He has to go. — او باید برود.',
  ],
  negativeExamples: const [
    'You must not smoke. — تو نباید سیگار بکشی.',
    'I do not have to work tomorrow. — من مجبور نیستم فردا کار کنم.',
  ],
  questionExamples: const [
    'Do you have to work today? — آیا باید امروز کار کنی؟',
  ],
  questions: const [
    Question('She ___ to finish her homework.', ['must to', 'has', 'has to', 'have to'], 'has to'),
    Question('You ___ not park here. (forbidden)', ['do', 'must', 'have', 'are'], 'must'),
    Question('We ___ to wear a uniform at school.', ['must', 'has to', 'have to', 'having to'], 'have to'),
    Question('___ he have to work on Sundays?', ['Do', 'Does', 'Is', 'Must'], 'Does'),
    Question('Choose the correct sentence.', ['She must to go.', 'She must goes.', 'She must go.', 'She musts go.'], 'She must go.'),
    Question('I ___ (not/have to) wake up early tomorrow. (no obligation)', ['do not have to', 'must not', 'does not have to', 'not have to'], 'do not have to'),
  ],
);

// ==========================================================
// LESSON 30: Monthly Grammar Review
// ==========================================================
final lesson30 = Lesson(
  id: 30,
  title: 'Monthly Grammar Review',
  subtitle: 'مرور کلی گرامرهای ماه',
  explanation:
      '🎯 هدف درس\n'
      'ترکیب گرامرهای ماه اول و استفاده از آن‌ها در مکالمه واقعی.\n\n'
      '📌 نکات مهم\n'
      'این درس ترکیبی از حال ساده، حال استمراری، گذشته، آینده، سؤالات و منفی‌ها را در یک مکالمه به کار می‌گیرد تا مرور کاملی از ماه اول داشته باشی.',
  formula:
      'Present + Past + Future + Questions + Negatives\n'
      'ترکیب ساختارهای یادگرفته‌شده در یک مکالمه',
  examples: const [
    'I usually work in the morning, but today I am studying English. — من معمولاً صبح کار می‌کنم، اما امروز دارم انگلیسی می‌خوانم.',
    'Yesterday I worked, and tomorrow I am going to study. — دیروز کار کردم و فردا قصد دارم مطالعه کنم.',
    'I want to become a programmer because I like technology. — می‌خواهم برنامه‌نویس شوم چون فناوری را دوست دارم.',
  ],
  negativeExamples: const [
    'I do not want to stop learning English. — من نمی‌خواهم یادگیری انگلیسی را متوقف کنم.',
  ],
  questionExamples: const [
    'What are you going to do in the future? — در آینده قصد داری چه کار کنی؟',
    'Why do you want to learn English? — چرا می‌خواهی انگلیسی یاد بگیری؟',
  ],
  questions: const [
    Question('Yesterday, I ___ (go) to school, but today I ___ (stay) home.', ['went / stay', 'go / stayed', 'went / am staying', 'go / am staying'], 'went / am staying'),
    Question('She ___ (not/like) coffee, but she ___ (drink) tea now.', ['does not like / is drinking', 'did not like / drinks', 'is not liking / drink', 'do not like / drinking'], 'does not like / is drinking'),
    Question('Tomorrow, we ___ (visit) our grandparents.', ['visit', 'visited', 'are going to visit', 'were visiting'], 'are going to visit'),
    Question('Choose the correct sentence.', ['I am study English now.', 'I study English now.', 'I am studying English now.', 'I studying English now.'], 'I am studying English now.'),
    Question('___ did you go last night?', ['What', 'Where', 'Who', 'How'], 'Where'),
    Question('He ___ (finish) his homework before dinner yesterday.', ['finish', 'finishes', 'finished', 'is finishing'], 'finished'),
  ],
);

final List<Lesson> lessons = [
  lesson1, lesson2, lesson3, lesson4, lesson5,
  lesson6, lesson7, lesson8, lesson9, lesson10,
  lesson11, lesson12, lesson13, lesson14, lesson15,
  lesson16, lesson17, lesson18, lesson19, lesson20,
  lesson21, lesson22, lesson23, lesson24, lesson25,
  lesson26, lesson27, lesson28, lesson29, lesson30,
];
