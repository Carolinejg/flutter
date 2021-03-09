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
      child: transactions.isEmpty ? Column( //se não tiver nenhuma transação cadastrada m,ostra a mensagem e a figura 
        children: <Widget>[
          SizedBox(height:20),
          Text(
            'Nenhuma transação cadastrada',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height:30),
          Container(
            height: 200,
            child: Image.asset('assets\\imagens\\waiting.png',
            fit: BoxFit.cover,//para se ajustar ao tamanho
            ),
          ),
          
        ],
      ) : SingleChildScrollView(
            child: Column(
                children: transactions.map((tr) { //converter um objeto do tipo transaction para um elemento visual
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                      child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                    ),
                  );
                }
                ).toList(), //final do map, pega todos os elementos do map de transações e converte em uma lista 
                
              ),
      ),
    );
  }
}