class EventsResponse {
  final int id;
  final String title;
  final String description;
  final String date;
  final double latitude;
  final double longitude;
  final String address;
  final List<dynamic> categories;
  final bool complete;

  EventsResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.categories,
    required this.complete,
  });

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    return EventsResponse(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      categories: json['categories'],
      complete: json['complete'],
    );
  }
}