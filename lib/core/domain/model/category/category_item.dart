class CategoryItem{
  final int id;
  final String name;
  final List<String> activities;
  final String imageUrl;
  bool selected;
  Map<String, bool> selectedActivities;

  CategoryItem({
    required this.id,
    required this.name,
    required this.activities,
    required this.imageUrl,
    this.selected = false,
    Map<String, bool>? selectedActivities,
  }) : this.selectedActivities = selectedActivities ?? {};

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      activities: List<String>.from(json['activities']),
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