/// code : 200
/// data : [{"id":1,"BannerImg":"1","BannerUrl":"2","Name":""},{"id":2,"BannerImg":"1","BannerUrl":"2","Name":""},{"id":3,"BannerImg":"111111111111","BannerUrl":"baidu.com111","Name":""}]

class BannerBean {
  int _code;
  List<Data> _data;

  int get code => _code;
  List<Data> get data => _data;

  BannerBean({int code, List<Data> data}){
    _code = code;
    _data = data;
}

  BannerBean.map(dynamic obj) {
    _code = obj["code"];
    if (obj["data"] != null) {
      _data = [];
      obj["data"].forEach((v) {
        _data.add(Data.map(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toMap()).toList();
    }
    return map;
  }

}

/// id : 1
/// BannerImg : "1"
/// BannerUrl : "2"
/// Name : ""

class Data {
  int _id;
  String _bannerImg;
  String _bannerUrl;
  String _name;

  int get id => _id;
  String get bannerImg => _bannerImg;
  String get bannerUrl => _bannerUrl;
  String get name => _name;

  Data({int id, String bannerImg, String bannerUrl, String name}){
    _id = id;
    _bannerImg = bannerImg;
    _bannerUrl = bannerUrl;
    _name = name;
}

  Data.map(dynamic obj) {
    _id = obj["id"];
    _bannerImg = obj["BannerImg"];
    _bannerUrl = obj["BannerUrl"];
    _name = obj["Name"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["BannerImg"] = _bannerImg;
    map["BannerUrl"] = _bannerUrl;
    map["Name"] = _name;
    return map;
  }

}