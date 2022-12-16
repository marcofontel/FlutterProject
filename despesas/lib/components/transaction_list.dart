import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _transactions;
  final void Function(String) onRemove;

  TransactionList(this._transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Nenhuma transação Cadastrada!',
                style: Theme.of(context).textTheme.titleMedium,
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
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${e.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    e.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    DateFormat('d/M/y').format(e.date),
                  ),
                  trailing: IconButton(
                    onPressed: () => onRemove(e.id),
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
          );
  }
}
