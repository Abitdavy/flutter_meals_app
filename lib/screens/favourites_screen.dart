import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favourite;

  FavouritesScreen(this.favourite);

  @override
  Widget build(BuildContext context) {
    if (favourite.isEmpty) {
      return Center(
        child: Text('No favourites Yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favourite[index].id,
            title: favourite[index].title,
            imageUrl: favourite[index].imageUrl,
            duration: favourite[index].duration,
            complexity: favourite[index].complexity,
            affordability: favourite[index].affordability,
            deleteItem: () {},
          );
        },
        itemCount: favourite.length,
      );
    }
    ;
  }
}
