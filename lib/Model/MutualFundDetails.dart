class MutualData {
  String? fCategory;
  String? fType;
  String? fHouseName;
  String? fName;
  String? fNetAssetValue;

  MutualData({
    this.fCategory,
    this.fType,
    this.fHouseName,
    this.fName,
    this.fNetAssetValue,
  });

  MutualData.fromJson(Map<String, dynamic> json) {
    fCategory = json['f_category'];
    fType = json['f_type'];
    fHouseName = json['f_house_name'];
    fName = json['f_name'];
    fNetAssetValue = json['f_net_asset_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_category'] = this.fCategory;
    data['f_type'] = this.fType;
    data['f_house_name'] = this.fHouseName;
    data['f_name'] = this.fName;
    data['f_net_asset_value'] = this.fNetAssetValue;
    return data;
  }
}
