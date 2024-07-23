import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sortir/post/presentation/components/notifications.dart';
import 'package:sortir/post/presentation/screens/home/events.dart';
import 'package:sortir/post/presentation/screens/home/match_view.dart';
import 'package:sortir/post/presentation/screens/profile/profile.dart';

class LayoutWithMenuBar extends StatefulWidget {
  const LayoutWithMenuBar({Key? key}) : super(key: key);

  @override
  _LayoutWithMenuBarState createState() => _LayoutWithMenuBarState();
}

class _LayoutWithMenuBarState extends State<LayoutWithMenuBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Events(),
    Profile(),
    Text("hi"),
    Notifications(),
    MatchView(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff1B1F27),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: SvgPicture.asset('assets/svg/home.svg', height: 26),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: SvgPicture.asset('assets/svg/profile.svg', height: 26),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: SvgPicture.asset('assets/svg/chats.svg', height: 26),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: SvgPicture.asset('assets/svg/add_profile.svg', height: 26),
                      ),
                      label: '',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: GestureDetector(
                  onTap: () {
                    print('Add profile');
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xff141920),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_upward, color: Colors.white, size: 40),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
