import 'package:sortir/core/domain/model/login/login_request.dart';

import 'package:sortir/core/domain/model/login/login_response.dart';

import '../../domain/use cases/use_case.dart';

class Service implements UseCase{
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
