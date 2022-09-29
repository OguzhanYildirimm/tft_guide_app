// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tft_guide_app/constants/strings.dart';
import 'package:tft_guide_app/core/champions_card_widget.dart';

import '../constants/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const allPaddingEight = EdgeInsets.all(8.0);
    return Scaffold(
      appBar: AppBar(actions: const [ProjectInfoButton()], title: const ProjectTitleText()),
      bottomNavigationBar: const ProjectBottomNavigationBar(),
      body: Padding(
        padding: allPaddingEight,
        child: SingleChildScrollView(
					child: Column(
						children: [
									allChampionsText(),
							const ChampionsCardWidget(championName: 'Sett', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Katarina', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Teemo', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Jax', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Hecarim', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Khazix', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Garen', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Gragas', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'Ivern', championRole: 'Support', championCost: '4'),
										const ChampionsCardWidget(championName: 'LeeSin', championRole: 'Support', championCost: '4'),
						],
					),
				),
      ),
    );
  }

  Text allChampionsText() => Text('All Champions',style: subTitleTextStyle(),textAlign: TextAlign.center,);
}



class ProjectTitleText extends StatelessWidget {
  const ProjectTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      String.MAIN_TITLE,
      style: titleTextStyle(),
    );
  }
}

class ProjectInfoButton extends StatelessWidget {
  const ProjectInfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.info_outline,
        size: 24,
      ),
      onPressed: () {},
    );
  }
}

class ProjectFloatingActionButton extends StatelessWidget {
  const ProjectFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {},
        child: const Icon(
          Icons.home,
          size: 35,
          color: Colors.white,
        ));
  }
}

class ProjectBottomNavigationBar extends StatelessWidget {
  const ProjectBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Ionicons.accessibility_outline), label: 'Champions'),
        BottomNavigationBarItem(icon: Icon(Ionicons.game_controller_outline), label: 'Comps'),
        BottomNavigationBarItem(icon: Icon(Ionicons.trophy_outline), label: 'Items')
      ],
    );
  }
}
