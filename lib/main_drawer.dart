import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{


  final void Function(String identifier) onSelecScreen;

  MainDrawer({super.key,
  required this.onSelecScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight, 
              )
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,size: 48,color: Theme.of(context).colorScheme.primary,),
                SizedBox(width: 18,),
                Text("cooking up",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.primary
                ),
                )
              ],
            )),
            ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: Text(
                "meal",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
                ),
              ),
              onTap: () {
                onSelecScreen("meal");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 26,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: Text(
                "Filters",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
                ),
              ),
              onTap: () {
                onSelecScreen("Filters");
              },
            )
        ],
      ),
    );
  }
}