import 'package:sortir/core/domain/model/category/category_item.dart';
import 'package:sortir/core/domain/model/interest/interest_send.dart';
import 'package:sortir/core/domain/model/login/login_request.dart';
import 'package:sortir/core/domain/model/login/login_response.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/core/domain/model/user/user_response.dart';
import 'package:sortir/core/domain/model/user/events_response.dart';
import 'package:sortir/core/domain/model/user_request.dart';

abstract class UseCase{
  Future<LoginResponse> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  Future<RegisterResponse> register(UserRequest userRequest) {
    throw UnimplementedError();
  }

  Future<UserResponse> getUser(int id, String jwtToken) {
    throw UnimplementedError();
  }

  Future<EventsResponse> getEvent(int id){
    throw UnimplementedError();
  }

  Future<List<CategoryItem>> getCategories(){
    throw UnimplementedError();
  }

  Future<List<InterestSend>> sendCategories(List<InterestSend> interests, int id){
    throw UnimplementedError();
  }

  Future<List<UserResponse>> getRecommendations(String city, int id){
    throw UnimplementedError();
  }
}