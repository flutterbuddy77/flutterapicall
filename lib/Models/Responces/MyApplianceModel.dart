class MyApplianceModel {
  List<GetMyApplianceModel> getMyApplianceModel;
  int errorCode;
  String errorMessage;
  bool success;

  MyApplianceModel(
      {this.getMyApplianceModel,
      this.errorCode,
      this.errorMessage,
      this.success});

  MyApplianceModel.fromJson(Map<String, dynamic> json) {
    if (json['GetMyApplianceModel'] != null) {
      getMyApplianceModel = new List<GetMyApplianceModel>();
      json['GetMyApplianceModel'].forEach((v) {
        getMyApplianceModel.add(new GetMyApplianceModel.fromJson(v));
      });
    }
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getMyApplianceModel != null) {
      data['GetMyApplianceModel'] =
          this.getMyApplianceModel.map((v) => v.toJson()).toList();
    }
    data['ErrorCode'] = this.errorCode;
    data['ErrorMessage'] = this.errorMessage;
    data['success'] = this.success;
    return data;
  }
}

class GetMyApplianceModel {
  int applianceId;
  String modelNo;
  String brandName;
  String applianceTypeName;
  String warrantyStartDate;
  String warrantyEndDate;
  String imageUrl;

  GetMyApplianceModel(
      {this.applianceId,
      this.modelNo,
      this.brandName,
      this.applianceTypeName,
      this.warrantyStartDate,
      this.warrantyEndDate,
      this.imageUrl});

  GetMyApplianceModel.fromJson(Map<String, dynamic> json) {
    applianceId = json['ApplianceId'];
    modelNo = json['ModelNo'];
    brandName = json['BrandName'];
    applianceTypeName = json['ApplianceTypeName'];
    warrantyStartDate = json['WarrantyStartDate'];
    warrantyEndDate = json['WarrantyEndDate'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplianceId'] = this.applianceId;
    data['ModelNo'] = this.modelNo;
    data['BrandName'] = this.brandName;
    data['ApplianceTypeName'] = this.applianceTypeName;
    data['WarrantyStartDate'] = this.warrantyStartDate;
    data['WarrantyEndDate'] = this.warrantyEndDate;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}
