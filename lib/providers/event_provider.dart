
import 'package:auntie_rafiki/models/event.dart';
import 'package:auntie_rafiki/models/events.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier{
  List<Event> _events = [
    Event(id: 1, name: "event 1", category: "Fund raising", description: "We want to buy a field bus", location: "Qlicue", featuredImage: "https://placekitten.com/500/500", date: "08-31-2021", time: "12:15"),
    Event(id: 2, name: "event 2", category: "Money making", description: "We want to buy home appliances", location: "Msewe", featuredImage: "https://placekitten.com/500/500", date: "08-31-2021", time: "12:21")
  ];
  List<Event> get events => _events;
}