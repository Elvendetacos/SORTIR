import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardEventWidget extends StatelessWidget{
  final String title;
  final String date;
  final String description;
  final VoidCallback onTap;
  const CardEventWidget({super.key, required this.title, required this.date, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xff111419),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ShaderMask(
                shaderCallback: (bounds) => gradient.createShader(bounds),
                blendMode: BlendMode.darken,
                child: Container(
                  width: 330,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.75),
                    color: Colors.black,
                  ),
                  child: Container(
                    height: 30,
                    width: 30,
                      child: SvgPicture.asset('assets/svg/icon.svg', fit:BoxFit.contain)
                  )
                ),
              ),
            ),
            const SizedBox(height: 10),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.04,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date.substring(0, 10), style: TextStyle(color: Colors.white, fontSize: 14.78)),
                    Container(
                      width: 400, // Ajusta este valor según tus necesidades
                      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 300, // Ajusta este valor según tus necesidades
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.white, fontSize: 14.78),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}