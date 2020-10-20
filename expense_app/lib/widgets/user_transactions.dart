import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', 
        title: 'Bose Headphones', 
        amount: 80, 
        date: DateTime.now()
        ),
    Transaction(
      id: '2', 
      title: 'PS4', 
      amount: 500, 
      date: DateTime.now()
    ),
  ];

  _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction), 
        TransactionList(_userTransactions)
        ],
    );
  }
}
