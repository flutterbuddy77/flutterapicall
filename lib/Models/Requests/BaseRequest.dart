class BaseRequest {
  final int Creator;
  final int Modifier;
  // final String title;
  // final String body;

  BaseRequest({this.Creator, this.Modifier});

  factory BaseRequest.fromJson(Map<String, dynamic> json) {
    return BaseRequest(
      Creator: json['Creator'],
      Modifier: json['Modifier'],
      // title: json['title'],
      // body: json['body'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["Creator"] = Creator;
    map["Modifier"] = Modifier;
    //map["body"] = body;

    return map;
  }
}
