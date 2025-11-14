import 'package:cooking_app/data/models/feed_details.dart';
import 'package:cooking_app/domain/repositories/recipe_repository.dart';

class GetRecipeDetails {
  final RecipeRepository repository;

  GetRecipeDetails(this.repository);

  Future<FeedDetails> call() {
    return repository.getRecipeDetails();
  }
}
