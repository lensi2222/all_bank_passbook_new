import 'dart:developer';


import '../APIManager/API.dart';
import '../Model/BinCheckerModel.dart';
class BinCheckRepository{
  static Future<BinCheckerModel> ads({
    required String endPoint,
  }) async {

    final response = await API.requestAds(endPoint);

    return response;
  }
}