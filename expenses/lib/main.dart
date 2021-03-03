import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp((ExpensesApp()));

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
            MyHomePage() //o componente ExpensesApp tem dentro de si o componente MyHomePage
        );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = {
    Transaction(
      id: 't1',
      title: 'Novo Tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 210.76,
      date: DateTime.now(),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            //envolvi no container para colocar o card na tela toda
            child: Card(
              color: Colors.blue,
              child: Text('Gráficos'),
              elevation: 5,
            ),
          ),
          Card(
            child: Text('Lista de transações'),
          )
        ],
      ),
    );
  }
}
