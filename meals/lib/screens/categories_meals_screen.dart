import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../data/dummy.dart';
import 'package:meals/components/meal_item.dart';

///tela contendo todas as comidas de uma categoria

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category
          .id); //se o id da category está dentro está dentro das categorias da meals retorna true
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
