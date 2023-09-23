import 'package:flutter/material.dart';
import 'package:mealapp/meal_data.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget{

  MealDetails({super.key,
  required this.meal,
  });


  final Meal meal;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
             image: NetworkImage(meal.imageUrl),
             fit: BoxFit.cover,
             height: 200,
             width: double.infinity,
             ),
             SizedBox(height: 14,),
             Text("Ingredients",
             style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
             )
             ),
             SizedBox(height: 14,),
             for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
             SizedBox(height: 24,),
             Text("Steps",
             style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
             )
              ),
              SizedBox(height: 14,),
             for (final steps in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Text(
                    steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                    ),
                  ),
                ),
      
      
          ],
        ),
      ),
    );
  }
}