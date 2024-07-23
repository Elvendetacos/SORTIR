import 'package:flutter/foundation.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/domain/model/user_request.dart';

class RegistrationProvider extends ChangeNotifier {
  final UseCase useCase;
  final UserRequest registrationData = UserRequest();

  RegistrationProvider({required this.useCase});

  void updatePhoneNumber(String phoneNumber) {
    print("phone number");
    print(phoneNumber);
    registrationData.phone = phoneNumber;
    notifyListeners();
  }


  void updateName(String name, String lastName) {
    registrationData.name = '$name $lastName';
    notifyListeners();
  }

  void updateEmail(String email) {
    registrationData.email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    registrationData.password = password;
    notifyListeners();
  }

  void updateGender(String gender){
    registrationData.gender = gender;
    notifyListeners();
  }

  void updateCityAndMore(String city, int age){
    registrationData.age = age;
    registrationData.city = city;
    notifyListeners();
  }

  void updateFile(String file){
    registrationData.file = file;
    notifyListeners();
  }

  void updateFrontPage(String frontPage){
    registrationData.frontPage = frontPage;
    notifyListeners();
  }

  UserRequest getRegistrationData() {
    return registrationData;
  }

  Future<RegisterResponse> register() async {
    return await useCase.register(registrationData);
  }

}