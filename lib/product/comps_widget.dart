import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_guide_app/core/model/comps.dart';
import '../constants/text_style.dart';
import '../constants/theme.dart';
import '../pages/comps_detail_page.dart';

class CompsCardWidget extends StatefulWidget {
  const CompsCardWidget({super.key});

  @override
  State<CompsCardWidget> createState() => _CompsCardWidgetState();
}

class _CompsCardWidgetState extends State<CompsCardWidget> {
  List<Comps> compsList = <Comps>[];

  @override
  void initState() {
    super.initState();
    loadLocalCompsJson();
  }

  Future<void> loadLocalCompsJson() async {
    String jsonString = await rootBundle.loadString('assets/json/traits.json');
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    compsList = jsonResponse.map((v) => Comps.fromJson(v)).toList();
    setState(() {
      compsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return compsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: ProjectColors().colorAmber,
            strokeWidth: 8,
          ))
        : listComps(context, compsList);
  }
}

Widget listComps(BuildContext context, List<Comps> list) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: list.length,
    itemBuilder: (context, index) {
      return compsWidget(context, list, index);
    },
  );
}

Widget compsWidget(BuildContext context, List<Comps> list, int index) {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CompsDetailPage(
                    index: index,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(children: [
          GetCompsImage(
            compsName: list[index].name!.toLowerCase(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            list[index].name.toString(),
            style: subTextStyle(),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    ),
  );
}

class GetCompsImage extends StatelessWidget {
  const GetCompsImage({
    Key? key,
    this.compsName,
  }) : super(key: key);

  // ignore: constant_identifier_names
  static const BASE_TEXT = 'assets/images/traits/';

  // ignore: prefer_typing_uninitialized_variables
  final compsName;

  @override
  Widget build(BuildContext context) {
    return Image.asset('$BASE_TEXT$compsName.png');
  }
}
