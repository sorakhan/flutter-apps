import 'package:flutter/material.dart';
import './categories_screen.dart';
import './category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Meals',
      home: CategoriesScreen(), // loads main page of app
      theme: ThemeData(primaryColor: Colors.green),
      routes: {
        '/category-meals': (ctx) => CategoryMealsScreen()
      },
    );
  }
}