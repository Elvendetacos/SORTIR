import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class MoreInformation extends StatefulWidget {
  const MoreInformation({Key? key}) : super(key: key);

  @override
  _MoreInformationState createState() => _MoreInformationState();
}

class _MoreInformationState extends State<MoreInformation> {
  final String city = '';
  int? selectedAge; // Variable para almacenar la edad seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutForms(
        title: 'More Information',
        children: Column(
          children:[
            const SizedBox(height: 28),
            DropdownButton<int>(
              hint: Text('Select Age'),
              value: selectedAge,
              items: List<int>.generate(48, (i) => i + 18).map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedAge = newValue;
                });
              },
            ),
            const SizedBox(height: 28),
            TextFormInput(
                hintText: 'City',
                type: 'other',
                width: 0.9,
                onChanged: (city){
                  print(city);
                }
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ActionButton(
                navigateTo: 'preferences',
                content: 'CONTINUE',
                color: Color(0xff9747FF),
                txtColor: Colors.white,
                onPressed: (){
                  print("more information");
                  print("Selected age: $selectedAge");
                },
              ),
          ]
        ),
      ),
    );
  }
}