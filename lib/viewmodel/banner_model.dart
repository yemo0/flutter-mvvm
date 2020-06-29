import 'dart:convert';

import 'package:t/base/http/http.dart';
import 'package:t/base/provider_base.dart';
import 'package:t/config/urls.dart';
import 'package:t/model/banner_bean.dart';

class BannerModel extends ProviderBase {
	BannerBean banner;

	load() {
		print(ApiUrls.banner);
		Http.getInstance().get(ApiUrls.banner, {},
				success: (json){
			banner = BannerBean.map(jsonDecode(json));
			notifyListeners();
		}, fail: (reason, statuscode){

			}
		);
	}
}