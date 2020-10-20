import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question; // this gets a value from the constructor

  Question(this.question); // changes and is set via main.dart, which ultimately executes build() whenever it gets a new value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Text(
        question, // returns value obtained from Constructor
        style: TextStyle(fontSize: 28),
        
      ),
    );
  }
}