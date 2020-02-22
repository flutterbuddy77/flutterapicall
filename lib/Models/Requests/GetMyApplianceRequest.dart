import 'BaseRequest.dart';

// class GetMyApplianceRequest {
//   final int userId;

//   GetMyApplianceRequest({this.userId});

//   factory GetMyApplianceRequest.fromJson(Map<String, dynamic> json) {
//     return GetMyApplianceRequest(
//       userId: json['userId'],
//     );
//   }

//   Map toMap() {
//     var map = new Map<String, dynamic>();
//     map["userId"] = userId;

//     return map;
//   }
// }
class GetMyApplianceRequest {
  int userId;
  int creator;
  int modifier;

  GetMyApplianceRequest({this.userId, this.creator, this.modifier});

  GetMyApplianceRequest.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    creator = json['Creator'];
    modifier = json['Modifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Creator'] = this.creator;
    data['Modifier'] = this.modifier;
    return data;
  }
}
