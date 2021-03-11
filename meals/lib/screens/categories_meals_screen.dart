import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

///tela contendo todas as comidas de uma categoria 

class CategoriesMealsScreen extends StatelessWidget {
  final Category category;

  const  CategoriesMealsScreen(this.category);


  @override
  Widget build(BuildContext context) {
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