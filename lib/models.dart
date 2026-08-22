class Word {
  final String word, meaning, pronunciation, emoji;
  const Word(this.word, this.meaning, this.pronunciation, this.emoji);
}

class Question {
  final String text;
  final List<String> options;
  final String answer;
  const Question(this.text, this.options, this.answer);
}

class Lesson {
  final int id;
  final String title, subtitle, explanation, formula;
  final List<Word> words;
  final List<String> examples;
  final List<Question> questions;

  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.explanation,
    required this.formula,
    required this.words,
    required this.examples,
    required this.questions,
  });
}
