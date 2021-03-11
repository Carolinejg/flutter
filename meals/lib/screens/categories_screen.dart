import 'package:flutter/material.dart';
//representa  a tela de categorias 
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(//os elementos são organizados em forma de grade 
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,//cada elemento com uma extensão de no máximo 200 px
        childAspectRatio: 3 / 2, 
        crossAxisSpacing: 20, //espaçamento no eixo cruzado
        mainAxisSpacing: 20,
        
      ),
      children: <Widget>[
        
      ],
    );
  }
}