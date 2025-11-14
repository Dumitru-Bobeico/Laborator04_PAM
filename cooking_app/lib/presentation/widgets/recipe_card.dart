import 'package:cooking_app/data/models/feed_recipe.dart';
import 'package:cooking_app/presentation/controllers/details_controller.dart';
import 'package:cooking_app/presentation/pages/second_page.dart';
import 'package:cooking_app/presentation/resources/app_icons.dart';
import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class _ImageWithRating extends StatelessWidget {
  final double diameter;
  final String imageUrl;
  final double rating;

  const _ImageWithRating({
    required this.diameter,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(child: Image.network(imageUrl, fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 75,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
            decoration: BoxDecoration(
              color: AppColors.secondary20,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.star, width: 10, height: 10),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final FeedRecipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 150.0;
    const double imageDiameter = 110.0;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.find<DetailsController>().loadFeedDetails();
        Get.to(() => SecondPage());
      },
      child: SizedBox(
        width: cardWidth,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: imageDiameter / 3),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColors.gray4,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: imageDiameter / 2),
                    Text(
                      recipe.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Time',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              recipe.time,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.bookmarkGrayIcon,
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _ImageWithRating(
              diameter: imageDiameter,
              imageUrl: recipe.image,
              rating: recipe.rating,
            ),
          ],
        ),
      ),
    );
  }
}
