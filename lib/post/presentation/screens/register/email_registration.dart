import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class EmailRegistration extends StatelessWidget{
  const EmailRegistration({super.key});

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
          const TextFormInput(hintText: 'My email is...', type: 'email', width: 0.9, keyboardType: TextInputType.emailAddress,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const ActionButton(navigateTo: 'password', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white),
        ],
      )
    );
  }

}