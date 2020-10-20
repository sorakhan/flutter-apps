import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<_MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

    var questions = const [
      {
        'question': 'Fav Color?',
        'answers': [
          {'text' : 'red', 'score' : 10}, 
          {'text' : 'green', 'score' : 9}, 
          {'text' : 'blue', 'score' : 8}, 
          {'text' : 'yellow', 'score' : 7}
        ]
      },
      {
        'question': 'Fav Animal?',
        'answers': [
          {'text' : 'cat', 'score' : 10},
          {'text' : 'dog', 'score' : 5},
          {'text' : 'fish', 'score' : 3},
          {'text' : 'rabbit', 'score' : 2}
        ]
      },
      {
        'question': 'Fav Sport?',
        'answers': [
          {'text' : 'bball', 'score' : 1},
          {'text' : 'football', 'score' : 5}
        ]
      },
    ];

  void _chooseAnswer(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override // nicer to put that we are purposely overriding, bot acidentally
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                chooseAnswer: _chooseAnswer,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
    