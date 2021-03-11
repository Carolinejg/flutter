


import 'package:flutter/material.dart';

///tela contendo todas as comidas de uma categoria 

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetias') ,
      ),
      body: Center(
        child: Text('Receitas por Categorias'),
      ),
    );
  }
}