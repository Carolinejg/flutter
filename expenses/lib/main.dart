import 'components/transaction_user.dart';
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
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
