import 'package:auntie_rafiki/Pages/Boom_color_changer_page.dart';
import 'package:auntie_rafiki/Pages/auth/registration_page.dart';
import 'package:auntie_rafiki/Pages/event_list_page.dart';
import 'package:auntie_rafiki/Pages/home_page.dart';
import 'package:auntie_rafiki/Pages/malume_page.dart';
import 'package:auntie_rafiki/providers/auth_provider.dart';
import 'package:auntie_rafiki/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/auth/login_page.dart';
import 'Pages/event_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return AuthProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return EventProvider();
        })
      ],
      child: MaterialApp(
        routes: {
          'boom_color_changer': (context) {
            return BoomColorChanger();
          },
          'home_page': (context) {
            return HomePage();
          },
          'malume_page': (context) {
            return MalumePage();
          },
          'login_page': (context) {
            return LoginPage();
          },
          'registration_page': (context) {
            return RegistrationPage();
          },
          'events': (context) {
            return EventList();
          }
        },
        onGenerateRoute: (settings){
          final argument = settings.arguments as Map<String, dynamic>;
          final eventId = argument['id'];

          switch(argument['name']){
            case 'event':
              return MaterialPageRoute(builder: (_){
                return EventPage(id: eventId,);
              });
          }
        },
        title: 'Reyx26',
        debugShowCheckedModeBanner: false, //remove the check banner
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EventList(),
      ),
    );
  }
}
