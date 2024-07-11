class LoginResponse{
  final String jwtToken;
  final String username;

  LoginResponse({
    required this.jwtToken,
    required this.username,
  });
}