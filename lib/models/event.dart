
class Event {
  final int id;
  final String name;
  final String category;
  final String description;
  final String location;
  final String featuredImage;
  final String date;
  final String time;

  Event(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.location,
      required this.featuredImage,
      required this.date,
      required this.time});

      factory Event.fromJson(Map<String, dynamic> json){
        return Event(id: json['id'], name: json['name'], category: '', description: json['description'], location: json['location'], featuredImage: json['featured_image'], date: json['date'], time: json['time']);
      }
}