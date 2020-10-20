import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  Result(this.totalScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              'Quiz complete! \n' + totalScore.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,

            ),
          ),
          FlatButton(onPressed: resetHandler, child: Text('Restart Quiz', style: TextStyle(color: Colors.blue)))
        ],
      ),
    );
  }
}
