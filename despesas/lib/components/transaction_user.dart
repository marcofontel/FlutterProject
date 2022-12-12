import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUser();
}

class _TransactionUser extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Teste',
      value: 310.76,
      date: DateTime.now().toLocal(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
