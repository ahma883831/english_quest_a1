import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// English Quest - Interactive World
/// این فایل یک محیط تعاملی برای هر ۳۰ درس می‌سازد.
/// هیچ عکس خارجی لازم نیست؛ محیط‌ها با Flutter و آیکون/اشکال ساخته می‌شوند.

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

const List<WorldScene> englishQuestWorlds = [
  WorldScene(
    id: 1,
    title: 'Kitchen',
    subtitle: 'آشپزخانه',
    emoji: '🍳',
    objects: [
      WorldHotspot(word: 'fridge', meaning: 'یخچال', emoji: '🧊', sentence: 'The food is in the fridge.'),
      WorldHotspot(word: 'stove', meaning: 'اجاق', emoji: '🔥', sentence: 'The stove is hot.'),
      WorldHotspot(word: 'pan', meaning: 'ماهیتابه', emoji: '🍳', sentence: 'The pan is on the stove.'),
      WorldHotspot(word: 'plate', meaning: 'بشقاب', emoji: '🍽️', sentence: 'The plate is on the table.'),
      WorldHotspot(word: 'cup', meaning: 'فنجان', emoji: '☕', sentence: 'The cup is clean.'),
      WorldHotspot(word: 'spoon', meaning: 'قاشق', emoji: '🥄', sentence: 'I need a spoon.'),
    ],
  ),
  WorldScene(
    id: 2,
    title: 'Bedroom',
    subtitle: 'اتاق خواب',
    emoji: '🛏️',
    objects: [
      WorldHotspot(word: 'bed', meaning: 'تخت', emoji: '🛏️', sentence: 'The bed is comfortable.'),
      WorldHotspot(word: 'pillow', meaning: 'بالش', emoji: '🛌', sentence: 'The pillow is soft.'),
      WorldHotspot(word: 'lamp', meaning: 'چراغ', emoji: '💡', sentence: 'The lamp is on.'),
      WorldHotspot(word: 'desk', meaning: 'میز تحریر', emoji: '🖥️', sentence: 'My computer is on the desk.'),
      WorldHotspot(word: 'closet', meaning: 'کمد', emoji: '🚪', sentence: 'My clothes are in the closet.'),
      WorldHotspot(word: 'window', meaning: 'پنجره', emoji: '🪟', sentence: 'The window is open.'),
    ],
  ),
  WorldScene(
    id: 3,
    title: 'Bathroom',
    subtitle: 'حمام',
    emoji: '🚿',
    objects: [
      WorldHotspot(word: 'shower', meaning: 'دوش', emoji: '🚿', sentence: 'The shower is clean.'),
      WorldHotspot(word: 'sink', meaning: 'روشویی', emoji: '🚰', sentence: 'Wash your hands in the sink.'),
      WorldHotspot(word: 'mirror', meaning: 'آینه', emoji: '🪞', sentence: 'I can see myself in the mirror.'),
      WorldHotspot(word: 'towel', meaning: 'حوله', emoji: '🧻', sentence: 'The towel is dry.'),
      WorldHotspot(word: 'soap', meaning: 'صابون', emoji: '🧼', sentence: 'The soap is next to the sink.'),
      WorldHotspot(word: 'toothbrush', meaning: 'مسواک', emoji: '🪥', sentence: 'I brush my teeth.'),
    ],
  ),
  WorldScene(
    id: 4,
    title: 'Living Room',
    subtitle: 'اتاق نشیمن',
    emoji: '🛋️',
    objects: [
      WorldHotspot(word: 'sofa', meaning: 'مبل', emoji: '🛋️', sentence: 'We sit on the sofa.'),
      WorldHotspot(word: 'television', meaning: 'تلویزیون', emoji: '📺', sentence: 'The television is on.'),
      WorldHotspot(word: 'table', meaning: 'میز', emoji: '🪑', sentence: 'The book is on the table.'),
      WorldHotspot(word: 'carpet', meaning: 'فرش', emoji: '🟫', sentence: 'The carpet is clean.'),
      WorldHotspot(word: 'clock', meaning: 'ساعت', emoji: '🕰️', sentence: 'The clock is on the wall.'),
      WorldHotspot(word: 'window', meaning: 'پنجره', emoji: '🪟', sentence: 'The window is large.'),
    ],
  ),
  WorldScene(
    id: 5,
    title: 'Garden & Yard',
    subtitle: 'حیاط خانه',
    emoji: '🌳',
    objects: [
      WorldHotspot(word: 'tree', meaning: 'درخت', emoji: '🌳', sentence: 'The tree is tall.'),
      WorldHotspot(word: 'flower', meaning: 'گل', emoji: '🌸', sentence: 'The flower is beautiful.'),
      WorldHotspot(word: 'grass', meaning: 'چمن', emoji: '🌱', sentence: 'The grass is green.'),
      WorldHotspot(word: 'gate', meaning: 'دروازه/در', emoji: '🚪', sentence: 'The gate is open.'),
      WorldHotspot(word: 'bench', meaning: 'نیمکت', emoji: '🪑', sentence: 'I sit on the bench.'),
      WorldHotspot(word: 'bird', meaning: 'پرنده', emoji: '🐦', sentence: 'The bird is in the tree.'),
    ],
  ),
  WorldScene(
    id: 6,
    title: 'City Street',
    subtitle: 'خیابان شهر',
    emoji: '🏙️',
    objects: [
      WorldHotspot(word: 'street', meaning: 'خیابان', emoji: '🛣️', sentence: 'The street is busy.'),
      WorldHotspot(word: 'car', meaning: 'ماشین', emoji: '🚗', sentence: 'The car is red.'),
      WorldHotspot(word: 'bus', meaning: 'اتوبوس', emoji: '🚌', sentence: 'The bus is coming.'),
      WorldHotspot(word: 'traffic light', meaning: 'چراغ راهنمایی', emoji: '🚦', sentence: 'The traffic light is red.'),
      WorldHotspot(word: 'crosswalk', meaning: 'خط عابر', emoji: '🚸', sentence: 'Use the crosswalk.'),
      WorldHotspot(word: 'building', meaning: 'ساختمان', emoji: '🏢', sentence: 'That building is tall.'),
    ],
  ),
  WorldScene(
    id: 7,
    title: 'Bus & Metro Station',
    subtitle: 'ایستگاه اتوبوس و مترو',
    emoji: '🚇',
    objects: [
      WorldHotspot(word: 'station', meaning: 'ایستگاه', emoji: '🚉', sentence: 'The station is near here.'),
      WorldHotspot(word: 'ticket', meaning: 'بلیط', emoji: '🎫', sentence: 'I need a ticket.'),
      WorldHotspot(word: 'train', meaning: 'قطار', emoji: '🚆', sentence: 'The train is arriving.'),
      WorldHotspot(word: 'bus stop', meaning: 'ایستگاه اتوبوس', emoji: '🚌', sentence: 'The bus stop is over there.'),
      WorldHotspot(word: 'map', meaning: 'نقشه', emoji: '🗺️', sentence: 'Look at the map.'),
      WorldHotspot(word: 'platform', meaning: 'سکو', emoji: '🚶', sentence: 'Wait on the platform.'),
    ],
  ),
  WorldScene(
    id: 8,
    title: 'Airport',
    subtitle: 'فرودگاه',
    emoji: '✈️',
    objects: [
      WorldHotspot(word: 'airport', meaning: 'فرودگاه', emoji: '✈️', sentence: 'We are at the airport.'),
      WorldHotspot(word: 'passport', meaning: 'گذرنامه', emoji: '📕', sentence: 'Here is my passport.'),
      WorldHotspot(word: 'ticket', meaning: 'بلیط', emoji: '🎫', sentence: 'My ticket is ready.'),
      WorldHotspot(word: 'luggage', meaning: 'چمدان/بار', emoji: '🧳', sentence: 'My luggage is heavy.'),
      WorldHotspot(word: 'gate', meaning: 'گیت', emoji: '🚪', sentence: 'Gate five is open.'),
      WorldHotspot(word: 'plane', meaning: 'هواپیما', emoji: '✈️', sentence: 'The plane is ready.'),
    ],
  ),
  WorldScene(
    id: 9,
    title: 'Parking & Road',
    subtitle: 'پارکینگ و جاده',
    emoji: '🚗',
    objects: [
      WorldHotspot(word: 'parking lot', meaning: 'پارکینگ', emoji: '🅿️', sentence: 'The car is in the parking lot.'),
      WorldHotspot(word: 'road', meaning: 'جاده', emoji: '🛣️', sentence: 'The road is long.'),
      WorldHotspot(word: 'driver', meaning: 'راننده', emoji: '🧑‍✈️', sentence: 'The driver is careful.'),
      WorldHotspot(word: 'car', meaning: 'ماشین', emoji: '🚙', sentence: 'My car is outside.'),
      WorldHotspot(word: 'sign', meaning: 'تابلو', emoji: '🪧', sentence: 'Read the road sign.'),
      WorldHotspot(word: 'bridge', meaning: 'پل', emoji: '🌉', sentence: 'The bridge is over the river.'),
    ],
  ),
  WorldScene(
    id: 10,
    title: 'Train Station',
    subtitle: 'ایستگاه قطار',
    emoji: '🚆',
    objects: [
      WorldHotspot(word: 'train', meaning: 'قطار', emoji: '🚆', sentence: 'The train is fast.'),
      WorldHotspot(word: 'station', meaning: 'ایستگاه', emoji: '🚉', sentence: 'The station is crowded.'),
      WorldHotspot(word: 'passenger', meaning: 'مسافر', emoji: '🧳', sentence: 'The passenger has a ticket.'),
      WorldHotspot(word: 'platform', meaning: 'سکو', emoji: '🚶', sentence: 'The train is on platform two.'),
      WorldHotspot(word: 'schedule', meaning: 'برنامه حرکت', emoji: '📋', sentence: 'Check the train schedule.'),
      WorldHotspot(word: 'seat', meaning: 'صندلی', emoji: '💺', sentence: 'My seat is near the window.'),
    ],
  ),
  WorldScene(
    id: 11,
    title: 'Supermarket',
    subtitle: 'سوپرمارکت',
    emoji: '🛒',
    objects: [
      WorldHotspot(word: 'cart', meaning: 'سبد خرید', emoji: '🛒', sentence: 'Put it in the cart.'),
      WorldHotspot(word: 'milk', meaning: 'شیر', emoji: '🥛', sentence: 'I need some milk.'),
      WorldHotspot(word: 'bread', meaning: 'نان', emoji: '🍞', sentence: 'The bread is fresh.'),
      WorldHotspot(word: 'fruit', meaning: 'میوه', emoji: '🍎', sentence: 'I like fresh fruit.'),
      WorldHotspot(word: 'cashier', meaning: 'صندوقدار', emoji: '🧑‍💼', sentence: 'The cashier is friendly.'),
      WorldHotspot(word: 'price', meaning: 'قیمت', emoji: '🏷️', sentence: 'What is the price?'),
    ],
  ),
  WorldScene(
    id: 12,
    title: 'Restaurant',
    subtitle: 'رستوران',
    emoji: '🍽️',
    objects: [
      WorldHotspot(word: 'menu', meaning: 'منو', emoji: '📖', sentence: 'Can I see the menu?'),
      WorldHotspot(word: 'waiter', meaning: 'پیشخدمت', emoji: '🧑‍🍳', sentence: 'The waiter brings the food.'),
      WorldHotspot(word: 'table', meaning: 'میز', emoji: '🍽️', sentence: 'Our table is ready.'),
      WorldHotspot(word: 'food', meaning: 'غذا', emoji: '🍲', sentence: 'The food is delicious.'),
      WorldHotspot(word: 'water', meaning: 'آب', emoji: '💧', sentence: 'Can I have some water?'),
      WorldHotspot(word: 'bill', meaning: 'صورتحساب', emoji: '🧾', sentence: 'Can I have the bill?'),
    ],
  ),
  WorldScene(
    id: 13,
    title: 'Café',
    subtitle: 'کافه',
    emoji: '☕',
    objects: [
      WorldHotspot(word: 'coffee', meaning: 'قهوه', emoji: '☕', sentence: 'I would like coffee.'),
      WorldHotspot(word: 'tea', meaning: 'چای', emoji: '🍵', sentence: 'She likes tea.'),
      WorldHotspot(word: 'cake', meaning: 'کیک', emoji: '🍰', sentence: 'The cake is sweet.'),
      WorldHotspot(word: 'chair', meaning: 'صندلی', emoji: '🪑', sentence: 'Take a chair.'),
      WorldHotspot(word: 'cup', meaning: 'فنجان', emoji: '☕', sentence: 'My cup is hot.'),
      WorldHotspot(word: 'menu', meaning: 'منو', emoji: '📋', sentence: 'The menu is on the table.'),
    ],
  ),
  WorldScene(
    id: 14,
    title: 'Bakery',
    subtitle: 'نانوایی',
    emoji: '🥖',
    objects: [
      WorldHotspot(word: 'bread', meaning: 'نان', emoji: '🍞', sentence: 'The bread is fresh.'),
      WorldHotspot(word: 'baguette', meaning: 'نان باگت', emoji: '🥖', sentence: 'I want a baguette.'),
      WorldHotspot(word: 'cake', meaning: 'کیک', emoji: '🎂', sentence: 'This cake is beautiful.'),
      WorldHotspot(word: 'oven', meaning: 'فر', emoji: '🔥', sentence: 'The bread is in the oven.'),
      WorldHotspot(word: 'flour', meaning: 'آرد', emoji: '🌾', sentence: 'We need flour.'),
      WorldHotspot(word: 'shop', meaning: 'مغازه', emoji: '🏪', sentence: 'The bakery is a small shop.'),
    ],
  ),
  WorldScene(
    id: 15,
    title: 'Fruit & Vegetable Market',
    subtitle: 'بازار میوه و سبزی',
    emoji: '🍎',
    objects: [
      WorldHotspot(word: 'apple', meaning: 'سیب', emoji: '🍎', sentence: 'The apple is red.'),
      WorldHotspot(word: 'banana', meaning: 'موز', emoji: '🍌', sentence: 'I like bananas.'),
      WorldHotspot(word: 'tomato', meaning: 'گوجه', emoji: '🍅', sentence: 'The tomato is fresh.'),
      WorldHotspot(word: 'potato', meaning: 'سیب‌زمینی', emoji: '🥔', sentence: 'We need potatoes.'),
      WorldHotspot(word: 'carrot', meaning: 'هویج', emoji: '🥕', sentence: 'The carrot is orange.'),
      WorldHotspot(word: 'seller', meaning: 'فروشنده', emoji: '🧑‍🌾', sentence: 'The seller is helpful.'),
    ],
  ),
  WorldScene(
    id: 16,
    title: 'Farm & Countryside',
    subtitle: 'مزرعه و کوهپایه',
    emoji: '🐑',
    objects: [
      WorldHotspot(word: 'sheep', meaning: 'گوسفند', emoji: '🐑', sentence: 'The sheep are in the field.'),
      WorldHotspot(word: 'cow', meaning: 'گاو', emoji: '🐄', sentence: 'The cow is eating grass.'),
      WorldHotspot(word: 'farm', meaning: 'مزرعه', emoji: '🚜', sentence: 'My uncle has a farm.'),
      WorldHotspot(word: 'mountain', meaning: 'کوه', emoji: '⛰️', sentence: 'The mountain is high.'),
      WorldHotspot(word: 'field', meaning: 'زمین کشاورزی', emoji: '🌾', sentence: 'The field is green.'),
      WorldHotspot(word: 'tractor', meaning: 'تراکتور', emoji: '🚜', sentence: 'The tractor is working.'),
    ],
  ),
  WorldScene(
    id: 17,
    title: 'Forest',
    subtitle: 'جنگل',
    emoji: '🌲',
    objects: [
      WorldHotspot(word: 'tree', meaning: 'درخت', emoji: '🌲', sentence: 'The forest has many trees.'),
      WorldHotspot(word: 'river', meaning: 'رودخانه', emoji: '🏞️', sentence: 'The river is clean.'),
      WorldHotspot(word: 'fox', meaning: 'روباه', emoji: '🦊', sentence: 'The fox is in the forest.'),
      WorldHotspot(word: 'bear', meaning: 'خرس', emoji: '🐻', sentence: 'The bear is near the river.'),
      WorldHotspot(word: 'leaf', meaning: 'برگ', emoji: '🍂', sentence: 'The leaf is on the ground.'),
      WorldHotspot(word: 'path', meaning: 'مسیر', emoji: '🥾', sentence: 'Follow the forest path.'),
    ],
  ),
  WorldScene(
    id: 18,
    title: 'Beach',
    subtitle: 'ساحل دریا',
    emoji: '🏖️',
    objects: [
      WorldHotspot(word: 'sea', meaning: 'دریا', emoji: '🌊', sentence: 'The sea is blue.'),
      WorldHotspot(word: 'sand', meaning: 'شن', emoji: '🏖️', sentence: 'The sand is warm.'),
      WorldHotspot(word: 'shell', meaning: 'صدف', emoji: '🐚', sentence: 'I found a shell.'),
      WorldHotspot(word: 'sun', meaning: 'خورشید', emoji: '☀️', sentence: 'The sun is bright.'),
      WorldHotspot(word: 'boat', meaning: 'قایق', emoji: '⛵', sentence: 'The boat is on the sea.'),
      WorldHotspot(word: 'umbrella', meaning: 'چتر', emoji: '⛱️', sentence: 'The umbrella is on the beach.'),
    ],
  ),
  WorldScene(
    id: 19,
    title: 'Zoo',
    subtitle: 'باغ‌وحش',
    emoji: '🦁',
    objects: [
      WorldHotspot(word: 'lion', meaning: 'شیر', emoji: '🦁', sentence: 'The lion is strong.'),
      WorldHotspot(word: 'elephant', meaning: 'فیل', emoji: '🐘', sentence: 'The elephant is big.'),
      WorldHotspot(word: 'monkey', meaning: 'میمون', emoji: '🐒', sentence: 'The monkey can climb.'),
      WorldHotspot(word: 'giraffe', meaning: 'زرافه', emoji: '🦒', sentence: 'The giraffe is tall.'),
      WorldHotspot(word: 'cage', meaning: 'قفس', emoji: '🔒', sentence: 'The animal is in the cage.'),
      WorldHotspot(word: 'keeper', meaning: 'مراقب حیوانات', emoji: '🧑‍🌾', sentence: 'The keeper feeds the animals.'),
    ],
  ),
  WorldScene(
    id: 20,
    title: 'City Park',
    subtitle: 'پارک شهری',
    emoji: '🌳',
    objects: [
      WorldHotspot(word: 'park', meaning: 'پارک', emoji: '🌳', sentence: 'We walk in the park.'),
      WorldHotspot(word: 'playground', meaning: 'زمین بازی', emoji: '🛝', sentence: 'The children are at the playground.'),
      WorldHotspot(word: 'swing', meaning: 'تاب', emoji: '🎠', sentence: 'The child is on the swing.'),
      WorldHotspot(word: 'bicycle', meaning: 'دوچرخه', emoji: '🚲', sentence: 'I ride my bicycle.'),
      WorldHotspot(word: 'bench', meaning: 'نیمکت', emoji: '🪑', sentence: 'They sit on the bench.'),
      WorldHotspot(word: 'fountain', meaning: 'آبنما', emoji: '⛲', sentence: 'The fountain is beautiful.'),
    ],
  ),
  WorldScene(
    id: 21,
    title: 'Classroom',
    subtitle: 'کلاس درس',
    emoji: '🏫',
    objects: [
      WorldHotspot(word: 'teacher', meaning: 'معلم', emoji: '👨‍🏫', sentence: 'The teacher is speaking.'),
      WorldHotspot(word: 'student', meaning: 'دانش‌آموز', emoji: '🧑‍🎓', sentence: 'The student is reading.'),
      WorldHotspot(word: 'book', meaning: 'کتاب', emoji: '📖', sentence: 'Open your book.'),
      WorldHotspot(word: 'desk', meaning: 'میز', emoji: '🪑', sentence: 'The book is on the desk.'),
      WorldHotspot(word: 'board', meaning: 'تخته', emoji: '🧑‍🏫', sentence: 'Write on the board.'),
      WorldHotspot(word: 'pen', meaning: 'خودکار', emoji: '🖊️', sentence: 'I have a blue pen.'),
    ],
  ),
  WorldScene(
    id: 22,
    title: 'Library',
    subtitle: 'کتابخانه',
    emoji: '📚',
    objects: [
      WorldHotspot(word: 'book', meaning: 'کتاب', emoji: '📖', sentence: 'This book is interesting.'),
      WorldHotspot(word: 'library', meaning: 'کتابخانه', emoji: '📚', sentence: 'The library is quiet.'),
      WorldHotspot(word: 'shelf', meaning: 'قفسه', emoji: '🗄️', sentence: 'The books are on the shelf.'),
      WorldHotspot(word: 'reader', meaning: 'خواننده', emoji: '👓', sentence: 'The reader is quiet.'),
      WorldHotspot(word: 'computer', meaning: 'کامپیوتر', emoji: '💻', sentence: 'The computer is available.'),
      WorldHotspot(word: 'quiet', meaning: 'ساکت', emoji: '🤫', sentence: 'Please be quiet.'),
    ],
  ),
  WorldScene(
    id: 23,
    title: 'Office',
    subtitle: 'اداره و دفتر کار',
    emoji: '💼',
    objects: [
      WorldHotspot(word: 'office', meaning: 'دفتر کار', emoji: '🏢', sentence: 'I work in an office.'),
      WorldHotspot(word: 'computer', meaning: 'کامپیوتر', emoji: '💻', sentence: 'The computer is on.'),
      WorldHotspot(word: 'phone', meaning: 'تلفن', emoji: '📱', sentence: 'The phone is ringing.'),
      WorldHotspot(word: 'manager', meaning: 'مدیر', emoji: '👔', sentence: 'The manager is in the office.'),
      WorldHotspot(word: 'meeting', meaning: 'جلسه', emoji: '👥', sentence: 'We have a meeting today.'),
      WorldHotspot(word: 'document', meaning: 'مدرک/سند', emoji: '📄', sentence: 'Read the document.'),
    ],
  ),
  WorldScene(
    id: 24,
    title: 'Hospital',
    subtitle: 'بیمارستان',
    emoji: '🏥',
    objects: [
      WorldHotspot(word: 'doctor', meaning: 'پزشک', emoji: '👨‍⚕️', sentence: 'The doctor is here.'),
      WorldHotspot(word: 'nurse', meaning: 'پرستار', emoji: '👩‍⚕️', sentence: 'The nurse helps the patient.'),
      WorldHotspot(word: 'patient', meaning: 'بیمار', emoji: '🧑', sentence: 'The patient is resting.'),
      WorldHotspot(word: 'hospital', meaning: 'بیمارستان', emoji: '🏥', sentence: 'The hospital is large.'),
      WorldHotspot(word: 'room', meaning: 'اتاق', emoji: '🚪', sentence: 'The patient is in the room.'),
      WorldHotspot(word: 'medicine', meaning: 'دارو', emoji: '💊', sentence: 'The doctor gives medicine.'),
    ],
  ),
  WorldScene(
    id: 25,
    title: 'Pharmacy',
    subtitle: 'داروخانه',
    emoji: '💊',
    objects: [
      WorldHotspot(word: 'pharmacy', meaning: 'داروخانه', emoji: '💊', sentence: 'The pharmacy is nearby.'),
      WorldHotspot(word: 'medicine', meaning: 'دارو', emoji: '💊', sentence: 'Take the medicine as directed.'),
      WorldHotspot(word: 'pharmacist', meaning: 'داروساز', emoji: '🧑‍⚕️', sentence: 'The pharmacist can help.'),
      WorldHotspot(word: 'prescription', meaning: 'نسخه', emoji: '📄', sentence: 'I have a prescription.'),
      WorldHotspot(word: 'bottle', meaning: 'بطری', emoji: '🧴', sentence: 'The bottle is small.'),
      WorldHotspot(word: 'counter', meaning: 'پیشخوان', emoji: '🧾', sentence: 'The medicine is at the counter.'),
    ],
  ),
  WorldScene(
    id: 26,
    title: 'Gym',
    subtitle: 'باشگاه ورزشی',
    emoji: '🏋️',
    objects: [
      WorldHotspot(word: 'gym', meaning: 'باشگاه', emoji: '🏋️', sentence: 'I go to the gym.'),
      WorldHotspot(word: 'dumbbell', meaning: 'دمبل', emoji: '🏋️', sentence: 'The dumbbell is heavy.'),
      WorldHotspot(word: 'treadmill', meaning: 'تردمیل', emoji: '🏃', sentence: 'He runs on the treadmill.'),
      WorldHotspot(word: 'exercise', meaning: 'ورزش/تمرین', emoji: '💪', sentence: 'Exercise is important.'),
      WorldHotspot(word: 'water', meaning: 'آب', emoji: '💧', sentence: 'Drink some water.'),
      WorldHotspot(word: 'coach', meaning: 'مربی', emoji: '🧑‍🏫', sentence: 'The coach helps us.'),
    ],
  ),
  WorldScene(
    id: 27,
    title: 'Stadium',
    subtitle: 'زمین فوتبال و استادیوم',
    emoji: '⚽',
    objects: [
      WorldHotspot(word: 'stadium', meaning: 'استادیوم', emoji: '🏟️', sentence: 'The stadium is full.'),
      WorldHotspot(word: 'football', meaning: 'فوتبال', emoji: '⚽', sentence: 'I play football.'),
      WorldHotspot(word: 'player', meaning: 'بازیکن', emoji: '🧑‍🤝‍🧑', sentence: 'The player is fast.'),
      WorldHotspot(word: 'goal', meaning: 'گل/دروازه', emoji: '🥅', sentence: 'He scored a goal.'),
      WorldHotspot(word: 'referee', meaning: 'داور', emoji: '🧑‍⚖️', sentence: 'The referee blows the whistle.'),
      WorldHotspot(word: 'fan', meaning: 'هوادار', emoji: '📣', sentence: 'The fans are excited.'),
    ],
  ),
  WorldScene(
    id: 28,
    title: 'Cinema',
    subtitle: 'سینما',
    emoji: '🎬',
    objects: [
      WorldHotspot(word: 'cinema', meaning: 'سینما', emoji: '🎬', sentence: 'We are going to the cinema.'),
      WorldHotspot(word: 'movie', meaning: 'فیلم', emoji: '🎥', sentence: 'The movie is interesting.'),
      WorldHotspot(word: 'ticket', meaning: 'بلیط', emoji: '🎫', sentence: 'I bought a ticket.'),
      WorldHotspot(word: 'screen', meaning: 'صفحه نمایش', emoji: '📺', sentence: 'The movie is on the screen.'),
      WorldHotspot(word: 'seat', meaning: 'صندلی', emoji: '💺', sentence: 'Our seats are together.'),
      WorldHotspot(word: 'popcorn', meaning: 'پاپ‌کورن', emoji: '🍿', sentence: 'I like popcorn.'),
    ],
  ),
  WorldScene(
    id: 29,
    title: 'Birthday Party',
    subtitle: 'جشن تولد',
    emoji: '🎂',
    objects: [
      WorldHotspot(word: 'birthday', meaning: 'تولد', emoji: '🎂', sentence: 'Today is my birthday.'),
      WorldHotspot(word: 'cake', meaning: 'کیک', emoji: '🎂', sentence: 'The birthday cake is ready.'),
      WorldHotspot(word: 'candle', meaning: 'شمع', emoji: '🕯️', sentence: 'Blow out the candle.'),
      WorldHotspot(word: 'gift', meaning: 'هدیه', emoji: '🎁', sentence: 'This gift is for you.'),
      WorldHotspot(word: 'balloon', meaning: 'بادکنک', emoji: '🎈', sentence: 'The balloon is blue.'),
      WorldHotspot(word: 'friend', meaning: 'دوست', emoji: '🧑‍🤝‍🧑', sentence: 'My friends are here.'),
    ],
  ),
  WorldScene(
    id: 30,
    title: 'Hotel & Travel',
    subtitle: 'هتل و سفر',
    emoji: '🏨',
    objects: [
      WorldHotspot(word: 'hotel', meaning: 'هتل', emoji: '🏨', sentence: 'The hotel is near the airport.'),
      WorldHotspot(word: 'room', meaning: 'اتاق', emoji: '🛏️', sentence: 'My room is on the second floor.'),
      WorldHotspot(word: 'key', meaning: 'کلید', emoji: '🔑', sentence: 'Here is your room key.'),
      WorldHotspot(word: 'reception', meaning: 'پذیرش', emoji: '🛎️', sentence: 'The reception is downstairs.'),
      WorldHotspot(word: 'travel', meaning: 'سفر', emoji: '🧳', sentence: 'I love to travel.'),
      WorldHotspot(word: 'passport', meaning: 'گذرنامه', emoji: '📕', sentence: 'Keep your passport safe.'),
    ],
  ),
];

