class Champion {
  String? name;
  String? championId;
  int? cost;
  List<String>? traits;

  Champion({this.name, this.championId, this.cost, this.traits});

  Champion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    championId = json['championId'];
    cost = json['cost'];
    traits = json['traits'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['championId'] = championId;
    data['cost'] = cost;
    data['traits'] = traits;
    return data;
  }
}