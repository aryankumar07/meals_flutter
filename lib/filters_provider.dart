import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/meals_provider.dart';

enum Filters {
  glutenFree,
  LactoseFree,
  vegetarian,
  vegan,
} 

class FiltersNotifier extends StateNotifier<Map<Filters,bool>> {
  FiltersNotifier() : super({
    Filters.LactoseFree:false,
    Filters.glutenFree:false,
    Filters.vegan:false,
    Filters.vegetarian:false,
  }); 

  void setFilters(Map<Filters,bool> chosenfilter){
    state = chosenfilter;
  }

  void setFilter (Filters filter,bool isactive){
    state = {
      ...state,
      filter:isactive,
    };
  }
}




final filtersProvider = 
StateNotifierProvider<FiltersNotifier,Map<Filters,bool>>((ref) => FiltersNotifier());

final filterMealsProvider = Provider((ref)  {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if(activeFilters[Filters.glutenFree]! && meal.isGlutenFree){
        return false;
      }
      if(activeFilters[Filters.LactoseFree]! && meal.isLactoseFree){
        return false;
      }
      if(activeFilters[Filters.vegan]! && meal.isVegan){
        return false;
      }
      if(activeFilters[Filters.vegetarian]! && meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
}
);