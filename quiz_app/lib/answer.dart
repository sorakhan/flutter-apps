import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function pickAnswer;
  final String answer;

  Answer(this.pickAnswer, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: pickAnswer, 
        child: Text(answer),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
