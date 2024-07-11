import 'package:flutter/material.dart';

class TextFormInput extends StatefulWidget {
  final String hintText;
  final String type;
  final double width;
  final TextInputType keyboardType;

  const TextFormInput({
    super.key,
    required this.hintText,
    required this.type,
    required this.width,
    this.keyboardType = TextInputType.text
  });

  @override
  _TextFormInputState createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widget.width,
      child: TextField(
        obscureText: widget.type == 'password' ? _obscureText : false,
        style: const TextStyle(color: Colors.white, fontSize: 19),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          focusColor: const Color(0xff8C52FF),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff828693)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8C52FF), width: 2.02),
          ),
          suffixIcon: widget.type == 'password'
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}