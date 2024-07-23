import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:provider/provider.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';

class UsernameRegistration extends StatefulWidget {
  const UsernameRegistration({Key? key}) : super(key: key);

  @override
  _UsernameRegistrationState createState() => _UsernameRegistrationState();
}

class _UsernameRegistrationState extends State<UsernameRegistration> {
  String firstName = '';
  String lastName = '';
  bool showText = false;

  bool validateName(String name) {
    RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    return nameRegex.hasMatch(name);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      title: 'Name',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 28),
          TextFormInput(
              hintText: 'My first name is...',
              type: 'text',
              width: 0.9,
              onChanged: (value){
                setState(() {
                  firstName = value;
                });
              }
            ),
          const SizedBox(height: 28),
          TextFormInput(
              hintText: 'My last name is...',
              type: 'text',
              width: 0.9,
              onChanged: (value){
                setState(() {
                  lastName = value;
                });
              }
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9 ,
            child: const Text('This information will be public and this way you will be known in the app.',  style: TextStyle(color: Color(0xff828693), fontSize: 13.59)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ActionButton(
            navigateTo: 'email',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () {
              Provider.of<RegistrationProvider>(context, listen: false).updateName(firstName, lastName);
              Navigator.pushNamed(context, 'email');
            },
          ),
        ],
      ),
    );
  }
}