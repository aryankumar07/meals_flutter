import 'package:flutter/material.dart';
import 'package:mealapp/categories_item.dart';
import 'package:mealapp/category.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meals.dart';

class CategoriesScreen extends StatefulWidget{

  CategoriesScreen({super.key,
  required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      );

      _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }



  void _selectCategory(BuildContext context, CategoryVal category) {
    final filteredMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(context,
     MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title,
      meals: filteredMeals,
      ) ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController,
    child: GridView(
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
     builder: (context,child) => 
     SlideTransition(position:
      Tween(
      begin: Offset(0, 0.3),
      end: Offset(0, 0),
     ).animate(CurvedAnimation(
      parent: _animationController,
       curve: Curves.easeInOut)),
     child: child,)
    );
  }
}