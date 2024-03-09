class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    final copyAnswers = List.of(answers);
    copyAnswers.shuffle();
    return copyAnswers;
  }
}
