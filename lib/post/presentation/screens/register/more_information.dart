import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutForms(
        title: 'More Information',
        children: Column(
          children:[
            const SizedBox(height: 28),
            const TextFormInput(hintText: "Age", type: 'other', width: 0.9, keyboardType: TextInputType.number),
            const SizedBox(height: 28),
            const TextFormInput(hintText: 'City', type: 'other', width: 0.9),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const ActionButton(navigateTo: 'preferences', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white)
          ]
        ),
      ),
    );
  }
}