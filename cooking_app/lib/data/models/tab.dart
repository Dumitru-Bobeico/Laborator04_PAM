class Tab {
  final String name;
  final bool active;

  Tab({required this.name, required this.active});

  factory Tab.fromJson(Map<String, dynamic> json) =>
      Tab(name: json["name"], active: json["active"]);
}
