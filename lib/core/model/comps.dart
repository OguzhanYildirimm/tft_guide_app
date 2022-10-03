class Comps {
  String? key;
  String? name;
  String? description;
  String? type;
  List<Sets>? sets;

  Comps({this.key, this.name, this.description, this.type, this.sets});


	
  Comps.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    if (json['sets'] != null) {
      sets = <Sets>[];
      json['sets'].forEach((v) {
        sets!.add(Sets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    if (sets != null) {
      data['sets'] = sets!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static fromMap(user) {}
}

class Sets {
  String? style;
  int? min;
  int? max;

  Sets({this.style, this.min, this.max});

  Sets.fromJson(Map<String, dynamic> json) {
    style = json['style'];
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['style'] = style;
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}