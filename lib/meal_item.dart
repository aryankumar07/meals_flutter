import 'package:flutter/material.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meal_details.dart';
import 'package:mealapp/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{

  MealItem({super.key,
  required this.meal,
  });

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal,)),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
               image: NetworkImage(meal.imageUrl),
               fit: BoxFit.cover,
               height: 200,
               width: double.infinity ,
               ),
               Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                  child: Column(
                    children: [
                      Text(meal.title ,
                       maxLines: 2,
                       textAlign: TextAlign.center,
                       softWrap: true,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:  Colors.white
                       ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                             label: "${meal.duration} min "),
                          MealItemTrait(
                            icon: Icons.work,
                             label: "$complexityText"),
                          MealItemTrait(
                            icon: Icons.attach_money,
                             label: "$affordText"),
                        ],
                      )
                    ],
                  ),

                ),)
          ],
        ),
      ),
    );
  }
}