import 'package:flutter/material.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/core/domain/model/user_request.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:provider/provider.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';

class MoreInformation extends StatefulWidget {
  const MoreInformation({Key? key}) : super(key: key);

  @override
  _MoreInformationState createState() => _MoreInformationState();
}

class _MoreInformationState extends State<MoreInformation> {
  final List<String> cities = ['Coita', 'Tuxtla', 'Suchiapa', 'San Cristobal', 'Copoya']; // Lista de ciudades
  String? selectedCity;
  int? selectedAge;
  final UseCase useCase = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutForms(
        title: 'More Information',
        children: Column(
          children:[
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<int>(
                  hint: Text('Select Age', style: TextStyle(color: Color(0xff828693), fontSize: 19)),
                  value: selectedAge,
                  items: List<int>.generate(48, (i) => i + 18).map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString(), style: TextStyle(color: Color(0xff828693), fontSize: 19)),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedAge = newValue;
                    });
                  },
                ),
                DropdownButton<String>(
                  hint: Text('Select City', style: TextStyle(color: Color(0xff828693), fontSize: 19)),
                  value: selectedCity,
                  items: cities.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city, style: TextStyle(color: Color(0xff828693), fontSize: 19)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCity = newValue;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ActionButton(
                navigateTo: 'preferences',
                content: 'CONTINUE',
                color: Color(0xff9747FF),
                txtColor: Colors.white,
                onPressed: () async {
                  print("more information");
                  print("Selected age: $selectedAge");
                  print("Selected city: $selectedCity");
                  Provider.of<RegistrationProvider>(context, listen: false).updateCityAndMore(selectedCity!, selectedAge!);
                  Navigator.pushNamed(context, 'image');
                },
              ),
          ]
        ),
      ),
    );
  }
}