// 14 Oct 2020 - Sora Khan - Transaction app
// import 'package:expense_app/widgets/user_transactions.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction App',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: 'Bose Headphones',
    //   amount: 80,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'PS4',
    //   amount: 500,
    //   date: DateTime.now(),
    // ),
  ];

  // gets the most recent transactions - last 7 days
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }

  // adds new transaction and updates list of transactions
  _addNewTransaction(String title, double amount, DateTime dateSelected) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: dateSelected);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  // shows the modal bottom sheet for user to input transaction data
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transax'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chart(_recentTransactions),
            ),
            // UserTransactions() // no longer using this because we need to manipulate the transaction list through here because of the modalBottomSheet

            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
