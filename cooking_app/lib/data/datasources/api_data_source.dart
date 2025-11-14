import 'dart:convert';
import 'package:cooking_app/data/models/feed.dart';
import 'package:cooking_app/data/models/feed_details.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  final String _baseUrl = 'https://test-api-jlbn.onrender.com/v2';

  Future<Feed> getFeed() async {
    final response = await http.get(Uri.parse('$_baseUrl/feed'));

    if (response.statusCode == 200) {
      return Feed.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load feed');
    }
  }

  Future<FeedDetails> getRecipeDetails() async {
    final response = await http.get(Uri.parse('$_baseUrl/feed/details'));

    if (response.statusCode == 200) {
      return FeedDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load recipe details');
    }
  }
}
