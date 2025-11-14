import 'package:cooking_app/data/datasources/api_data_source.dart';
import 'package:cooking_app/data/models/feed.dart';
import 'package:cooking_app/data/models/feed_details.dart';
import 'package:cooking_app/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final ApiDataSource apiDataSource;

  RecipeRepositoryImpl({required this.apiDataSource});

  @override
  Future<Feed> getFeed() {
    return apiDataSource.getFeed();
  }

  @override
  Future<FeedDetails> getRecipeDetails() {
    return apiDataSource.getRecipeDetails();
  }
}
