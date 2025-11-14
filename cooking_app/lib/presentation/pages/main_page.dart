import 'package:cooking_app/presentation/controllers/recipe_controller.dart';
import 'package:cooking_app/presentation/widgets/bottom_slider.dart';
import 'package:cooking_app/presentation/widgets/recipe_card_showcase.dart';
import 'package:cooking_app/presentation/widgets/recipe_filter_bar.dart';
import 'package:cooking_app/presentation/widgets/searchbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cooking_app/presentation/widgets/header_component.dart';
import 'package:cooking_app/presentation/resources/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.feed.value == null) {
            return Center(child: Text('No data available'));
          }

          final feed = controller.feed.value!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderComponent(user: feed.user),
              SearchBarComponent(placeholder: feed.filters.searchPlaceholder),
              SizedBox(height: 15),
              RecipeFilterBar(
                categories: feed.filters.categories.map((c) => c.name).toList(),
              ),
              SizedBox(height: 25),
              RecipeCardShowcase(recipes: feed.recipes),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Text(
                  'New Recipes',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              BottomSlider(newRecipes: feed.newRecipes),
            ],
          );
        }),
      ),
    );
  }
}
