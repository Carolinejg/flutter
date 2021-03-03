import 'package:flutter/material.dart';

main()=> runApp((ExpensesApp()));

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()//o componente ExpensesApp tem dentro de si o componente MyHomePage
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
      body: Center(child: Text('Versão inicial') ,),
    );
  }
}