import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  List<String> preguntas = [
    "El hombre llego a la luna",
    "La tierra es plana",
    "Desayunaron",
  ];

  List<bool> answers = [
    true,
    false,
    true,
  ];

  List<Icon> scoreKeeper = [];

  int idQuestionNumber = 0;

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
                preguntas[idQuestionNumber],
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
                  bool correctAnswer = answers[idQuestionNumber];
                  if(correctAnswer) scoreKeeper.add(Icon(Icons.check,color: Color(0xff00E1B7),),);
                  else scoreKeeper.add(Icon(Icons.close,color: Color(0xfff84073),),);

                  if(idQuestionNumber<preguntas.length-1){
                    idQuestionNumber++;
                  }else if(idQuestionNumber==preguntas.length-1){
                    idQuestionNumber=0;
                  }
                  setState(() {});
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
                  bool correctAnswer = answers[idQuestionNumber];
                  if(!correctAnswer) scoreKeeper.add(Icon(Icons.check,color: Color(0xff00E1B7),),);
                  else scoreKeeper.add(Icon(Icons.close,color: Color(0xfff84073),),);

                  if(idQuestionNumber<preguntas.length-1){
                    idQuestionNumber++;
                  }else if(idQuestionNumber==preguntas.length-1){
                    idQuestionNumber=0;
                  }
                  setState(() {});
                },
              ),
            ),
          ),
          Row(children: scoreKeeper,)
        ],
      ),
    );
  }
}
