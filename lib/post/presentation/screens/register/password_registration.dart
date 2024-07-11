import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class PasswordRegistration extends StatelessWidget{
  const PasswordRegistration({super.key});
  final String passwordValue = '';
  final String repeatPasswordValue = '';

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
          TextFormInput(
            hintText: 'My password is...',
            type: 'password',
            width: 0.9,
            onChanged: (passwordValue){
              print(passwordValue);
            },
          ),
          const SizedBox(height: 28),
          TextFormInput(
              hintText: 'Repeat my password is...',
              type: 'password',
              width: 0.9,
              onChanged: (repeatPasswordValue){
                print(repeatPasswordValue);
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ActionButton(
            navigateTo: 'gender',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () {  }
            ,),
        ],
      )
    );
  }

}