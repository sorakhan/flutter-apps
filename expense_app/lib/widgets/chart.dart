import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get weekTransactionValues {
    return List.generate(7, (index) {
      // generates a list of 7 values
      // gets todays date
      //    - if subtracting 0 days cus 0 index, then TODAY
      //    - if subtracting 1 day cus 1 index, then TODAY-1 = yesterday
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      // DateFormat.E(weekDay) = M T W.. etc
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get getTotalSpending {
    return weekTransactionValues.fold(0.0, (previousValue, tx) {
      return previousValue += tx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: weekTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                getTotalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / getTotalSpending,
              ),
            );
            // return Text('${data['day']} : ${data['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
