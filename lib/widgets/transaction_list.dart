// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personalexpenses/widgets/transaction_item.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/209-2091095_sleep-zzz-clip-art.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
          children: [
            ...transactions.map((tx) => TransactionItem(key: ValueKey(tx.id),transaction: tx, deleteTx: deleteTx)).toList(),
          ],
        );
  }
}


