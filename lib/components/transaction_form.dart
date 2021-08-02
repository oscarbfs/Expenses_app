import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_button.dart';

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

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                TextField(
                  controller: _titleControler,
                  onSubmitted: (_) => _submitForm(),
                  style: TextStyle(color: Colors.cyanAccent),
                  decoration: InputDecoration(
                    labelText: 'Título',
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.purpleAccent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                  ),
                ),
                TextField(
                  controller: _valueControler,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  style: TextStyle(color: Colors.cyanAccent),
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.purpleAccent)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Nenhuma data selecionada!'
                              : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Selecionar data',
                          style:
                              TextStyle(color: Theme.of(context).buttonColor),
                        ),
                        onPressed: _showDatePicker,
                      )
                    ],
                  ),
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
