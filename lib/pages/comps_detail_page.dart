import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_guide_app/constants/text_style.dart';
import 'package:tft_guide_app/product/comps_widget.dart';

import '../constants/theme.dart';
import '../core/model/champions.dart';
import '../core/model/comps.dart';

class CompsDetailPage extends StatefulWidget {
  const CompsDetailPage({super.key, required this.index});

  final int index;

  @override
  State<CompsDetailPage> createState() => _CompsDetailPageState();
}

class _CompsDetailPageState extends State<CompsDetailPage> {
  List<Champion> championList = <Champion>[];
  List<Comps> compsList = <Comps>[];
	
	
  Future<void> loadLocalCompsJson() async {
    String jsonString = await rootBundle.loadString('assets/json/traits.json');
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    compsList = jsonResponse.map((v) => Comps.fromJson(v)).toList();
    setState(() {
      compsList;
    });
  }
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
    loadLocalCompsJson();
    loadLocalChampionJson();
  }
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${compsList[widget.index].name} Details'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [GetCompsImage(
                        compsName: compsList[widget.index].name?.toLowerCase(),
                      ),
                      _topLineWidget(),
                      Text(
                        compsList[widget.index].description.toString(),
                        style: subTextStyle(),
												textAlign: TextAlign.center,
                      ),
                      _bottomLineWidget(),
              ],
            ),
          ),
        ));
  }

  Padding _topLineWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: Container(
        height: 1.5,
        width: 200,
        color: Colors.amber,
      ),
    );
  }

  Padding _bottomLineWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Container(
        height: 1.5,
        width: 200,
        color: Colors.amber,
      ),
    );
  }
}

