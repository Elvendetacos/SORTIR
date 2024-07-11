import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import '../../layout/layout_forms.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      title: 'Login',
      children:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 46),
          const TextFormInput(hintText: 'Email', type: 'email', width: 0.9,),
          const SizedBox(height: 46),
          const TextFormInput(hintText: 'Password', type: 'password', width: 0.9,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const ActionButton(navigateTo: 'login', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white),
        ],
      ),
    );
  }
}