import 'package:flutter/material.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/tabs.dart';

enum Filters {
  glutenFree,
  LactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget{

  FiltersScreen({super.key,
  required this.cuurentFilters,
  });

  final Map<Filters,bool> cuurentFilters;


  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }


}

class _FilterScreenState extends State<FiltersScreen>{

  var _GlutenFreeFilterSet = false;
  var _LactoseFreeFilterSet = false;
  var _VegetarianFilterSet = false;
  var _VeganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _GlutenFreeFilterSet = widget.cuurentFilters[Filters.glutenFree]!;
    _LactoseFreeFilterSet = widget.cuurentFilters[Filters.LactoseFree]!;
    _VegetarianFilterSet = widget.cuurentFilters[Filters.vegetarian]!;
    _VeganFilterSet = widget.cuurentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelecScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier=="meal"){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((ctx) => TabScreen())) );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.LactoseFree : _LactoseFreeFilterSet,
            Filters.glutenFree : _GlutenFreeFilterSet,
            Filters.vegetarian : _VegetarianFilterSet,
            Filters.vegan : _VeganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [ 
            SwitchListTile(
              value: _GlutenFreeFilterSet,
             onChanged: (isChecked){
              setState(() {
                _GlutenFreeFilterSet = isChecked; 
              });
             },
            title: Text("Gluten-Free",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            subtitle: Text(
              "Only Include Gluten-Free Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.onBackground
            ),
            ), 
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
             
            ),
            SwitchListTile(
              value: _LactoseFreeFilterSet,
             onChanged: (isChecked){
              setState(() {
                _LactoseFreeFilterSet = isChecked; 
              });
             },
            title: Text("Lactose-Free",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            subtitle: Text(
              "Only Include Lactose-Free Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.onBackground
            ),
            ), 
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
             
            ),
            SwitchListTile(
              value: _VegetarianFilterSet,
             onChanged: (isChecked){
              setState(() {
                _VegetarianFilterSet = isChecked; 
              });
             },
            title: Text("Vegetarian",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            subtitle: Text(
              "Only Include Vegetarian Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.onBackground
            ),
            ), 
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
             
            ),
            SwitchListTile(
              value: _VeganFilterSet,
             onChanged: (isChecked){
              setState(() {
                _VeganFilterSet = isChecked; 
              });
             },
            title: Text("Vegan",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            subtitle: Text(
              "Only Include Vegan Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.onBackground
            ),
            ), 
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
             
            ),
          ],
        ),
      ),
    );
  }
}