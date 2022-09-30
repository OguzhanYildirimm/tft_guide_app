import 'dart:convert';

List<Champion> championFromMap(String str) => List<Champion>.from(json.decode(str).map((x) => Champion.fromMap(x)));
String championToMap(List<Champion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Champion {
  String name;
  String championId;
  int cost;
	List<String>? traits;

  Champion({required this.name, required this.championId, required this.cost,required this.traits});

  factory Champion.fromMap(Map<String, dynamic> json) => Champion(
        name: json["name"],
				championId: json["championId"],
				cost: json["cost"],
				traits: json['traits'].cast<String>(),
				
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "championId": championId,
        "cost": cost,
				"traits" : traits
      };
}
