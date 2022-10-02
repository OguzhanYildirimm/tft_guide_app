import 'dart:convert';

List<Comps> itemsFromMap(String str) => List<Comps>.from(json.decode(str).map((x) => Comps.fromMap(x)));
String itemsToMap(List<Comps> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Comps {
  String key;
  String name;
  String description;

  Comps({required this.key, required this.name, required this.description});

  factory Comps.fromMap(Map<String, dynamic> json) => Comps(
        key: json["key"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {"key": key, "name": name, "description": description};
}
