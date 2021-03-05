import 'package:expenses/components/transactions_form.dart';
import 'components/transaction_list.dart';
import 'components/transactions_form.dart';
import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

main() => runApp((ExpensesApp()));

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(), //o componente ExpensesApp tem dentro de si o componente MyHomePage
        theme: ThemeData(
          primarySwatch: Colors.purple,//cor tema 
          accentColor: Colors.amber,//cor do botão
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
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
  ];
  _addTransaction(String title, double value) {
    //criando uma nova transação
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    //mudando o estado
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();//fechando formulario modal quando os campos são preenchidos 
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas pessoais'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
