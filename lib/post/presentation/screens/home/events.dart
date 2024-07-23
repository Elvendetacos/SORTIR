import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sortir/core/domain/model/user/events_response.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/post/presentation/components/card_event_widget.dart';
import 'package:sortir/post/presentation/components/layout_with_menu_bar.dart';
import 'package:sortir/post/presentation/screens/home/modal_events.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  UseCase useCase = Service();
  List<EventsResponse> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void fetchEvents() async {
    var event1 = await useCase.getEvent(7);
    var event2 = await useCase.getEvent(8);
    var event3 = await useCase.getEvent(9);

    setState(() {
      events = [event1, event2, event3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your event',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Maneja el clic aquí
                      print("Notificaciones clickeadas");
                    },
                    child: Stack(
                      children: [
                        Icon(Icons.notifications, color: Colors.grey, size: 24,),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            child: SingleChildScrollView(
              child: Column(
                children: events.map((event) {
                  return Column(
                    children: [
                      CardEventWidget(
                        title: event.title,
                        description: event.description,
                        date: event.date,
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            context: context,
                            builder: (context) => ModalEvents(title: event.title,),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
  }
}
