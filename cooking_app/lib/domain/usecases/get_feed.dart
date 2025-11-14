import 'package:cooking_app/data/models/feed.dart';
import 'package:cooking_app/domain/repositories/recipe_repository.dart';

class GetFeed {
  final RecipeRepository repository;

  GetFeed(this.repository);

  Future<Feed> call() {
    return repository.getFeed();
  }
}
