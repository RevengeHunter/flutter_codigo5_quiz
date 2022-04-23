import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_quiz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {

  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  checkAnswer(bool userAnswer){
    if(quizBrain.isFinished()==false){
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (correctAnswer == userAnswer)
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Color(0xff00E1B7),
          ),
        );
      else
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Color(0xfff84073),
          ),
        );

      setState(() {});
      quizBrain.nextQuestion();
    }else{
      Alert(context: context, title: "¡Gracias!", desc: "Se completo el cuestionario").show();
      quizBrain.restart();
      scoreKeeper.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272C2F),
      appBar: AppBar(
        backgroundColor: const Color(0xff272C2F),
        title: Text(
          "Quiz Appp",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.lightGreenAccent,
                child: const Text(
                  "Verdadero",
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.redAccent,
                child: const Text(
                  "Falso",
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
