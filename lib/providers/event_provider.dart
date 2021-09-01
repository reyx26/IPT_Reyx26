import 'package:auntie_rafiki/models/event.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [
    Event(
        id: 1,
        name: "event 1",
        category: "Fund raising",
        description: "We want to buy a field bus",
        location: "Qlicue",
        featuredImage: "https://placekitten.com/500/500",
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

  void addEvent() {
    final Event event = Event(
        id: 3,
        name: "event 3",
        category: "Betting",
        description: "We want to make some through betting",
        location: "Riverside",
        featuredImage: "https://placekitten.com/500/500",
        date: "09-01-2021",
        time: "11:53");

    _events.add(event);
    notifyListeners();
  }

  bool deleteEvent(int id) {

    if(id < 1) return false;

    final event = _events.firstWhere((element) => element.id == id);

    if(event is Event){
      _events.removeWhere((element) => element.id == id);
      notifyListeners();
      return true;
    }
    return false;
  }
}