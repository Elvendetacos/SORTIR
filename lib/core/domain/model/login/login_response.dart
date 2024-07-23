class LoginResponse{
  final String jwtToken;
  final int id;

  LoginResponse({
    required this.jwtToken,
    required this.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['jwtToken'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jwtToken': jwtToken,
      'id': id,
    };
  }
}