WorldScene worldForLesson(int id) =>
    englishQuestWorlds.firstWhere((w) => w.id == id, orElse: () => englishQuestWorlds.first);

class InteractiveWorldPage extends StatefulWidget {
  final int lessonId;

  const InteractiveWorldPage({super.key, required this.lessonId});

  @override
  State<InteractiveWorldPage> createState() => _InteractiveWorldPageState();
}

class _InteractiveWorldPageState extends State<InteractiveWorldPage>
    with SingleTickerProviderStateMixin {
  late WorldScene scene;
  final FlutterTts tts = FlutterTts();
  int found = 0;
  int? selectedIndex;
  late AnimationController pulse;

  @override
  void initState() {
    super.initState();
    scene = worldForLesson(widget.lessonId);
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.42);
    pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    tts.stop();
    pulse.dispose();
    super.dispose();
  }

  Future<void> _speak(WorldHotspot object) async {
    setState(() {
      selectedIndex = scene.objects.indexOf(object);
      found = {...List.generate(found, (i) => i), selectedIndex!}.length;
    });
    await tts.speak(object.word);
  }

  void _showWord(WorldHotspot object) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0A1224),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 18),
                Text(object.emoji, style: const TextStyle(fontSize: 58)),
                const SizedBox(height: 8),
                Text(
                  object.word,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00E5FF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(object.meaning, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                _InfoBox(
                  title: 'جمله',
                  child: Text(
                    object.sentence,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => tts.speak(object.sentence),
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('شنیدن تلفظ'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = found / scene.objects.length;

    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text('${scene.emoji}  ${scene.title}'),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _WorldPainter(sceneId: scene.id),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                scene.subtitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'روی اشیا بزن و انگلیسی یاد بگیر',
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: pulse,
                        builder: (_, __) => Container(
                          padding: EdgeInsets.all(9 + pulse.value * 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF00C8FF).withOpacity(.12),
                            border: Border.all(
                              color: const Color(0xFF00E5FF).withOpacity(.4),
                            ),
                          ),
                          child: Text(
                            '${found}/${scene.objects.length}',
                            style: const TextStyle(
                              color: Color(0xFF00E5FF),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 9,
                      backgroundColor: Colors.white12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final columns = width > 600 ? 4 : 3;
                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 18),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: .95,
                        ),
                        itemCount: scene.objects.length,
                        itemBuilder: (_, i) {
                          final object = scene.objects[i];
                          final active = selectedIndex == i;
                          return GestureDetector(
                            onTap: () {
                              _speak(object);
                              _showWord(object);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: active
                                      ? const [
                                          Color(0xFF075B79),
                                          Color(0xFF102B47),
                                        ]
                                      : const [
                                          Color(0xFF101B31),
                                          Color(0xFF0A1224),
                                        ],
                                ),
                                border: Border.all(
                                  color: active
                                      ? const Color(0xFF00E5FF)
                                      : Colors.white12,
                                  width: active ? 1.7 : 1,
                                ),
                                boxShadow: active
                                    ? [
                                        const BoxShadow(
                                          color: Color(0x5500E5FF),
                                          blurRadius: 18,
                                        )
                                      ]
                                    : [],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    object.emoji,
                                    style: const TextStyle(fontSize: 38),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    object.word,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    object.meaning,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF00E5FF),
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  const Icon(
                                    Icons.touch_app_rounded,
                                    size: 16,
                                    color: Colors.white38,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                if (found == scene.objects.length)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF093B4D), Color(0xFF11182A)],
                        ),
                        border: Border.all(
                          color: const Color(0xFF00E5FF).withOpacity(.4),
                        ),
                      ),
                      child: const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Text('🎉', style: TextStyle(fontSize: 30)),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'همه اشیا را پیدا کردی! حالا کلمات را در Quiz امتحان کن.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '+30 XP',
                              style: TextStyle(
                                color: Color(0xFF00E5FF),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoBox({required this.title, required this.child});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.045),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF00E5FF),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 7),
            child,
          ],
        ),
      );
}

