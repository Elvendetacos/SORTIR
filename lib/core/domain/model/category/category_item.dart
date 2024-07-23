class CategoryItem{
  final int id;
  final String name;
  final List<String> activities;
  final String imageUrl;

  CategoryItem({
    required this.id,
    required this.name,
    required this.activities,
    required this.imageUrl,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      activities: json['activities'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'activities': activities,
      'imageUrl': imageUrl,
    };
  }

}