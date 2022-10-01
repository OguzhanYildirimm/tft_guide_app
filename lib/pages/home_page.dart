// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tft_guide_app/constants/strings.dart';
import 'package:tft_guide_app/product/champions_card_widget.dart';

import '../constants/text_style.dart';
import '../product/comps_card_widget.dart';
import '../product/items_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	int selectedIndex = 0;
	static const List<Widget> _widgetOptions = <Widget>[
    ChampionsCardWidget(),
    CompsCardWidget(),
		ItemsCardWidget(),
  ];
	void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [ProjectInfoButton()], title: const ProjectTitleText()),
      bottomNavigationBar: bottomNavBar(),
			body:_widgetOptions.elementAt(selectedIndex),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
    items: bottomNavBarItems,
			currentIndex: selectedIndex,
    onTap: _onItemTapped,
  );
  }

  List<BottomNavigationBarItem> get bottomNavBarItems {
    return const [
      BottomNavigationBarItem(icon: Icon(Ionicons.accessibility_outline), label: 'Champions'),
      BottomNavigationBarItem(icon: Icon(Ionicons.game_controller_outline), label: 'Comps'),
      BottomNavigationBarItem(icon: Icon(Ionicons.trophy_outline), label: 'Items')
    ];
  }
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