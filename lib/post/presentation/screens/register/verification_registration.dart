import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'dart:async';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool showButton = false;
  int counter = 59;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          showButton = true;
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 1,
      title: 'Verification',
      children: Column(
        children: [
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              textStyle: const TextStyle(color: Colors.white, fontSize: 30),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.values[1],
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 70,
                fieldWidth: 50,
                selectedFillColor: Colors.transparent,
                activeFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {},
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 30,
                child: showButton ? TextButton(
                  onPressed: () {
                    setState(() {
                      showButton = false;
                      counter = 59;
                      startTimer();
                    });
                  },
                  child: const Text('Resend Code', style: TextStyle(color: Colors.blue, fontSize: 13.5)),
                ) : Text('Resend Code in 00:$counter', style: const TextStyle(color: Colors.white, fontSize: 13.5)),
              )
            )
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          const ActionButton(navigateTo: 'username', content: 'CONTINUE', color: Color(0xff9747FF), txtColor: Colors.white)
        ],
      ),
    );
  }
}