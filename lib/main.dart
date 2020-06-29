import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t/view/banner_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

	Widget build(BuildContext context) {
		return MaterialApp(
			title: "MVVM",
			theme: ThemeData(
				primaryColor: Colors.white,
			),
			home: BannerPage(),
		);
	}
}