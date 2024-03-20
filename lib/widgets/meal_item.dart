import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key, 
    required this.meal,
    required this.onSelectmeal,
    });

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectmeal;

  String get ComplexityText {
    return meal.complexity.name[0].toUpperCase() +
      meal.complexity.name.substring(1);
  }
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
      meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) { 
    return Card (
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 3,
       child: InkWell(
    onTap: () {
      onSelectmeal( context, meal);
    },
    child: Stack(
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
           image: NetworkImage(meal.imageUrl),
           fit: BoxFit.cover,
           height: 199,
           width: double.infinity,
           ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
             color: Colors.black54,
             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 43),
             child: Column(
              children: [
                Text(meal.title,
                 maxLines: 3,
                 textAlign: TextAlign.center,
                 softWrap: true,
                 overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                 ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   MealItemtrait(
                      icon: Icons.schedule, 
                      label: '${meal.duration} min',
                      ),
                      const SizedBox(width: 13),
                       MealItemtrait(
                      icon: Icons.work, 
                      label: ComplexityText,
                      ),
                      const SizedBox(width: 13),
                       MealItemtrait(
                      icon: Icons.attach_money,
                      label: affordabilityText,
                      ),
                  ],
                ),
              ],
             ),
            ),
            ),
       ],
      ),
     ),
   );
  }
}