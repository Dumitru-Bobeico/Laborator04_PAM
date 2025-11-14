import 'package:cooking_app/presentation/resources/colors.dart';
import 'package:flutter/material.dart';

class RecipeFilterBar extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String>? onSelected;

  const RecipeFilterBar({super.key, required this.categories, this.onSelected});

  @override
  State<RecipeFilterBar> createState() => _RecipeFilterBarState();
}

class _RecipeFilterBarState extends State<RecipeFilterBar> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final category = widget.categories[index];
            final isSelected = category == selectedCategory;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
                widget.onSelected?.call(category);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary100 : AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? AppColors.primary100 : AppColors.white,
                    width: 1.2,
                  ),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? AppColors.white
                          : AppColors.primary100,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
