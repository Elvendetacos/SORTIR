import 'package:flutter/material.dart';

class LayoutForms extends StatelessWidget {
  final Widget children;
  final String title;
  final int code;
  const LayoutForms({super.key, required this.children, required this.title, this.code = 0 });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff424242), size: 25, weight: 100,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            code == 0 ? const SizedBox(height: 0) : SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                Text(title, style: const TextStyle( color: Colors.white, fontSize: 40),),
              ]
            ),
            children,
          ],
        ),
      )
    );
  }
}
