import 'package:sortir/core/domain/model/category/category_item.dart';
import 'package:sortir/core/domain/model/interest/interest_send.dart';
import 'package:sortir/core/domain/model/interest_request.dart';

class UserResponse{
  final int id;
  final String name;
  final int phone;
  final int age;
  final String gender;
  final String city;
  final String profileUrl;
  final String frontPageUrl;
  final List<InterestRequest> interests;

  UserResponse({
    required this.id,
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.city,
    required this.profileUrl,
    required this.frontPageUrl,
    required this.interests,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      age: json['age'],
      gender: json['gender'],
      city: json['city'],
      profileUrl: json['profileUrl'],
      frontPageUrl: json['frontPageUrl'],
      interests: json['interests'].map<InterestRequest>((interest) => InterestRequest.fromJson(interest)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'city': city,
      'profileUrl': profileUrl,
      'frontPageUrl': frontPageUrl,
      'interests': interests.map((interest) => interest.toJson()).toList(),
    };
  }
}