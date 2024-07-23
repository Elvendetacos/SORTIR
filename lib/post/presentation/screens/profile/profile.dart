import 'package:flutter/material.dart';
import 'package:sortir/core/domain/model/user/user_response.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/core/infraestructure/store/user_store.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin<Profile> {

  UseCase useCase = Service();
  int? id;
  String? jwtToken;
  String name = '';
  int phone = 0;
  String profileUrl = '';

  @override
  void initState() {
    super.initState();
    printUserCredentials();
  }

  void printUserCredentials() async {
    UserStore userPreferences = UserStore();
    jwtToken = await userPreferences.getJwtToken();
    id = await userPreferences.getId();

    print('JWT Token: $jwtToken');
    print('Username: $id');
    UserResponse user = await useCase.getUser(id!, jwtToken!);
    print(user.city);
    setState(() {
      name = user.name;
      phone = user.phone;
      profileUrl = user.profileUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.72,
        color: Color(0xff1B1F27),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CircleAvatar(
              backgroundImage: NetworkImage(profileUrl),
              radius: 85,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '+${phone.toString()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Row(
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color(0xff2A2D3E),
                        elevation: 5,
                      ),
                      child: const Icon(Icons.settings, size: 26, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text('SETTINGS', style: TextStyle(color: Color(0xff828693))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color(0xff2A2D3E),
                        elevation: 5,
                      ),
                      child: const Icon(Icons.edit, size: 35, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text('EDIT PROFILE', style: TextStyle(color: Color(0xff828693))),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color(0xff2A2D3E),
                        elevation: 5,
                      ),
                      child: const Icon(Icons.logout, size: 26, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text('LOG OUT', style: TextStyle(color: Color(0xff828693))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2, size.height, size.width, size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
