import 'package:flutter/material.dart';

class CardTinder extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const CardTinder({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.onLike,
    required this.onDislike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black],
    );

    return Container(
      width: 432,
      height: 768,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.75),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    child: Text(title, style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 300,
                    child: Text(description, style: TextStyle(color: Colors.white, fontSize: 14.78)),
                  ),
                ],
              )),
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onDislike,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: onLike,
            ),
          ),
        ],
      ),
    );
  }
}