import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';

class FoodTitleWithReviews extends StatelessWidget {
  final String titleLine1;
  final String titleLine2;
  final String reviewsCount;

  const FoodTitleWithReviews({
    super.key,
    required this.titleLine1,
    required this.titleLine2,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  titleLine1,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '($reviewsCount Reviews)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  color: AppColors.gray3,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Text(
            titleLine2,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
