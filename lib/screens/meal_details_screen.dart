import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_list_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meals, required this.toggleMealFavoriteStatus});

  final Meal meals;
  final Function(Meal meal) toggleMealFavoriteStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                toggleMealFavoriteStatus(meals);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: ListView(children: [
        FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: Image.network(meals.imageUrl).image),
        const SizedBox(
          height: 12,
        ),
        MealsListWidget(
          listData: meals.ingredients,
          data: "ingredients",
        ),
        MealsListWidget(
          listData: meals.steps,
          data: "steps",
        )
      ]),
    );
  }
}
