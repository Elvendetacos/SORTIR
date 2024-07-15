import 'package:sortir/core/domain/model/login/login_request.dart';
import 'package:sortir/core/domain/model/login/login_response.dart';
import 'package:sortir/core/infraestructure/enviroments/enviroments.dart';
import '../../domain/use cases/use_case.dart';
import 'package:dio/dio.dart';

class Service implements UseCase{
  final Dio _dio = Dio();
  @override
  Future<LoginResponse> login(String email, String password) async {
    print('email');
    print(email);
    print('password');
    print(password);
    try {
      final response = await _dio.post(
        'http://Sortir-load-balancer-391724916.us-east-1.elb.amazonaws.com/auth/signIn',
        data: {
          'email': email,
          'password': password,
        },
      );

      print('Response data: ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      return LoginResponse(jwtToken: '', username: '');
    }
  }
}
