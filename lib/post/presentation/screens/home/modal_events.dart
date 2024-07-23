import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModalEvents extends StatefulWidget {
  final String title;
  const ModalEvents({Key? key, required this.title}) : super(key: key);

  @override
  _ModalEventsState createState() => _ModalEventsState();
}

class _ModalEventsState extends State<ModalEvents> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xff0D0D0D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        child: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: Icon(isStarred ? Icons.star : Icons.star_border, color: Colors.yellow, size: 32),
                        onPressed: () {
                          setState(() {
                            isStarred = !isStarred;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text("Public by:", style: TextStyle(color: Color(0xffA8A8A8), fontSize: 12)),
                      SizedBox(width: 8),
                      Text('Cinepolis', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                      children:[
                        const SizedBox(width: 10),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, color: Color(0xffE4F757), size: 32,),
                              SizedBox(height: 8),
                              Text("12/12/2021", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                            ]
                        ),
                        const SizedBox(width: 30),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset('assets/svg/profile.svg', color: Colors.yellow), // Reemplaza esto con la ruta a tu imagen
                                onPressed: () {}, // Función de devolución de llamada vacía
                              ),
                              SizedBox(height: 0),
                              Text("30 persons", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                            ]
                        ),
                        const SizedBox(width: 30),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined, color: Color(0xffE4F757), size: 32,),
                              SizedBox(height: 8),
                              Text("7:00 - 21:00 ", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                            ]
                        ),
                        const SizedBox(width: 10),
                      ]
                  ),
                  const Column(
                    children: [
                      SizedBox(height: 10),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, ultricies nunc. Nullam nec purus feugiat, molestie ipsum et, ultricies nunc. Nullam nec purus feugiat, molestie ipsum et, ultricies nunc.", style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ]
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffE4F757),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text("Search match", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}