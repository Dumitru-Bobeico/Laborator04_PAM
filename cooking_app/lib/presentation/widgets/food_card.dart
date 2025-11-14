import 'package:cooking_app/presentation/resources/app_icons.dart';
import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final int timeInMinutes;
  final bool isBookmarked;

  const FoodCard({
    super.key,
    this.imageUrl = AppIcons.carouselBurger,
    this.rating = 4.0,
    this.timeInMinutes = 20,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 30, right: 30),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(imageUrl, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(0),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 10.0,
                right: 10.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2.5,
                  ),
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
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            AppIcons.clockWatch,
                            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '$timeInMinutes min',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          isBookmarked ? AppIcons.bookmarkIcon : AppIcons.bookmarkGrayIcon,
                          width: 16,
                          height: 16,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
