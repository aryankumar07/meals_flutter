import 'package:flutter/material.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/tabs.dart';
import 'package:mealapp/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FiltersScreen extends ConsumerWidget{

  FiltersScreen({super.key,});




  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final activeFilter = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body:
        Column(
          children: [ 
            SwitchListTile(
              value: activeFilter[Filters.glutenFree]!,
             onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, isChecked);
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
              value: activeFilter[Filters.LactoseFree]!,
             onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.LactoseFree, isChecked);
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
              value: activeFilter[Filters.vegetarian]!,
             onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked);
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
              value: activeFilter[Filters.vegan]!,
             onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked);
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
    );
  }
}