class LoginResponse{
  final String jwtToken;
  final String username;

  LoginResponse({
    required this.jwtToken,
    required this.username,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['jwtToken'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jwtToken': jwtToken,
      'username': username,
    };
  }
}