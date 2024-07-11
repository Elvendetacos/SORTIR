import 'package:sortir/core/domain/model/login/login_request.dart';
import 'package:sortir/core/domain/model/login/login_response.dart';

abstract class UseCase{
  Future<LoginResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}