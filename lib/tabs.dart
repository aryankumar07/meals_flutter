import 'package:flutter/material.dart';
import 'package:mealapp/categories.dart';
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

    Widget activePage = CategoriesScreen();
    String activePageTitle = "Categories";

     if(_selectedPage == 1){
      activePage = MealsScreen(title: "Favourites", meals: []);
      activePageTitle = "Your FAvourites";
     }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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