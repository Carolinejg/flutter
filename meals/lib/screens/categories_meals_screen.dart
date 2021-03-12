import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

///tela contendo todas as comidas de uma categoria 

class CategoriesMealsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title) ,
      ),
      body: Center(
        child: Text('Receitas por Categorias ${category.id}'),
      ),
    );
  }
}