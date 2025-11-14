import 'package:cooking_app/data/datasources/api_data_source.dart';
import 'package:cooking_app/data/repositories/recipe_repository_impl.dart';
import 'package:cooking_app/domain/repositories/recipe_repository.dart';
import 'package:cooking_app/domain/usecases/get_feed.dart';
import 'package:cooking_app/domain/usecases/get_recipe_details.dart';
import 'package:cooking_app/presentation/controllers/details_controller.dart';
import 'package:cooking_app/presentation/controllers/recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cooking_app/presentation/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ApiDataSource());
    Get.put<RecipeRepository>(RecipeRepositoryImpl(apiDataSource: Get.find()));
    Get.put(GetFeed(Get.find()));
    Get.put(GetRecipeDetails(Get.find()));
    Get.put(RecipeController(getFeed: Get.find()));
    Get.put(DetailsController(getRecipeDetails: Get.find()));
    return GetMaterialApp(home: MainPage());
  }
}
