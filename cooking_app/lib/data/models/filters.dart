import 'category.dart';

class Filters {
  final String searchPlaceholder;
  final List<Category> categories;

  Filters({required this.searchPlaceholder, required this.categories});

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    searchPlaceholder: json["search_placeholder"],
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
  );
}
