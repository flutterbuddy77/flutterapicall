class BrandModel {
  List<GetBrandModel> getBrandModel;
  int errorCode;
  String errorMessage;
  bool success;

  BrandModel(
      {this.getBrandModel, this.errorCode, this.errorMessage, this.success});

  BrandModel.fromJson(Map<String, dynamic> json) {
    if (json['GetBrandModel'] != null) {
      getBrandModel = new List<GetBrandModel>();
      json['GetBrandModel'].forEach((v) {
        getBrandModel.add(new GetBrandModel.fromJson(v));
      });
    }
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getBrandModel != null) {
      data['GetBrandModel'] =
          this.getBrandModel.map((v) => v.toJson()).toList();
    }
    data['ErrorCode'] = this.errorCode;
    data['ErrorMessage'] = this.errorMessage;
    data['success'] = this.success;
    return data;
  }
}

class GetBrandModel {
  int brandId;
  String name;
  String imageUrl;

  GetBrandModel({this.brandId, this.name, this.imageUrl});

  GetBrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['BrandId'];
    name = json['Name'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BrandId'] = this.brandId;
    data['Name'] = this.name;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}
