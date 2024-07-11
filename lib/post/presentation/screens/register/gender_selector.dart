import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({Key? key}) : super(key: key);

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  bool isWomenSelected = false;
  bool isMenSelected = false;

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 1,
      title: 'My gender',
      children: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 28),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isWomenSelected = true;
                  isMenSelected = false;
                });
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  isWomenSelected ? Colors.blue : Color(0xff111419),
                ),
              ),
              child: const Text('WOMEN', style: TextStyle(fontSize: 14.78, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 28),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isMenSelected = true;
                  isWomenSelected = false;
                });
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  isMenSelected ? Colors.blue : const Color(0xff111419),
                ),
              ),
              child: const Text('MEN', style: TextStyle(fontSize: 14.78, color: Colors.white)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.46),
          ActionButton(navigateTo: 'info', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white, onPressed: () { print('juan'); },),
        ],
      ),
    );
  }
}