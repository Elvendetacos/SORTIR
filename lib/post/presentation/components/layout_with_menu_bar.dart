import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutWithMenuBar extends StatelessWidget{
  final Widget child;
  const LayoutWithMenuBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xff1B1F27),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/home.svg', height: 24),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/profile.svg', height: 24),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/chats.svg', height: 24),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/add_profile.svg', height: 24),
                label: ''
              ),
            ],
          ),
        ),
      )
    );
  }
}