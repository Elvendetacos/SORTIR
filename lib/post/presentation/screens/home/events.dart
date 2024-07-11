import 'package:flutter/material.dart';
import 'package:sortir/post/presentation/components/layout_with_menu_bar.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutWithMenuBar(
        child: Text("Events")
    );
  }
}