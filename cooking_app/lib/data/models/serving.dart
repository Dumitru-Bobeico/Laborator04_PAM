class Serving {
  final String serves;
  final int totalItems;

  Serving({required this.serves, required this.totalItems});

  factory Serving.fromJson(Map<String, dynamic> json) =>
      Serving(serves: json["serves"], totalItems: json["total_items"]);
}
