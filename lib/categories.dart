import 'package:flutter/material.dart';
import 'package:mealapp/categories_item.dart';
import 'package:mealapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget{

  CategoriesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Pick Your Category"),
      ),
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
              CategoryGridItem(category: category)

        ],
        ),
    );
  }

}