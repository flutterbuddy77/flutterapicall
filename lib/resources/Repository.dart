import 'package:flutterapicalls/API/TestApiProvider.dart';
import 'package:flutterapicalls/Models/BrandModel.dart';
import 'package:flutterapicalls/Models/Requests/GetMyApplianceRequest.dart';
import 'package:flutterapicalls/Models/Responces/MyApplianceModel.dart';

class Repository {
  final testApiProvider = TestApiProvider();

  Future<BrandModel> fetchAllBrands() => testApiProvider.fetchBrandList();

  Future<MyApplianceModel> fetchMyAppliance(GetMyApplianceRequest movieId) =>
      testApiProvider.fetchMyAppliance(movieId);
}
