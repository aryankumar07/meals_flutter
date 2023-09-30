import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/meal_data.dart';


class favouriteMealsNotifier extends StateNotifier<List<Meal>> {
  favouriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal){
    final mealisfavourite = state.contains(meal);

    if(mealisfavourite){
      state = state.where((element) => element.id!=meal.id).toList();
    }else{
      state = [...state,meal];
    }
  }

}

final favouriteMealsProvider = StateNotifierProvider<favouriteMealsNotifier,List<Meal>>((ref) {
 return favouriteMealsNotifier();
});