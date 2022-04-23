import 'package:flutter_codigo5_quiz/question.dart';

class QuizBrain{

  List<Question> _questions = [
    Question(questionText: "¿El hombre llegó a la luna?", questionAnswer: true),
    Question(questionText: "¿El mar es azul?", questionAnswer: false),
    Question(questionText: "¿La tierra es plana?", questionAnswer: false),
    Question(
        questionText: "¿Jupiter es el planeta mas grande del sistema solar?",
        questionAnswer: false),
  ];

  int _idQuestionNumber = 0;
  bool _isFinish = false;

  String getQuestionText(){
    return _questions[_idQuestionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questions[_idQuestionNumber].questionAnswer;
  }

  void nextQuestion(){
    if (_idQuestionNumber < _questions.length - 1){
      _idQuestionNumber++;
    }
  }

  bool isFinished(){
    if(_idQuestionNumber >= _questions.length - 1){
      _isFinish = true;
    }
    return _isFinish;
  }

  void restart(){
    _idQuestionNumber = 0;
    _isFinish = false;
  }
}