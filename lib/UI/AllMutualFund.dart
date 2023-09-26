import 'dart:convert';

import 'package:all_bank_passbook_new/Resources/ListResources.dart';
import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Model/MutualFundsModel.dart';
import '../Repository/MutualFundRepo.dart';
import 'MutualClickScreen.dart';

class MutualFundCompany {
  final String name;

  MutualFundCompany(this.name);

  factory MutualFundCompany.fromJson(Map<String, dynamic> json) {
    return MutualFundCompany(json['f_house_name'] as String ?? "");
  }
}

class AllMutualFund extends StatefulWidget {
  AllMutualFund({Key? key}) : super(key: key);

  @override
  State<AllMutualFund> createState() => _AllMutualFundState();
}

class _AllMutualFundState extends State<AllMutualFund> {
  @override
  var selectedBank;
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
  List<MutualFundCompany> mutualFundsList = [];

  getData() async {
    var dio = Dio();
    var response = await dio.request(
      'http://www.sensiblemobiles.com/mutual_funds/fundhouse.php',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      try {
        var responseData = json.decode(response.data);

        if (responseData is Map<String, dynamic>) {
          var jsonData = responseData['data'];

          if (jsonData is List<dynamic>) {
            // Clear the list before adding new items
            mutualFundsList.clear();

            for (var item in jsonData) {
              try {
                MutualFundCompany mutualFundCompany =
                MutualFundCompany.fromJson(item);
                mutualFundsList.add(mutualFundCompany);
              } catch (e) {
                print("Error parsing item: $e");
              }
            }

            // Remove the item at index 0
            if (mutualFundsList.isNotEmpty) {
              mutualFundsList.removeAt(0);
            }

            // Update the UI with the new data
            setState(() {});

            print('===============$mutualFundsList');
          } else {
            print("Invalid data format: 'data' field is not a List");
          }
        } else {
          print("Invalid response format: Not a Map");
        }
      } catch (e) {
        print("Error parsing JSON response: $e");
      }
    } else {
      print(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            mutualFund,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              Expanded(
                child: mutualFundsList.isNotEmpty?ListView.builder(
                  shrinkWrap: true,
                  itemCount: mutualFundsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedBank =   mutualFundsList[index].name;
                        print(selectedBank);

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return  MutualFundsClickScreen(
                              selectBank: selectedBank,
                            );
                          },
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.purple.shade300, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    mutualFundsList[index].name,
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ):Center(child: CircularProgressIndicator(),),
              ),
            ],
          ),
        ));
  }

}
