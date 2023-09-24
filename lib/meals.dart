import 'package:flutter/material.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meal_item.dart';

class MealsScreen extends StatelessWidget{
  
  MealsScreen({super.key,
  required this.title,
  required this.meals,
  required this.onToggleFavourite,
  });

  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;


  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index) => MealItem(meal: meals[index],onToggleFavourite: onToggleFavourite,)
    );

    if(meals.isEmpty){
      content = Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nothing to show here",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith( 
                color: Theme.of(context).colorScheme.onBackground)),
              SizedBox(height: 16,),
              Text("try something else",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith( 
                color: Theme.of(context).colorScheme.onBackground
              ),
              )
            ],
          ),
        ));
    }


    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}