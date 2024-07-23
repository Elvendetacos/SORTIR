class InterestSend{
  final String description;
  final List<String> activities;

  InterestSend({
    required this.description,
    required this.activities,
  });

  factory InterestSend.fromJson(Map<String, dynamic> json) {
    return InterestSend(
      description: json['description'],
      activities: List<String>.from(json['activities']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'activities': activities,
    };
  }
}