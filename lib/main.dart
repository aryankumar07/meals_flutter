import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/categories.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/meals.dart';
import 'package:mealapp/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(ProviderScope(
    child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabScreen(),
    ); 
  }
}