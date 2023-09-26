
import 'dart:developer';

import '../APIManager/API.dart';
import '../Model/MutualFundsModel.dart';
class MutualFundsRepository{
  ///Fetch api ads
  static Future<MutualFundsModel> ads() async {
    final response = await API.requestMutual();
    ;
    return response;
  }
}