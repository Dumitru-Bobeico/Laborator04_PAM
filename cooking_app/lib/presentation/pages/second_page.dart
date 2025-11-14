import 'package:cooking_app/presentation/controllers/details_controller.dart';
import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:cooking_app/presentation/widgets/back_to_menu.dart';
import 'package:cooking_app/presentation/widgets/food_card.dart';
import 'package:cooking_app/presentation/widgets/food_title.dart';
import 'package:cooking_app/presentation/widgets/ingredient_widget.dart';
import 'package:cooking_app/presentation/widgets/serve_items_display.dart';
import 'package:cooking_app/presentation/widgets/user_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.feedDetails.value == null) {
            return Center(child: Text('No data available'));
          }

          final details = controller.feedDetails.value!;
          final cookTime =
              int.tryParse(details.recipe.cookTime.split(' ').first) ?? 0;

          return Column(
            children: [
              const BackToMenuBar(),
              FoodCard(
                imageUrl: details.recipe.image,
                rating: details.recipe.rating,
                timeInMinutes: cookTime,
                isBookmarked: details.recipe.isBookmarked,
              ),
              const SizedBox(height: 15),
              FoodTitleWithReviews(
                titleLine1: details.recipe.title,
                titleLine2: '',
                reviewsCount: details.recipe.reviews,
              ),
              UserProfileStaticHeader(
                userName: details.chef.name,
                location: details.chef.location,
                profileImageUrl: details.chef.profileImage,
                isFollowing: details.chef.isFollowing,
                tabs: details.tabs,
              ),
              const SizedBox(height: 25),
              ServeAndItemsDisplay(
                serves: details.serving.serves,
                items: '${details.serving.totalItems} Items',
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: details.ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = details.ingredients[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: IngredientWidget(
                        imageUrl: ingredient.icon,
                        productName: ingredient.name,
                        weight: ingredient.quantity,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
