import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transactions_form.dart';
import 'components/transaction_list.dart';
import 'components/transactions_form.dart';
import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/chart.dart';
main() => runApp((ExpensesApp()));

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(), //o componente ExpensesApp tem dentro de si o componente MyHomePage
        theme: ThemeData(
          primarySwatch: Colors.purple,//cor tema 
          accentColor: Colors.amber,//cor do botão
          fontFamily:  'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6:TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold, 
              ), 
            button: TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold, 
              ), 
            ),
          ),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

//Retorna uma lista de transaçôes com as transaçôes dos últimos 7 dias
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr){
      return tr.date.isAfter(DateTime.now().subtract(//se a data da transação for depois retorna verdadeiro (isAfter) e significa que ela precisa estar na nova lista 
        Duration(days: 7),//pega a data atual e subtrai 7 dias
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    //criando uma nova transação
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date,
    );

    //mudando o estado
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();//fechando formulario modal quando os campos são preenchidos 
  }

  _openTransactionFormModal(BuildContext context) {//aba que exibe os campos para cadastro de novas transações
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas pessoais',
          

        ), 
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ]
      )
      ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
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
