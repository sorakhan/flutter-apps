import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double totalSpending;
  final double totalSpendingPercentage;

  ChartBar(this.day, this.totalSpending, this.totalSpendingPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
              child: Text('\$${totalSpending.toStringAsFixed(0)}'),
            )),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Color.fromRGBO(200, 200, 200, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalSpendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('$day'),
      ],
    );
  }
}
