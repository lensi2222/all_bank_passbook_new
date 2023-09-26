import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Model/MutualFundDetails.dart';
import '../Resources/StringResources.dart';
import '../Resources/URLResource.dart';
import 'MutualFundDetailScreen.dart';

class MutualFundsClickScreen extends StatefulWidget {
  String? selectBank;

  MutualFundsClickScreen({Key? key, this.selectBank}) : super(key: key);

  @override
  State<MutualFundsClickScreen> createState() => _MutualFundsClickScreenState();
}

class _MutualFundsClickScreenState extends State<MutualFundsClickScreen> {
  int isSelected = 1;

  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  List<MutualFundCompany> mutualFundsList = [];
  String? selectedType;
  List fType = [];
  List closeEnded = [];
  List<dynamic> jsonDataList = [];
  List distinctIds = [];
  List closeEndedList = [];
  List<MutualData> mutualDataList = [];

  getData() async {
    var dio = Dio();
    var response = await dio.request(
      mutualFundsDetailURL + widget.selectBank!,
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      try {
        var responseData = json.decode(response.data);

        if (responseData is Map<String, dynamic>) {
          var jsonData = responseData['data'];

          // Create a list to store the JSON data

          if (jsonData is List) {
            jsonDataList = jsonData;
          } else {
            // If jsonData is not a list, add it as a single element to the jsonDataList
            jsonDataList.add(jsonData);
          }

          // Now you have the JSON data stored in the jsonDataList
          print(
              "---------jsondata-----------------------------${jsonDataList}");
          for (int i = 0; i < jsonDataList.length; i++) {
            var data = jsonDataList[i]; // Access the current map
            if (data['f_category'] == 'Open Ended Schemes') {
              fType.add(data['f_type']);
              distinctIds = fType.toSet().toList();
            }
            if (data['f_category'] == 'Close Ended Schemes') {
              closeEnded.add(data['f_type']);
              closeEndedList = closeEnded.toSet().toList();
            }
            setState(() {});
          }
          print("fType: $fType");
          print("fType-----------------: ${distinctIds}");
          print("fType123-----------------: ${closeEndedList}");
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

  getType() {
    mutualDataList.clear(); // Clear the list before filtering

    for (int i = 0; i < jsonDataList.length; i++) {
      var data = jsonDataList[i];

      if ((isSelected == 1 && data['f_category'] == 'Open Ended Schemes') ||
          (isSelected == 2 && data['f_category'] == 'Close Ended Schemes')) {
        if (selectedType == data['f_type']) {
          mutualDataList.add(MutualData(
            fCategory: data['f_category'],
            fHouseName: data['f_house_name'],
            fName: data['f_name'],
            fNetAssetValue: data['f_net_asset_value'],
            fType: data['f_type'],
          ));
        }
      }
    }
    print("----mutualDataList-----------------${mutualDataList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            widget.selectBank!,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected == 1
                                  ? Colors.purple
                                  : Colors.black,
                            ),
                            color:
                                isSelected == 1 ? Colors.purple : Colors.white,
                          ),
                          height: 6.h,
                          child: Center(
                            child: Text(
                              'Open Ended Scheme',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 11.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected == 2
                                  ? Colors.purple
                                  : Colors.black,
                            ),
                            color:
                                isSelected == 2 ? Colors.purple : Colors.white,
                          ),
                          height: 6.h,
                          child: Center(
                            child: Text(
                              'Close Ended Scheme',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isSelected == 1
                  ? Expanded(
                      child: distinctIds.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: distinctIds.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedType = distinctIds[index];
                                    getType();
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return MutualDetailScreen(
                                          mutualData: mutualDataList,
                                          selectType: selectedType,
                                          jsonDataList: jsonDataList,
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
                                            color: Colors.purple.shade300,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                distinctIds[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12.sp,
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
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    )
                  : Expanded(
                      child:
                          // mutualFundsList.isNotEmpty ?
                          ListView.builder(
                      shrinkWrap: true,
                      itemCount: closeEndedList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedType = closeEndedList[index];
                            getType();
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MutualDetailScreen(
                                  mutualData: mutualDataList,
                                  selectType: selectedType,
                                  jsonDataList: jsonDataList,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        closeEndedList[index],
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
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
                    )
                      // : Center(child: CircularProgressIndicator(),),
                      ),
            ],
          ),
        ));
  }
}

class MutualFundCompany {
  final String name;

  MutualFundCompany(this.name);

  factory MutualFundCompany.fromJson(Map<String, dynamic> json) {
    return MutualFundCompany(json['f_house_name'] as String ?? "");
  }
}
