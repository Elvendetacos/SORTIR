import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class PasswordRegistration extends StatefulWidget {
  const PasswordRegistration({super.key});

  @override
  _PasswordRegistrationState createState() => _PasswordRegistrationState();
}

class _PasswordRegistrationState extends State<PasswordRegistration> {
  String passwordValue = '';
  String repeatPasswordValue = '';
  bool showText = false;
  RegExp upperCase = RegExp(r'[A-Z]');
  RegExp lowerCase = RegExp(r'[a-z]');
  RegExp digit = RegExp(r'\d');

  bool validatePasswords() {
    return passwordValue == repeatPasswordValue && passwordValue.isNotEmpty && passwordValue.length >= 8;
  }

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
            onChanged: (value){
              setState(() {
                passwordValue = value;
              });
            },
          ),

          const SizedBox(height: 28),
          TextFormInput(
              hintText: 'Repeat my password is...',
              type: 'password',
              width: 0.9,
              onChanged: (value){
                setState(() {
                  repeatPasswordValue = value;
                });
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ActionButton(
            navigateTo: 'gender',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () {
              if (validatePasswords()) {
                // Navigate to the next screen
              } else {
                // Show an error message
              }
            },
          ),
          showText ?
          const Text('Las contraseñas no coinciden o son demasiado cortas') :
          const SizedBox.shrink(),
          !upperCase.hasMatch(passwordValue) ? const Text('Password must contain at least one uppercase letter', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox(),
          !lowerCase.hasMatch(passwordValue) ? const Text('Password must contain at least one lowercase letter', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox(),
          !digit.hasMatch(passwordValue) ? const Text('Password must contain at least one digit', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox(),
        ],
      )
    );
  }
}