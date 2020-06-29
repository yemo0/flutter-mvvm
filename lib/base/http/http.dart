import 'package:dio/dio.dart';

typedef Success = void Function(dynamic json);
typedef Fail = void Function(String reaso, int code);
typedef After = void Function();

class Http {
	static Dio _dio;
	static Http https = Http();

	static Http getInstance() {
		return https;
	}

	Http() {
		if (_dio == null) {
			_dio = createDio();
		}
	}

	Dio createDio() {
		var dio = Dio(BaseOptions(
			connectTimeout: 30000,
			receiveTimeout: 30000,
			sendTimeout: 30000,
			responseType: ResponseType.json,
		));
		return dio;
	}

	Future<void> get(String uri, Map<String,dynamic> params, {Success success, Fail fail, After after}) {
//		return _dio.get(uri, queryParameters: params);
		_dio.get(uri, queryParameters: params).then((response) {
			if (response.statusCode == 200) {
				if (success != null) {
					success(response.data);
				}
			} else {
				if (fail != null) {
					fail(response.statusMessage, response.statusCode);
				}
			}
			if (after != null) {
				
			}
		}).catchError((e) {
			print(e.toString());
		});
		return Future.value();
	}
}