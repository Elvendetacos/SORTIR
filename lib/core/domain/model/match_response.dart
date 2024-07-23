import 'package:sortir/core/domain/model/interest_request.dart';

class Recommendation {
  final int age;
  final String city;
  final String frontPageUrl;
  final String gender;
  final int id;
  final List<InterestRequest> interests;
  final String name;
  final int phone;
  final String profileUrl;
  final double similitud;

  Recommendation({
    required this.age,
    required this.city,
    required this.frontPageUrl,
    required this.gender,
    required this.id,
    required this.interests,
    required this.name,
    required this.phone,
    required this.profileUrl,
    required this.similitud,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      age: json['age'],
      city: json['city'],
      frontPageUrl: json['frontPageUrl'],
      gender: json['gender'],
      id: json['id'],
      interests: (json['interests'] as List).map((i) => InterestRequest.fromJson(i)).toList(),
      name: json['name'],
      phone: json['phone'],
      profileUrl: json['profileUrl'],
      similitud: json['similitud'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'city': city,
      'frontPageUrl': frontPageUrl,
      'gender': gender,
      'id': id,
      'interests': interests.map((interest) => interest.toJson()).toList(),
      'name': name,
      'phone': phone,
      'profileUrl': profileUrl,
      'similitud': similitud,
    };
  }
}
