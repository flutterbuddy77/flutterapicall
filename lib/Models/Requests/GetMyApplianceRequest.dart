//import 'BaseRequest.dart';

class GetMyApplianceRequest {
  final int userId;

  GetMyApplianceRequest({this.userId});

  factory GetMyApplianceRequest.fromJson(Map<String, dynamic> json) {
    return GetMyApplianceRequest(
      userId: json['userId'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;

    return map;
  }
}

// class GetMyApplianceRequest extends BaseRequest {
//   final int UserId;

//   GetMyApplianceRequest({this.UserId});

//   factory GetMyApplianceRequest.fromJson(Map<String, dynamic> json) {
//     return GetMyApplianceRequest(
//       UserId: json['UserId'],
//     );
//   }

//   Map toMap() {
//     var map = new Map<String, dynamic>();
//     map["UserId"] = UserId;

//     return map;
//   }
// }
