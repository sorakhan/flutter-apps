import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _datePicked;

  void submitData() {
    // checking if inputs are in the form
    if (_amountController.text.isEmpty) {
      return;
    }

    final String titleInput = _titleController.text;
    final double amountInput = double.parse(_amountController.text);
    if (titleInput.isEmpty || amountInput <= 0 || _datePicked == null) {
      return;
    }

    widget.addHandler(titleInput, amountInput, _datePicked);
    Navigator.of(context).pop(); // removes modal box
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((dateVal) {
      if (dateVal == null) {
        // user cancelled picking date
        return;
      }

      setState(() {
        _datePicked = dateVal;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                onSubmitted: (_) => submitData(),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_datePicked == null
                        ? 'No date selected'
                        : 'Date: ${DateFormat.yMMMMd().format(_datePicked)}'),
                  ),
                  FlatButton(
                    onPressed: _displayDatePicker,
                    child: Text('Pick a date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    textColor: Theme.of(context).accentColor,
                  )
                ],
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
      ),
    );
  }
}
