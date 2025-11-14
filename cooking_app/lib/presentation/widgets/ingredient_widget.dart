import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String weight;

  const IngredientWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 16.0),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              child: Image.network(imageUrl, fit: BoxFit.scaleDown),
            ),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Text(
              productName,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(right: 15),
            child: Text(
              weight,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}