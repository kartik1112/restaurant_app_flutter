import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters.dart';
// import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = "Categories";
  final List<Meal> _favoriteMeals = [];

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = (_favoriteMeals.contains(meal)) ? true : false;
    (isExisting) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    setState(() {
      _favoriteMeals;
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectScreen(String identifier) async {
    if (identifier == "filters") {
      Navigator.pop(context);
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      ); 
    }
  }

  // Navigator.pop(context);
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => MealsScreen(
  //             meals: _favoriteMeals,
  //             title: "Meals",
  //             toggleMealFavoriteStatus: toggleMealFavoriteStatus),
  //     `  ),
  //     );

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleMealFavoriteStatus: toggleMealFavoriteStatus,
    );
    activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        toggleMealFavoriteStatus: toggleMealFavoriteStatus,
        meals: _favoriteMeals,
      );
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
        ],
      ),
    );
  }
}
