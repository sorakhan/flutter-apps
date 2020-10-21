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
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
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

  _deleteTransaction(String id) {
    print('will delete: ' + id);
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
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

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBarWidget = AppBar(
      title: Text('Transax'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBarWidget.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.8,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBarWidget,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // children = SHOWS CHART AND LIST OF TRANSACTIONS
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
            // UserTransactions() // no longer using this because we need to manipulate the transaction list through here because of the modalBottomSheet

            // shows chart or list of transactions depending on toggle _showChart
            if (isLandscape)
              _showChart
                  ? Container(
                      padding: EdgeInsets.all(10),
                      height: (MediaQuery.of(context).size.height -
                              appBarWidget.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.6,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget,

            if (!isLandscape)
              Container(
                padding: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        appBarWidget.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),

            if (!isLandscape) txListWidget
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
