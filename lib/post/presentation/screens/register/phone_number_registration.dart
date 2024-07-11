import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('AR');

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 1,
      title: 'Phone Number',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          const SizedBox(height: 15),
           Row(
            children: [
              const Spacer(),
              CountryPickerDropdown(
                initialValue: 'MX',
                dropdownColor: const Color(0xff474850),
                itemBuilder: _buildDropdownItem,
                itemFilter: (c) => ['AR', 'BO', 'BR', 'CA', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'SV', 'GL', 'GT', 'GY', 'HT', 'HN', 'JM', 'MX', 'NI', 'PA', 'PY', 'PE', 'PR', 'BL', 'KN', 'LC', 'MF', 'PM', 'VC', 'SR', 'TT', 'US', 'UY', 'VE'].contains(c.isoCode),
                sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                onValuePicked: (Country country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle:  TextStyle(color: Colors.grey),
                    enabledBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff828693)),
                    ),
                    focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 19),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text('This phone number will not be visible  unless you change your mind, this option is configurable later.', style: TextStyle(color: Color(0xff828693), fontSize: 13.59),),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          ActionButton(
            navigateTo: 'verification',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () {  }
            ,)
        ]
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        const SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})", style: const TextStyle(color: Colors.white, fontSize: 19),)
      ],
    ),
  );
}