import 'package:flutter/material.dart';
import 'package:mealapp/categories.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meals.dart';

class TabScreen extends StatefulWidget{

  TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabScreenState();
  }
}

class _TabScreenState extends  State<TabScreen>{

  int _selectedPage = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPage = index; 
    });
  }


  @override
  Widget build(BuildContext context) {

    
    String activePageTitle = "Categories";

    final List<Meal> _favouriteMeals = []; 

    void _toggleMealFavouriteStatus(Meal meal){
      print("entere");
      final _isExisting = _favouriteMeals.contains(meal);

      if(_isExisting){
        setState(() {  
        _favouriteMeals.remove(meal);
        });
      }else{
        setState(() {
          print("entered here");
        _favouriteMeals.add(meal);
        });
      }
    }
    Widget activePage = CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);

     if(_selectedPage == 1){
      activePage = MealsScreen(title: "Favourites", meals: _favouriteMeals,onToggleFavourite: _toggleMealFavouriteStatus,);
      activePageTitle = "Your FAvourites";
     }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:  MainDrawer(),
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