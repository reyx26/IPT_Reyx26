import 'dart:convert';

import 'package:auntie_rafiki/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class EventProvider extends ChangeNotifier {
  final String api = 'http://192.168.42.41:8000/api/';
  List<Event> _events = [
    Event(
        id: 1,
        name: "event 1",
        category: "Fund raising",
        description: "We want to buy a field bus",
        location: "Qlicue",
        featuredImage:
            "https://media.istockphoto.com/vectors/donate-money-crowdfunding-line-icon-investment-and-consolidation-vector-id827305772?k=20&m=827305772&s=612x612&w=0&h=jCCb5H6m29LYg4-RrfzVVFrS_Tvfq5z1qzN81p5RAsI=",
        date: "08-31-2021",
        time: "12:15"),
    Event(
        id: 2,
        name: "event 2",
        category: "Money making",
        description: "We want to buy home appliances",
        location: "Msewe",
        featuredImage: "https://placekitten.com/500/500",
        date: "08-31-2021",
        time: "12:21")
  ];
  List<Event> get events => _events;
  Event getEventById(int id) {
    final event = _events.firstWhere((element) => element.id == id);
    return event;
  }

  // function that communicate with server(pull data)
  Future<void> getEvents() async {
    // ignore: unused_local_variable
    http.Response response = await http.get(Uri.parse(api + 'events'));
    // print(response.body);
    try {
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        print(json);
        json.forEach((element) {
          _events.add(Event.fromJson(element));
        });
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void addEvent() {
    final Event event = Event(
        id: 3,
        name: "event 3",
        category: "Betting",
        description: "We want to make some money through betting",
        location: "Riverside",
        featuredImage: "https://miro.medium.com/max/11232/0*XMWf3f8SDIdRGMdn",
        date: "09-01-2021",
        time: "11:53");

    _events.add(event);
    notifyListeners();
  }

  bool deleteEvent(int id) {
    if (id < 1) return false;

    final event = _events.firstWhere((element) => element.id == id);

    if (event is Event) {
      _events.removeWhere((element) => element.id == id);
      notifyListeners();
      return true;
    }
    return false;
  }
}
