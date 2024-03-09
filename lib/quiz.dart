import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> choosenAnswer = [];

  // @override
  // void initState() {
  //   activeScreen = FirstScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "question"; // const olmadi
    });
  }

  void onRestart() {
    choosenAnswer = [];
    setState(() {
      activeScreen = "start-screen";
    });
  }

  void chooseAnswer(String answer) {
    choosenAnswer.add(answer);
    if (choosenAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = FirstScreen(switchScreen);

    if (activeScreen == "question") {
      screenWidget = Question(
        onelect: chooseAnswer,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        choosenAns: choosenAnswer,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 44, 2, 52),
                  Color.fromARGB(255, 161, 11, 166),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
