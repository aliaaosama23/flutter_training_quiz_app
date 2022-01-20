import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Models/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizzApp(),
    );
  }
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int questionNumber = 0;
  List<Icon> scoreResults = [];
  // List<String> questions = ['question1', 'question2', 'question3', 'question3'];
  // List<bool> answers = [true, false, true, true];

  List<Question> questionsBank = [
    Question(questionText: 'question1', questionAnswer: true),
    Question(questionText: 'question2', questionAnswer: false),
    Question(questionText: 'question3', questionAnswer: true),
    Question(questionText: 'question4', questionAnswer: true)
  ];

  updateAnswer(bool userAnswer) {
    bool correctAnswer = questionsBank[questionNumber].questionAnswer;
    if (questionNumber < questionsBank.length - 1) {
      setState(() {
        questionNumber++;
      });
    } else {
      Alert(
        type: AlertType.success,
        context: context,
        title: 'End',
        desc: "Your quiz is ended",
      ).show();
    }

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreResults.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreResults.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47597E),
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text(
          'Quizz Application',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questionsBank[questionNumber].questionText,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.orangeAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  onPressed: () {
                    updateAnswer(true);
                  },
                  child: const Text('True'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 25),
                    ),
                  ),
                  onPressed: () {
                    updateAnswer(false);
                  },
                  child: const Text('False'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: scoreResults,
              ),
            )
          ],
        ),
      ),
    );
  }
}
