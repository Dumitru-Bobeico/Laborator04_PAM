class Recipe {
  final int id;
  final String title;
  final double rating;
  final String cookTime;
  final bool isBookmarked;
  final String image;
  final String reviews;

  Recipe({
    required this.id,
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.isBookmarked,
    required this.image,
    required this.reviews,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    title: json["title"],
    rating: json["rating"].toDouble(),
    cookTime: json["cook_time"],
    isBookmarked: json["is_bookmarked"],
    image: json["image"],
    reviews: json["reviews"],
  );
}