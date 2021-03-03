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
      body: Column(children:<Widget>[
        Container(//envolvi no container para colocar o card na tela toda 
          width:double.infinity,
          child: Card(
            color:Colors.blue,
            child:Text('Gráficos'),
            elevation: 5,
          ),
        ),
        Card(
          child: Text('Lista de transações'),
        )
      ],
      )
      
    );
  }
}