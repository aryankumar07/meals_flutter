import 'package:flutter/material.dart';
import 'package:mealapp/categories.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/filters.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/meal_data.dart';
import 'package:mealapp/meals.dart';

const KinitialFilters ={
    Filters.LactoseFree : false,
    Filters.glutenFree  : false,
    Filters.vegan:false,
    Filters.vegetarian:false,
};  

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
  Map<Filters,bool> _selectedFilter = KinitialFilters;

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
          builder: (ctx) => FiltersScreen(cuurentFilters: _selectedFilter,))
          );
          setState(() {
          _selectedFilter = result ??  KinitialFilters;
          }); 
    }
    
  }


  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal) {
      if(_selectedFilter[Filters.glutenFree]! && meal.isGlutenFree){
        return false;
      }
      if(_selectedFilter[Filters.LactoseFree]! && meal.isLactoseFree){
        return false;
      }
      if(_selectedFilter[Filters.vegan]! && meal.isVegan){
        return false;
      }
      if(_selectedFilter[Filters.vegetarian]! && meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();

    
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
    Widget activePage = CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,
    availableMeals: availableMeals,);

     if(_selectedPage == 1){
      activePage = MealsScreen(title: "Favourites", meals: _favouriteMeals,onToggleFavourite: _toggleMealFavouriteStatus,);
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