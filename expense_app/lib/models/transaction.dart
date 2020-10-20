import 'package:flutter/foundation.dart'; // for @required
class Transaction {
  // gets value when a Transaction is created but never changes after
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount, 
    @required this.date
  }); // writing this way so we don't have to remember the order
}