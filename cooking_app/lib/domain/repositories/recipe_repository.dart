import 'package:cooking_app/data/models/feed.dart';
import 'package:cooking_app/data/models/feed_details.dart';

abstract class RecipeRepository {
  Future<Feed> getFeed();
  Future<FeedDetails> getRecipeDetails();
}
