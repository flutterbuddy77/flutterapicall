import 'dart:async';
import 'dart:convert';
import 'package:flutterapicalls/Models/BrandModel.dart';
import 'package:flutterapicalls/Models/Responces/MyApplianceModel.dart';
import 'package:http/http.dart' as http;

final _baseUrl = "http://103.50.163.29:5001/api";

class TestApiProvider {
  
  Future<BrandModel> fetchBrandList() async {
    print("entered");
    final response = await http.get(_baseUrl + "/Appliance/GetBrand");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return BrandModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MyApplianceModel> fetchMyAppliance(int movieI) async {
    final Map<String, dynamic> body = {
      "UserId": 6,
      "Creator": 0,
      "Modifier": 0
    };
    try {
      final response = await http.post(
          Uri.encodeFull(_baseUrl + "/Appliance/GetMyAppliance"),
           headers: {"Content-Type": "application/json"},
          body: json.encode(body));

      print(response.body.toString());

      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        print(response.body.toString());
        return MyApplianceModel.fromJson(json.decode(response.body));
      } else {
        // If that call was not successful, throw an error.
        print(response.body.toString());
        //throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Future<MyApplianceModel> createPost(String url, {Map body}) async {
  //   Client client = Client();
  //   return client.post(url, body: body).then((http.Response response) {
  //     final int statusCode = response.statusCode;
  //     if (statusCode < 200 || statusCode > 400 || json == null) {
  //       throw new Exception("Error while fetching data");
  //     }
  //     return MyApplianceModel.fromJson(json.decode(response.body));
  //   });
}

// Future<void> deletePost(int id) async {
//   Response res = await delete("$postsURL/$id");
//   if (res.statusCode == 200) {
//     print("DELETED");
//   } else {
//     throw "Can't delete post.";
//   }
// }
