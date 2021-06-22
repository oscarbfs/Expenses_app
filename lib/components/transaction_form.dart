import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueControler,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('Nova Transação'),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  onPressed: () {
                    print(titleControler.text);
                    print(valueControler.text);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
