import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:sortir/core/domain/model/user/user_response.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/core/infraestructure/store/user_store.dart';
import 'package:sortir/post/presentation/components/card_tinder.dart';

class MatchView extends StatefulWidget {
  @override
  _MatchViewState createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final CardSwiperController _controller = CardSwiperController();
  UseCase useCase = Service();
  List<UserResponse> events = [];
  late List<Widget> _cards;
  UserStore userPreferences = UserStore();
  var jwtToken;
  var id;

  @override
  void initState() {
    super.initState();
    loadUserCredentials();
    fetchEvents();
  }

  void loadUserCredentials() async {
    jwtToken = await userPreferences.getJwtToken();
    id = await userPreferences.getId();
  }

  void fetchEvents() async {
    var event1 = await useCase.getRecommendations("Tuxtla", id);

    setState(() {
      events = event1;
      _cards = events.map((user) => CardTinder(
          title: user.name,
          description: 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas scelerisque est lacus, sit amet venenatis massa sodales ac. Ut iaculis sagittis sapien, a scelerisque justo pretium non. Praesent faucibus augue vel magna vestibulum, condimentum ultrice.',
          image: user.profileUrl,
          onLike: () {
            _controller.swipe(CardSwiperDirection.right);
          },
          onDislike: () {
            _controller.swipe(CardSwiperDirection.left);
          }
      )).toList();
    });
  }

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
        onSwipe: (index, _ , direction) {
          if (direction == CardSwiperDirection.left) {
            print('Dislike');
          } else {
            print('Like');
          }
          return Future.value(true);
        },
      ),
    );
  }
}