import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/widgets/meal_list_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meals});

  final Meal meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isFavoriteMeal = ref.watch(favoriteMealsProvider.notifier).isFavourite(meals);
    final favMeal = ref.watch(favoriteMealsProvider);
    final isFavourite = favMeal.contains(meals) ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meals);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as favorite'
                        : 'Meal removed as Favorite'),
                  ),
                );
                // toggleMealFavoriteStatus(meals);
              },
              icon: isFavourite
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border))
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
