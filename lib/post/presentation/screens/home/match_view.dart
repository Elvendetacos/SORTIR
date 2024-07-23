import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:sortir/post/presentation/components/card_tinder.dart';

class MatchView extends StatefulWidget {
  @override
  _MatchViewState createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final CardSwiperController _controller = CardSwiperController();
  final List<Widget> _cards = List<Widget>.generate(
    20,
    (index) => CardTinder(title: 'Marco Antonio', description: 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas scelerisque est lacus, sit amet venenatis massa sodales ac. Ut iaculis sagittis sapien, a scelerisque justo pretium non. Praesent faucibus augue vel magna vestibulum, condimentum ultrice.', image: 'https://picsum.photos/200/300', onLike: () {}, onDislike: () {}),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardSwiper(
        duration: Duration(milliseconds: 300),
        numberOfCardsDisplayed: 2,
        maxAngle: 40,
        isLoop: true,
        allowedSwipeDirection: AllowedSwipeDirection.only(
          right: true,
          left: true,
        ),
        controller: _controller,
        cardsCount: _cards.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) => _cards[index],
      ),
    );
  }
}