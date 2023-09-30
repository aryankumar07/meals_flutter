import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/categories.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/filters.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meals.dart';
import 'package:mealapp/meals_provider.dart';
import 'package:mealapp/fav_provider.dart';
import 'package:mealapp/filters_provider.dart';

 

class TabScreen extends ConsumerStatefulWidget{

  TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    // TODO: implement createState
    return _TabScreenState();
  }
}

class _TabScreenState extends  ConsumerState<TabScreen>{

  int _selectedPage = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPage = index; 
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier=="Filters"){
      final result  = await Navigator.of(context).push<Map<Filters,bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen())
          );
    }
    
  }


  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filterMealsProvider);

    
    String activePageTitle = "Categories";


    Widget activePage = CategoriesScreen(
    availableMeals: availableMeals,);

     if(_selectedPage == 1){
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(title: "Favourites",
       meals: favouriteMeals,
       );
      activePageTitle = "Your FAvourites";
     }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:  MainDrawer(onSelecScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favourites"),
        ],

      ),
    );
  }
}