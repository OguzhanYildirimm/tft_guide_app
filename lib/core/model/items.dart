import 'dart:convert';

List<Items> itemsFromMap(String str) => List<Items>.from(json.decode(str).map((x) => Items.fromMap(x)));
String itemsToMap(List<Items> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Items {
	int id;
  String name;
  String description;
  bool isUnique;
	bool isShadow;

  Items({required this.id,required this.name,required this.description,required this.isUnique,required this.isShadow});

  factory Items.fromMap(Map<String, dynamic> json) => Items(
        id: json["id"],
				name: json["name"],
				description: json["description"],
				isUnique: json['isUnique'],
				isShadow : json["isShadow"],
				
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
				"isUnique" : isUnique,
				"isShadow" : isShadow
      };
}
