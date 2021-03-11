import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy.dart';
//representa a tela de categorias 
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar?'),
      ),
      body: GridView(//os elementos são organizados em forma de grade 
      padding: const EdgeInsets.all(25) ,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,//cada elemento com uma extensão de no máximo 200 px
          childAspectRatio: 3 / 2, 
          crossAxisSpacing: 20, //espaçamento no eixo cruzado
          mainAxisSpacing: 20,
          
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(), //percorrer cada categoria e converter cada categoria para o componente criado

        
      ),
    );
  }
}