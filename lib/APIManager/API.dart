import 'dart:developer';
import '../Model/BinCheckerModel.dart';
import '../Model/MutualFundsModel.dart';
import '../Resources/URLResource.dart';
import 'httpManager.dart';

class API {
  static var httpManager = HTTPManager();

  static Future<BinCheckerModel> requestAds(String endpoint) async {
    final result = await httpManager.get(
      url: binkCheckURL + endpoint,
      loading: false,
    );

    return BinCheckerModel.fromJson(result);
  }

  static Future<MutualFundsModel> requestMutual() async {
    final result = await httpManager.get(
      url: mutualFundsURL,
      loading: false,
    );
    ;
    return MutualFundsModel.fromJson(result);
  }

  // static Future<MutualFundsDetailModel> requestMutualClick(
  //     String endpoint) async {
  //   final result = await httpManager.get(
  //     url: mutualFundsDetailURL + endpoint,
  //     loading: false,
  //   );
  //   ;
  //   return MutualFundsDetailModel.fromJson(result);
  // }
}
