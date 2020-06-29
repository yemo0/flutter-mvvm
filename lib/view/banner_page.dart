import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t/base/provider_widget.dart';
import 'package:t/model/banner_bean.dart';
import 'package:t/viewmodel/banner_model.dart';

class BannerPage extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		// TODO: implement createState
		return BannerPageState();
	}
}

class BannerPageState extends State<BannerPage> {

	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		return Scaffold(
			body: Center(
				child: ProviderWidget<BannerModel>(
					model: BannerModel(),
					onModelInit: (mounted) {
						mounted.load();
					},
					builder: (context, mounted, child) {
						return _BannerA(mounted.banner);
					})
			),
		);
	}


	Widget _BannerA(BannerBean banner) {
		if (banner == null) {
			return Center(
				child: Text("loading..."),
			);
		}

		return ListView.builder(
			itemBuilder: (BuildContext context, int i){
				return Container(
					margin: EdgeInsets.all(10),
					child: Column(
						children: <Widget>[
							Text(banner.data[i].name, style: TextStyle(
								fontSize: 30,
								fontWeight: FontWeight.bold,
							),),
							ClipRRect(
								borderRadius: BorderRadius.all(Radius.circular(8)),
								child: Image.network(banner.data[i].bannerImg, fit: BoxFit.fill,),
							),
						],
					),
				);
			},
			itemCount: banner.data.length,);
	}
}
