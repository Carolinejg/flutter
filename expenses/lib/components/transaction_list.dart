import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
            child: Column(
                children: transactions.map((tr) { //converter um objeto do tipo transaction para um elemento visual
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
      ),
    );
  }
}