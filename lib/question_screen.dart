import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import "package:quiz_app/data/questions.dart";

class Question extends StatefulWidget {
  Question({super.key, required this.onelect});

  final void Function(String answer) onelect;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var currentQuestionIndew = 0;

  void answerQuestion(String answer) {
    widget.onelect(answer);
    setState(() {
      currentQuestionIndew++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndew];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                color: Color.fromARGB(255, 239, 142, 229),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledList().map((answers) {
              return Answers(
                answers: answers,
                onTop: () {
                  answerQuestion(answers);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
