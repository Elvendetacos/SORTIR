import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:provider/provider.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';

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
    return passwordValue == repeatPasswordValue && passwordValue.isNotEmpty;
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return !upperCase.hasMatch(passwordValue) ? const Text('Password must contain at least one uppercase letter', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox();
                case 1:
                  return !lowerCase.hasMatch(passwordValue) ? const Text('Password must contain at least one lowercase letter', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox();
                case 2:
                  return !digit.hasMatch(passwordValue) ? const Text('Password must contain at least one digit', style: TextStyle(color: Colors.red, fontSize: 13.5)) : const SizedBox();
                default:
                  return const SizedBox();
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ActionButton(
            navigateTo: 'gender',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () {
              if (validatePasswords()) {
                Provider.of<RegistrationProvider>(context, listen: false).updatePassword(passwordValue);
                Navigator.pushNamed(context, "gender");
              } else {
                setState(() {
                  showText = true;
                });
                // Show an error message
              }
            },
          ),
          const SizedBox(height: 20),
          showText ?
          const Text('Las contraseñas no coinciden', style: TextStyle(color: Colors.redAccent)) :
          const SizedBox.shrink(),
        ],
      )
    );
  }
}