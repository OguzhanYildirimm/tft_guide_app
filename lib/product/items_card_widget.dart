import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_guide_app/core/model/items.dart';

import '../constants/text_style.dart';
import '../constants/theme.dart';

class ItemsCardWidget extends StatefulWidget {
  const ItemsCardWidget({super.key});

  @override
  State<ItemsCardWidget> createState() => _ItemsCardWidgetState();
}

class _ItemsCardWidgetState extends State<ItemsCardWidget> {
  List<Items> itemsList = <Items>[];
  final String localItemsJsonPath = 'assets/json/items.json';

  Future<void> loadLocalItemsJson() async {
    var data = await rootBundle.loadString(localItemsJsonPath);
    List<dynamic> decodedJson = json.decode(data);
    itemsList = decodedJson.map((user) => Items.fromMap(user)).toList();
    setState(() {
      itemsList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalItemsJson();
  }

  @override
  Widget build(BuildContext context) {
    return itemsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: ProjectColors().colorAmber,
            strokeWidth: 8,
          ))
        : listItems(context, itemsList);
  }
}

Widget listItems(BuildContext context, List<Items> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return itemsCardWidget(list, index);
    },
  );
}

Widget itemsCardWidget(List<Items> list, int index) {
  return Padding(
    padding: itemsCardWidgetCustomPadding(),
    child: itemsFlipCardWidget(list, index),
  );
}

FlipCard itemsFlipCardWidget(List<Items> list, int index) {
  return FlipCard(
			speed: 600,
			front: Card(
				child: Padding(
					padding: itemsCardWidgetListTilePadding(),
					child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							ListTile(
								leading: GetItemsImage(
									itemsId: list[index].id,
								),
								title: Text(
									list[index].name,
									style: subTitleTextStyle(),
								),
								subtitle: Text(
									"Tap the card to get information about the item.",
									style: italicTextStyle(),
								),
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.end,
								children: [
									Icon(
										Icons.ads_click,
										color: ProjectColors().colorAmber,
										size: 50,
									),
									const SizedBox(
										width: 2,
									),
								],
							)
						],
					),
				),
			),
			back: Card(
				child: Padding(
					padding: itemsCardWidgetListTilePadding(),
					child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							ListTile(
								leading: GetItemsImage(
									itemsId: list[index].id,
								),
								title: Text(
									"Item Information",
									style: subTitleTextStyle(),
								),
								subtitle: Text(list[index].description,style: subTextStyle(),),
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.end,
								children: [
									Icon(
										Icons.ads_click,
										color: ProjectColors().colorAmber,
										size: 50,
									),
									const SizedBox(
										width: 2,
									),
								],
							)
						],
					),
				),
			),
		);
}

EdgeInsets itemsCardWidgetListTilePadding() => const EdgeInsets.only(top: 4.0, bottom: 4.0);

EdgeInsets itemsCardWidgetCustomPadding() => const EdgeInsets.all(4.0);

class GetItemsImage extends StatelessWidget {
  const GetItemsImage({
    Key? key,
    this.itemsId,
  }) : super(key: key);
  // ignore: constant_identifier_names
  static const BASE_TEXT = 'assets/images/items/';

  // ignore: prefer_typing_uninitialized_variables
  final itemsId;
  @override
  Widget build(BuildContext context) {
    return Image.asset('$BASE_TEXT$itemsId.png');
  }
}
