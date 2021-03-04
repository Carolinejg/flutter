import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final titleController= TextEditingController();
  final valueController= TextEditingController();

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
          Column(
            children: _transactions.map((tr) { //converter um objeto do tipo transaction para um elemento visual
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical:10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.purple,
                        width: 2,
                        )
                      ),
                      padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',//2 casas decimais 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple, 
                          
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,//coluna eixo principla main e cruzado o cross
                      children:<Widget> [
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold
                          ),

                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      ]
                    
                    )
                  ],
                ),
              );
            }
            ).toList(), //final do map, pega todos os elementos do map de transações e converte em uma lista 
            
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children:<Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller:  valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    )
                  ),
                  FlatButton(
                    child: Text('Nova transação'), 
                    textColor: Colors.purple,
                    onPressed: (){
                      print(titleController.text);
                      print(valueController.text);
                    },
                  )
                ]
              ),
            )
          )
        ],
      ),
    );
  }
}
