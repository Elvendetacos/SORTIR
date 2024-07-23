import 'package:sortir/core/domain/model/login/login_request.dart';
import 'package:sortir/core/domain/model/login/login_response.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/core/domain/model/user/events_response.dart';
import 'package:sortir/core/domain/model/user/user_response.dart';
import 'package:sortir/core/domain/model/user_request.dart';
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
        'http://sortir-249814840.us-east-1.elb.amazonaws.com/auth/signIn',
        data: {
          'email': email,
          'password': password,
        },
      );

      print('Response data: ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      return LoginResponse(jwtToken: '', id: 0);
    }
  }

  @override
  Future<RegisterResponse> register( UserRequest userRequest) async {
    print("Entre al register");
    print(userRequest.name);
    print(userRequest.email);
    print(userRequest.password);
    print(userRequest.age);
    print(userRequest.gender);
    print(userRequest.city);
    print(userRequest.file);
    print(userRequest.frontPage);
    try{
      var formData = FormData.fromMap({
        "name": userRequest.name,
        "email": userRequest.email,
        "password": userRequest.password,
        "phone": userRequest.phone,
        "age": userRequest.age,
        "gender": userRequest.gender,
        "city": userRequest.city,
        "file": userRequest.file != null ? await MultipartFile.fromFile(userRequest.file!) : null,
        "frontPage": userRequest.frontPage != null ? await MultipartFile.fromFile(userRequest.frontPage!) : null,
      });
      final response = await _dio.post(
        'http://Sortir-load-balancer-391724916.us-east-1.elb.amazonaws.com/auth/signUp',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      print('Response data: ${response.data}');
      return RegisterResponse.fromJson(response.data);
    } catch(e){
      print("ta mal: $e");
      return RegisterResponse(id: 0, name: '', email: '');
    }
  }

  @override
  Future<UserResponse> getUser(int id, String jwtToken) async {
    try {
      final response = await _dio.get(
        'http://Sortir-load-balancer-391724916.us-east-1.elb.amazonaws.com/user/interest/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );

      var userData = response.data['data'];
      print('Response data: $userData');
      return UserResponse.fromJson(userData);
    } catch (e) {
      return UserResponse(id: 0, name: '', phone: 0, age: 0, gender: '', city: '', profileUrl: '', frontPageUrl: '', interests: []);
    }
  }

  @override
  Future<EventsResponse> getEvent(int id) async {
    try{
      final response = await _dio.get(
        'http://Sortir-load-balancer-391724916.us-east-1.elb.amazonaws.com/plan-service/event/$id',
      );
      var userData = response.data['data'];
      print('Response data: $userData');
      return EventsResponse.fromJson(userData);
    } catch(e){
      return EventsResponse(id: 0, title: '', description: '', date: '', latitude: 0, longitude: 0, address: '', categories: [], complete: false);
    }
  }
}
