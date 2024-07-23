import 'package:flutter/material.dart';
import 'package:sortir/core/domain/model/category/category_item.dart';
import 'package:sortir/core/domain/model/interest/interest_send.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';
import 'package:provider/provider.dart';

class PreferencesSelector extends StatefulWidget {
  const PreferencesSelector({Key? key}) : super(key: key);

  @override
  _PreferencesSelectorState createState() => _PreferencesSelectorState();
}

class _PreferencesSelectorState extends State<PreferencesSelector> {
  List<CategoryItem> events = [];
  UseCase useCase = Service();

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void fetchEvents() async {
    var cat = await useCase.getCategories();

    setState(() {
      events = cat;
    });
  }

  Future<List<InterestSend>> submit() async {
    List<InterestSend> interests = events.map((CategoryItem category) {
      return InterestSend(
        description: category.name,
        activities: category.selectedActivities.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList(),
      );
    }).toList();
    interests = interests.where((interest) => interest.activities.isNotEmpty).toList();

    return interests;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
        title: 'My preferences',
        children: Column(
            children:[
              const SizedBox(height: 28),
              Container(
                height: MediaQuery.of(context).size.height * 0.67,
                child: SingleChildScrollView(
                  child: Column(
                    children: events.map((CategoryItem category) => Card(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: category.activities.map((String activity) => CheckboxListTile(
                                                title: Text(activity),
                                                value: category.selectedActivities.containsKey(activity) && category.selectedActivities[activity]!,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    category.selectedActivities[activity] = value ?? false;
                                                  });
                                                },
                                              )).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(category.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ActionButton(
                navigateTo: 'events',
                content: 'CONTINUE',
                color: Color(0xff9747FF),
                txtColor: Colors.white,
                onPressed: () async {
                  RegisterResponse response = await Provider.of<RegistrationProvider>(context, listen: false).register();
                  print(response.id);
                  if (response.id != 0) {
                    List<InterestSend> interests = await submit();
                    await useCase.sendCategories(interests, response.id);
                    Navigator.pushNamed(context, 'login');
                  }
                },
              ),
            ]
        )
    );
  }
}

