import 'package:cooking_app/data/models/filters.dart';
import 'package:cooking_app/data/models/new_recipe.dart';
import 'package:cooking_app/data/models/feed_recipe.dart';
import 'package:cooking_app/data/models/user.dart';

class Feed {
  final User user;
  final Filters filters;
  final List<FeedRecipe> recipes;
  final List<NewRecipe> newRecipes;

  Feed({
    required this.user,
    required this.filters,
    required this.recipes,
    required this.newRecipes,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        user: User.fromJson(json["user"]),
        filters: Filters.fromJson(json["filters"]),
        recipes: List<FeedRecipe>.from(
            json["recipes"].map((x) => FeedRecipe.fromJson(x))),
        newRecipes: List<NewRecipe>.from(
            json["new_recipes"].map((x) => NewRecipe.fromJson(x))),
      );
}
