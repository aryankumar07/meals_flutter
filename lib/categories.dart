import 'package:flutter/material.dart';
import 'package:mealapp/categories_item.dart';
import 'package:mealapp/category.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/meals.dart';

class CategoriesScreen extends StatelessWidget{

  CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryVal category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(context,
     MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals) ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
              CategoryGridItem(category: category,onSelectCategory: () {
                _selectCategory(context,category);
              },)

        ],
        ),
    );
  }

}