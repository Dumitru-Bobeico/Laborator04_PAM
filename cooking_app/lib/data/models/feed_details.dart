import 'package:cooking_app/data/models/chef.dart';
import 'package:cooking_app/data/models/ingredient.dart';
import 'package:cooking_app/data/models/recipe.dart';
import 'package:cooking_app/data/models/serving.dart';
import 'package:cooking_app/data/models/tab.dart';

class FeedDetails {
  final Recipe recipe;
  final Chef chef;
  final List<Tab> tabs;
  final Serving serving;
  final List<Ingredient> ingredients;

  FeedDetails({
    required this.recipe,
    required this.chef,
    required this.tabs,
    required this.serving,
    required this.ingredients,
  });

  factory FeedDetails.fromJson(Map<String, dynamic> json) => FeedDetails(
        recipe: Recipe.fromJson(json["recipe"]),
        chef: Chef.fromJson(json["chef"]),
        tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
        serving: Serving.fromJson(json["serving"]),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );
}
