import 'package:flutter/material.dart';

import './dummy_data.dart';
import './widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Meals'),),
      body: GridView(
        padding: const EdgeInsets.all(30),
        children: DUMMY_CATEGORIES.map(
          (category) {
            return CategoryItem(category.id, category.title, category.color);
          },
        ).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
