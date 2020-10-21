import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionHandler;

  TransactionList(this.transactions, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text('No transactions made yet',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraint.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              // return Card(
              //     child: Row(
              //   children: [
              //     Container(
              //       margin:
              //           EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //               width: 3,
              //               style: BorderStyle.solid,
              //               color: Colors.amber)),
              //       padding: EdgeInsets.all(10),
              //       child: Text(
              //         '\$${transactions[index].amount.toStringAsFixed(2)}',
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Colors.amber),
              //       ),
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           child: Text(transactions[index].title,
              //               style: TextStyle(
              //                   fontSize: 16, fontWeight: FontWeight.bold)),
              //         ),
              //         Container(
              //           child: Text(
              //               DateFormat.yMMMd()
              //                   .format(transactions[index].date),
              //               style: TextStyle(color: Colors.blueGrey)),
              //         ),
              //       ],
              //     )
              //   ],
              // ));

              // alternate way for above commented cards
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () =>
                              deleteTransactionHandler(transactions[index].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text('Delete'))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransactionHandler(transactions[index].id),
                        ),
                ),
              );
            });
  }
}
