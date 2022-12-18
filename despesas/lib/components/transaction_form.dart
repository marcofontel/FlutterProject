import 'package:despesas/components/adaptative_date_picker.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_button.dart';
import 'adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  var _selectedDate = DateTime.now();

  _onPress() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  final ButtonStyle styleElevatedButton = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, color: Colors.purple),
  );
  final textType = InputDecoration(
    labelText: 'Valor (R\$)',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                'Título',
                _titleController,
                TextInputType.text,
                (_) {},
              ),
              AdaptativeTextField(
                'Valor (R\$)',
                _valueController,
                TextInputType.numberWithOptions(decimal: true),
                (_) => _onPress(),
              ),
              AdaptativeDatePicker(_selectedDate, (nd) {
                setState(() {
                  _selectedDate = nd;
                });
              }),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton('Salvar', _onPress),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
