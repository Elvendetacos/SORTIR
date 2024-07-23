class LoginResponse{
  final String jwtToken;
  final String username;
  final int id;

  LoginResponse({
    required this.jwtToken,
    required this.username,
    required this.id,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['jwtToken'],
      username: json['username'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jwtToken': jwtToken,
      'username': username,
      'id': id,
    };
  }
}