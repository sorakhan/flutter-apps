import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    // checking if inputs are in the form
    final String titleInput = titleController.text;
    final double amountInput = double.parse(amountController.text);
    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }

    widget.addHandler(titleInput, amountInput);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
