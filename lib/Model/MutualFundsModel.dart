class MutualFundsModel {
  String? success;
  List<Data>? data;

  MutualFundsModel({this.success, this.data});

  // Parse JSON data to create a MutualFundsModel object
  factory MutualFundsModel.fromJson(Map<String, dynamic> json) {
    return MutualFundsModel(
      success: json['success'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  String? fHouseName;

  Data({this.fHouseName});

  // Parse JSON data to create a Data object
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      fHouseName: json['f_house_name'],
    );
  }
}
