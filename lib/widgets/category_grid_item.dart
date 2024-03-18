import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
 const CategoryGridItem({
  super.key,
  required this.category,
 }
 );

 final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.44),
              category.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
               ),
               child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge,
               ),
    );
  }
}