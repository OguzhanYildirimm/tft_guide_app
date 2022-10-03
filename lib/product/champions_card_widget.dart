import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_guide_app/constants/text_style.dart';
import 'package:tft_guide_app/constants/theme.dart';
import 'package:tft_guide_app/core/model/champions.dart';

class ChampionsCardWidget extends StatefulWidget {
  const ChampionsCardWidget({super.key});

  @override
  State<ChampionsCardWidget> createState() => _ChampionsCardWidgetState();
}

class _ChampionsCardWidgetState extends State<ChampionsCardWidget> {
  List<Champion> championList = <Champion>[];

	Future<void> loadLocalChampionJson() async {
		String jsonString = await rootBundle.loadString('assets/json/champions.json');
		List<dynamic> jsonResponse = json.decode(jsonString).toList();
		championList = jsonResponse.map((v) => Champion.fromJson(v)).toList();
		setState(() {
      championList;
    });
	}

  @override
  void initState() {
    super.initState();
    loadLocalChampionJson();
  }

  @override
  Widget build(BuildContext context) {
    return championList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: ProjectColors().colorAmber,
            strokeWidth: 8,
          ))
        : listItems(context, championList);
  }
}

Widget listItems(BuildContext context, List<Champion> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return championCardWidget(list, index);
    },
  );
}

Padding championCardWidget(List<Champion> list, int index) {
  return Padding(
      padding: championCardWidgetCustomPadding(),
      child: Card(
        elevation: 25,
        child: Padding(
          padding: championCardWidgetListTilePadding(),
          child: ListTile(
            leading: GetChampionImage(championId: list[index].championId),
            title: Text(
              list[index].name.toString(),
              style: subTitleTextStyle(),
            ),
						subtitle: Text("Cost : ${list[index].cost.toString()} Gold",style: textStyle(),),
          ),
        ),
      ),
    );
}

EdgeInsets championCardWidgetListTilePadding() => const EdgeInsets.only(top: 4.0, bottom: 4.0);

EdgeInsets championCardWidgetCustomPadding() => const EdgeInsets.all(4.0);


class GetChampionImage extends StatelessWidget {
  const GetChampionImage({
    Key? key,
    this.championId,
  }) : super(key: key);
  // ignore: constant_identifier_names
  static const BASE_TEXT = 'assets/images/champions/';

  // ignore: prefer_typing_uninitialized_variables
  final championId;
  @override
  Widget build(BuildContext context) {
    return Image.asset('$BASE_TEXT$championId.png');
  }
}
