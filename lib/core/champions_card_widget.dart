import 'package:flutter/material.dart';
import '../constants/text_style.dart';

class ChampionsCardWidget extends StatelessWidget {
	const ChampionsCardWidget({super.key, required this.championName, required this.championRole, required this.championCost});
	final String championName;
	final String championRole;
	final String championCost;
	@override
	Widget build(BuildContext context) {
		return Card(
              child: ListTile(
                leading: GetChampions(
                  championName: championName,
                ),
                title: Text(
                  championName,
                  style: textStyle(),
                ),
							subtitle: Text(championRole),
							trailing: Text(championCost),
              ),
            );
	}
}

class GetChampions extends StatelessWidget {
  const GetChampions({
    Key? key,
    this.championName,
  }) : super(key: key);
  static const BASE_TEXT = 'assets/images/champions/TFT5_';

  final championName;
  @override
  Widget build(BuildContext context) {
    return Image.asset('$BASE_TEXT$championName.png');
  }
}