/// نقاشی ساده‌ی پس‌زمینه؛ به‌جای عکس سنگین.
/// برای هر دسته رنگ و شکل متفاوت می‌شود.
class _WorldPainter extends CustomPainter {
  final int sceneId;

  _WorldPainter({required this.sceneId});

  @override
  void paint(Canvas canvas, Size size) {
    final sky = Paint()..color = const Color(0xFF07162B);
    final ground = Paint()..color = const Color(0xFF091D26);
    canvas.drawRect(Offset.zero & size, sky);

    final horizon = size.height * .56;
    canvas.drawRect(
      Rect.fromLTWH(0, horizon, size.width, size.height - horizon),
      ground,
    );

    final glow = Paint()
      ..color = const Color(0xFF00C8FF).withOpacity(.07)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 45);

    canvas.drawCircle(
      Offset(size.width * .78, size.height * .22),
      90,
      glow,
    );

    final line = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // قاب‌های هندسی تزئینی برای حس دنیای بازی.
    for (int i = 0; i < 6; i++) {
      final x = size.width * (i + 1) / 7;
      final h = 25.0 + ((sceneId + i) % 4) * 18;
      canvas.drawLine(
        Offset(x, horizon),
        Offset(x, horizon - h),
        line,
      );
    }

    // جاده/رودخانه‌ی نمادین در بعضی محیط‌ها.
    if ([6, 9, 16, 17, 18, 20, 30].contains(sceneId)) {
      final path = Path()
        ..moveTo(size.width * .42, size.height)
        ..quadraticBezierTo(
          size.width * .62,
          size.height * .72,
          size.width * .48,
          horizon,
        )
        ..lineTo(size.width * .58, horizon)
        ..quadraticBezierTo(
          size.width * .72,
          size.height * .72,
          size.width * .55,
          size.height,
        )
        ..close();

      final road = Paint()..color = const Color(0xFF101A29);
      canvas.drawPath(path, road);

      final dash = Paint()
        ..color = const Color(0xFF00E5FF).withOpacity(.18)
        ..strokeWidth = 3;

      for (int i = 0; i < 7; i++) {
        final y = size.height - 35.0 - i * 48;
        canvas.drawLine(
          Offset(size.width * .49, y),
          Offset(size.width * .51, y),
          dash,
        );
      }
    }

    // خورشید/ماه.
    final sun = Paint()..color = const Color(0xFF00E5FF).withOpacity(.12);
    canvas.drawCircle(Offset(size.width * .16, size.height * .2), 48, sun);
  }

  @override
  bool shouldRepaint(covariant _WorldPainter oldDelegate) =>
      oldDelegate.sceneId != sceneId;
}
