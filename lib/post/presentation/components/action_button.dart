import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  const ActionButton({super.key, required this.navigateTo, required this.content, required this.color, required this.txtColor});

  final String navigateTo;
  final String content;
  final Color color;
  final Color txtColor;
  final int height = 55;
  final double width = 0.9;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      width: MediaQuery.of(context).size.width * width,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, navigateTo);
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(color),
          ),
          child: Text(content, style: TextStyle(fontSize: 14.78, color: txtColor)),
        )
    );
  }
}
