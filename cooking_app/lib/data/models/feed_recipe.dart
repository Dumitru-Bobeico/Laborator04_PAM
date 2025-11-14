class FeedRecipe {
  final int id;
  final String name;
  final double rating;
  final String time;
  final bool isBookmarked;
  final String image;

  FeedRecipe({
    required this.id,
    required this.name,
    required this.rating,
    required this.time,
    required this.isBookmarked,
    required this.image,
  });

  factory FeedRecipe.fromJson(Map<String, dynamic> json) => FeedRecipe(
    id: json["id"],
    name: json["name"],
    rating: json["rating"].toDouble(),
    time: json["time"],
    isBookmarked: json["is_bookmarked"],
    image: json["image"],
  );
}
