import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/screens/home/events.dart';
import 'package:sortir/post/presentation/screens/init_page.dart';
import 'package:sortir/post/presentation/screens/login/login.dart';
import 'package:sortir/post/presentation/screens/register/email_registration.dart';
import 'package:sortir/post/presentation/screens/register/gender_selector.dart';
import 'package:sortir/post/presentation/screens/register/password_registration.dart';
import 'package:sortir/post/presentation/screens/register/phone_number_registration.dart';
import 'package:sortir/post/presentation/screens/register/verification_registration.dart';
import 'package:sortir/post/presentation/screens/register/username_registration.dart';
import 'package:sortir/post/presentation/screens/register/preferences_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Sortir',
      theme: ThemeData(
        primaryColor: const Color(0xff424242),
        scaffoldBackgroundColor: const Color(0xff111419),
        secondaryHeaderColor: const Color(0xff8C52FF),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff111419),
        ),
      ),
      home: const InitPage(),
      routes: {
        'login': (context) => const Login(),
        'phone_number': (context) => const PhoneNumber(),
        'verification': (context) => const Verification(),
        'username': (context) => const UsernameRegistration(),
        'email': (context) => const EmailRegistration(),
        'password': (context) => const PasswordRegistration(),
        'gender': (context) => const GenderSelector(),
        'preferences': (context) =>  const PreferencesSelector(),
        'events': (context) => const Events(),
      }
    );
  }
}
