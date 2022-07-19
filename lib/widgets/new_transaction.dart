// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/widgets/adative_button.dart';

class NewTransaction extends StatefulWidget {
  final Function onPressed;

  NewTransaction(this.onPressed){
    print("Constructor");
  }

  @override
  //State<NewTransaction> createState() => _NewTransactionState();
  _NewTransactionState createState(){
    print('createState NewTransaction');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _NewTransactionState(){
    print("Constructor NewTransaction State");
  }

  @override
  void initState(){
    print("initState");
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget){
    super.didUpdateWidget(oldWidget);
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.onPressed(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
    //widget.onPressed(titleController.text, double.parse(amountController.text));
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970, 1, 1),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); //a future event through then method
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val){
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => amountInput = val,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(_selectedDate == null
                              ? 'No Date Chosen!'
                              : DateFormat.yMd().format(_selectedDate))),
                      AdaptiveFlateButton("Choose Date", _presentDatePicker),
                    ],
                  ),
                ),
                FlatButton(
                    onPressed: _submitData,
                    textColor: Theme.of(context).textTheme.button?.color,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Add Transaction',
                    )),
              ]),
        ),
      ),
    );
  }
}
