import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class PasswordRegistration extends StatelessWidget{
  const PasswordRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 2,
      title: 'Password',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 28),
          const TextFormInput(hintText: 'My password is...', type: 'password', width: 0.9),
          const SizedBox(height: 28),
          const TextFormInput(hintText: 'Repeat my password is...', type: 'password', width: 0.9),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const ActionButton(navigateTo: 'gender', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white),
        ],
      )
    );
  }

}