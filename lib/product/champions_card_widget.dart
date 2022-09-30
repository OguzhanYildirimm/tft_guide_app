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
              list[index].name,
              style: subTitleTextStyle(),
            ),
            trailing: championCardWidgetIconButton(),
          ),
        ),
      ),
    );
}

EdgeInsets championCardWidgetListTilePadding() => const EdgeInsets.only(top: 8.0, bottom: 8.0);

EdgeInsets championCardWidgetCustomPadding() => const EdgeInsets.all(8.0);

IconButton championCardWidgetIconButton() {
  return IconButton(
              onPressed: () {},
              icon: Icon(
                Ionicons.arrow_forward_outline,
                color: ProjectColors().colorAmber,
                size: 30,
              ));
}

class GetChampionImage extends StatelessWidget {
  const GetChampionImage({
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
