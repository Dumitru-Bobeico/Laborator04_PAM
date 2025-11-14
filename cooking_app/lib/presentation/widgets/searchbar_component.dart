import 'package:cooking_app/presentation/resources/app_icons.dart';
import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarComponent extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String placeholder;

  const SearchBarComponent({
    super.key,
    this.onChanged,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 255,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.gray4, width: 1.3),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset('assets/images/search-normal.svg'),
                ),
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    style: const TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: TextStyle(
                        color: AppColors.gray4,
                        fontSize: 11,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 5, bottom: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 40,
              height: 40,
              color: AppColors.primary100,
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.settingsSvg,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
