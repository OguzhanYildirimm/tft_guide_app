import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tft_guide_app/constants/text_style.dart';
import 'package:tft_guide_app/constants/theme.dart';
import 'package:tft_guide_app/core/model/champions.dart';

class GetChampionsFromJson extends StatefulWidget {
  const GetChampionsFromJson({super.key});

  @override
  State<GetChampionsFromJson> createState() => _GetChampionsFromJsonState();
}

class _GetChampionsFromJsonState extends State<GetChampionsFromJson> {
  List<Champion> championList = <Champion>[];
  final String localJsonPath = 'assets/json/champions.json';

  Future<void> loadLocalJson() async {
    var data = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(data);
    championList = decodedJson.map((user) => Champion.fromMap(user)).toList();
    setState(() {
      championList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalJson();
  }

  @override
  Widget build(BuildContext context) {
    return championList.isEmpty ?  Center(child: CircularProgressIndicator(color: ProjectColors().colorAmber,strokeWidth: 8,)) : listItems(context, championList);
  }
}

Widget listItems(BuildContext context, List<Champion> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
					elevation: 25,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: ListTile(
					leading: GetChampionsImage(championId:list[index].championId),
					title: Text(list[index].name,style: subTitleTextStyle(),),
					trailing: IconButton(onPressed: (){}, icon: Icon(Ionicons.arrow_forward_circle_outline)),
				),
          ),
        ),
      );
    },
  );
}

Widget get background => Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: const Icon(
        Icons.delete_sweep,
        size: 35,
        color: Colors.white,
      ),
    );

class GetChampionsImage extends StatelessWidget {
  const GetChampionsImage({
    Key? key,
    this.championId,
  }) : super(key: key);
  static const BASE_TEXT = 'assets/images/champions/';

  final championId;
  @override
  Widget build(BuildContext context) {
    return Image.asset('$BASE_TEXT$championId.png');
  }
}