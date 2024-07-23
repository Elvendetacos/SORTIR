import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class PreferencesSelector extends StatefulWidget {
  const PreferencesSelector({Key? key}) : super(key: key);

  @override
  _PreferencesSelectorState createState() => _PreferencesSelectorState();
}

class _PreferencesSelectorState extends State<PreferencesSelector> {
  List<String> preferences = ['assets/images/arco.png', 'assets/images/conos.png', 'assets/images/paris.png', 'assets/images/tree.png', 'assets/images/arco.png', 'assets/images/conos.png', 'assets/images/paris.png', 'assets/images/tree.png', 'assets/images/arco.png', 'assets/images/conos.png', 'assets/images/paris.png', 'assets/images/tree.png', 'assets/images/arco.png', 'assets/images/conos.png', 'assets/images/paris.png', 'assets/images/tree.png'];
  List<String> preferencesNames = ['ARCO', 'CONOS', 'PARIS', 'TREES', 'ARCO', 'CONOS', 'PARIS', 'TREES', 'ARCO', 'CONOS', 'PARIS', 'TREES', 'ARCO', 'CONOS', 'PARIS', 'TREES'];
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(preferences.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
        title: 'My preferences',
        children: Column(
            children:[
              const SizedBox(height: 28),
              Container(
                height: MediaQuery.of(context).size.height * 0.67,
                child: SingleChildScrollView(
                  child: Material(
                    color: const Color(0xff111419),
                    child: Wrap(
                      spacing: 15.0,
                      runSpacing: 18.0,
                      children: preferences.map((String preference) {
                        int index = preferences.indexOf(preference);
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected[index] = !isSelected[index];
                                  });
                                },                  child: Column(
                                children:[
                                  Container(
                                    width: 95,
                                    height: 95,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isSelected[index] ? Color(0xffE4F757) : Colors.transparent,
                                        width: 2.0,
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(preference),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    preferencesNames[index],
                                    style: TextStyle(
                                      color: isSelected[index] ? Color(0xffE4F757) : Color(0xff828693),
                                      fontSize: 15,
                                    ),
                                  ),
                                ]
                            )
                            )
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ActionButton(
                navigateTo: 'events',
                content: 'CONTINUE',
                color: Color(0xff9747FF),
                txtColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, 'init');
                },),
            ]
        )
    );
  }
}