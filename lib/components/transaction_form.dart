import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.purpleAccent[700],
        child: Card(
          color: Colors.black,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: <Widget>[
                AdaptativeTextField(
                  label: 'Título',
                  controller: _titleControler,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeTextField(
                  label: 'Valor (R\$)',
                  controller: _valueControler,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdapitativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AdaptativeButton(
                      label: 'Nova Transação',
                      onPressed: _submitForm,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
