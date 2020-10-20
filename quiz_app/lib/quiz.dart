 import 'package:flutter/material.dart';
 import './question.dart';
 import './answer.dart';
 
 class Quiz extends StatelessWidget {

   final List<Map<String, Object>> questions;
   final Function chooseAnswer;
   final int questionIndex;

   Quiz({
     @required this.questions,
     @required this.chooseAnswer,
     @required this.questionIndex
   });
   @override
   Widget build(BuildContext context) {
     return Column(
          children: [
            Question(questions[questionIndex]['question']),
            ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
              return Answer(() => chooseAnswer(answer['score']), answer['text']);
            }).toList()
          ],
        );
   }
 }