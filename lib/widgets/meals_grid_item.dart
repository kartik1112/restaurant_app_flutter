import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:string_capitalize/string_capitalize.dart';

class MealsGridItem extends StatelessWidget {
  MealsGridItem({super.key, required this.meals, required this.screenChange});

  final Meal meals;

  void Function() screenChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          screenChange();
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                decoration: BoxDecoration(color: Colors.black54),
                child: Column(
                  children: [
                    Text(
                      meals.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealItemTrait(
                            dataText: " ${meals.duration} mins",
                            dataIcon: Icons.schedule),
                        MealItemTrait(
                            dataText: " ${meals.complexity.name.capitalize()}",
                            dataIcon: Icons.work),
                        MealItemTrait(
                            dataText:
                                " ${meals.affordability.name.capitalize()}",
                            dataIcon: Icons.attach_money),
                      ],
                    )
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
