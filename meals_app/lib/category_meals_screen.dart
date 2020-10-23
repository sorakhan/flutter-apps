import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
  final categoryTitle = routeArgs['title'];
  // final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Text('Test page for meals'),
      ),
    );
  }
}
