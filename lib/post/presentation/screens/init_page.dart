import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/action_button.dart';

class InitPage extends StatelessWidget{
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SvgPicture.asset('assets/svg/icon.svg', height: 100),
                  const SizedBox(width: 12),
                  const Text("Sortir", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white)),
                ]
              ),
              const Spacer(),
              Column(
                children:[
                  const ActionButton(navigateTo: "login", content: "SIGN IN WITH EMAIL", color: Color(0xff9747FF), txtColor: Colors.white),
                  const SizedBox(height: 12),
                  const ActionButton(navigateTo: "login", content: "SIGN IN WITH GOOGLE", color: Colors.white, txtColor: Colors.black),
                  const SizedBox(height:24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "phone_number");
                        },
                        child: const Text("Sign up now", style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}