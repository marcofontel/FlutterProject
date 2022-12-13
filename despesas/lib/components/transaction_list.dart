import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Nenhuma transação Cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                final e = _transactions[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${e.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            e.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            // style: TextStyle(
                            //   fontSize: 16,
                            //   fontWeight: FontWeight.bold,
                            // ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(e.date),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
