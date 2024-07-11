import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import '../../layout/layout_forms.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  final String emailValue = '';
  final String passwordValue = '';

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      title: 'Login',
      children:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 46),
          TextFormInput(
            hintText: 'Email',
            type: 'email',
            width: 0.9,
            onChanged: (emailValue){
              print(emailValue);}
            ,),
          const SizedBox(height: 46),
          TextFormInput(
            hintText: 'Password',
            type: 'password',
            width: 0.9,
            onChanged: (passwordValue){
              print(passwordValue);}
            ,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const ActionButton(navigateTo: 'login', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white),
        ],
      ),
    );
  }
}