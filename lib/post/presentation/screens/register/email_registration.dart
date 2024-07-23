import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:provider/provider.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';

class EmailRegistration extends StatefulWidget {
  const EmailRegistration({super.key});

  @override
  _EmailRegistrationState createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  String emailValue = '';
  bool showText = false;
  RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  bool validateEmail() {
    return emailRegex.hasMatch(emailValue);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 1,
      title: 'Email',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 28),
          TextFormInput(
            hintText: 'My email is...',
            type: 'email',
            width: 0.9,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
              setState(() {
                emailValue = value;
              });
            }
          ),
          const SizedBox(height: 10),
          !emailRegex.hasMatch(emailValue) ? Text('El correo electrónico no es válido', style: TextStyle(color: Colors.redAccent)) : SizedBox.shrink(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ActionButton(
            navigateTo: 'password',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: (){
              if (validateEmail()) {
                Provider.of<RegistrationProvider>(context, listen: false).updateEmail(emailValue);
                Navigator.pushNamed(context, "password");
              } else {
                // Show an error message
                setState(() {
                  showText = true;
                });
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      )
    );
  }
}