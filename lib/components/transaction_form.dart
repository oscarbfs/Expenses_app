import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
            TextField(
              controller: valueControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Nova Transação'),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.purpleAccent),
                  ),
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
