import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transactions_form.dart';
import '../models/transaction.dart';

//será StatefulWidget porque a lista pode crescer 
class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
 
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

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm()
      ],
    );
  }
}