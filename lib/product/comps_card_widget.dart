import 'package:flutter/material.dart';

import '../constants/theme.dart';

class CompsCardWidget extends StatefulWidget {
	const CompsCardWidget({super.key});

	@override
	State<CompsCardWidget> createState() => _CompsCardWidgetState();
}

class _CompsCardWidgetState extends State<CompsCardWidget> {
	@override
	Widget build(BuildContext context) {
		return Center(child: CircularProgressIndicator(
            color: ProjectColors().colorAmber,
            strokeWidth: 8,
          ));
	}
}