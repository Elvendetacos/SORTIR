class InterestRequest{
  final String id;
  final String description;
  final List<String> activities;

  InterestRequest({
    required this.id,
    required this.description,
    required this.activities,
  });

  factory InterestRequest.fromJson(Map<String, dynamic> json) {
    return InterestRequest(
      id: json['id'],
      description: json['description'],
      activities: json['activities'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'activities': activities,
    };
  }
}