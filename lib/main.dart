import 'components/transaction_user.dart';
import 'package:flutter/material.dart';

main() => runApp(Expenses());

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Despesas Pessoais',
            style: TextStyle(color: Colors.cyanAccent)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Container(
        color: Colors.purple[900],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.black,
                  child: Text('Gráfico'),
                  elevation: 5,
                ),
              ),
              TransactionUser(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
