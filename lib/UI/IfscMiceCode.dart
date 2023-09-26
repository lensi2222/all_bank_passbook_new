import 'dart:convert';
import 'dart:developer';
import 'package:all_bank_passbook_new/Model/IFSCCodeModel.dart';
import 'package:all_bank_passbook_new/UI/IfscBankName.dart';
import 'package:all_bank_passbook_new/UI/IfscBranchName.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../Resources/StringResources.dart';
import 'IfscCityName.dart';
import 'IfscStateName.dart';

class IfscMiceCode extends StatefulWidget {
  const IfscMiceCode({Key? key}) : super(key: key);
  static List<IFSCCodeList> ifscCodeDataList = [];

  @override
  State<IfscMiceCode> createState() => _IfscMiceCodeState();
}

class _IfscMiceCodeState extends State<IfscMiceCode> {
  int tempIndex = 0;

  var selectedBank;
  var selectedState;
  var selectedCity;
  var selectedBranch;
  List<IfscCodeModel> allIfscCodeDataList = [];
  List<String> ifscCodeBranchDataList = [];

  Future<void> loadData() async {
    var data = await rootBundle.loadString("assets/json/Ifsc_code.json");
    var data2 = await rootBundle.loadString("assets/json/json_code2.json");
    var data3 = await rootBundle.loadString("assets/json/json_data3.json");
      allIfscCodeDataList =  (json.decode(data) as List<dynamic>)
          .map((item) => IfscCodeModel.fromJson(item))
          .toList();
      allIfscCodeDataList.addAll((json.decode(data2) as List<dynamic>).map((item) => IfscCodeModel.fromJson(item)).toList());
      allIfscCodeDataList.addAll(
        (json.decode(data3) as List<dynamic>)
            .map((item) => IfscCodeModel.fromJson(item))
            .toList(),
      );
      if (kDebugMode) {
        print("=--=-==-=-=BANK DATA=-=-=-=-=-=-$allIfscCodeDataList");
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  selectBranchNameFun() {
    for (int i = 0; i < allIfscCodeDataList.length; i++) {
      for (int j = 0; j < allIfscCodeDataList[i].stateList!.length; j++) {
        for (int l = 0; l < allIfscCodeDataList[i].iFSCCode!.length; l++) {
          if (selectedBranch == allIfscCodeDataList[i].iFSCCode![l].branch) {
   
            IfscMiceCode.ifscCodeDataList =
                allIfscCodeDataList[i].iFSCCode![l].iFSCCodeList!;
          }
        }
      }
    }
  }

  String? tempString;

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
            ifscCode,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Text(
                      ifscAndMiceCode,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ifscandpassbookDummyText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bank,
                      style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      selectedState = null;
                      selectedCity = null;
                      selectedBranch = null;
                      // IfscMiceCode.ifscCodeDataList.clear();

                      selectedBank =
                          await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return IfscBankName(
                            ifscCodeList: allIfscCodeDataList,
                          );
                        },
                      ));
                      if (selectedBank != null) {
                        setState(() {
                          selectBank;
                        });
                      }
                    },
                    child: Container(
                      height: 55,
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
                                Text(
                                  selectedBank ?? selectBank,
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 30,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectedBank != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state,
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                selectedCity = null;
                                selectedBranch = null;
                                // IfscMiceCode.ifscCodeDataList.clear();
                                selectedState = await Navigator.push(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return IfscStateName(
                                      ifscCodeList: allIfscCodeDataList,
                                      ifscCodeStateDataList:
                                          IfscBankName.ifscCodeStateDataList,
                                      selectdBank: selectedBank,
                                    );
                                  },
                                ));
                                if (selectedState != null) {
                                  setState(() {
                                    selectState;
                                  });
                                }
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.purple.shade300,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            selectedState ?? selectState,
                                            style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 30,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectedState != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                city,
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                // selectedBranch = null;
                                // IfscMiceCode.ifscCodeDataList.clear();
                                print("selectcity ==========${selectedCity}");
                                selectedCity = await Navigator.push(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return IfscCityName(
                                      ifscCodeList: allIfscCodeDataList,
                                      selectdBank: selectedBank,
                                      selectStateName: selectedState,
                                      ifscCodeCityDataList:
                                          IfscStateName.ifscCodeCityDataList,
                                    );
                                  },
                                ));
                                if (selectedState != null) {
                                  setState(() {
                                    selectCity;
                                  });
                                }
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.purple.shade300,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            selectedCity ?? selectCity,
                                            style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 30,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectedCity != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                branch,
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                // IfscMiceCode.ifscCodeDataList.clear();
                                selectedBranch = await Navigator.push(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return IfscBranchName(
                                      ifscCodeBranchDataList:
                                          IfscCityName.ifscCodeBranchDataList,
                                      ifscCodeList: allIfscCodeDataList,
                                    );
                                  },
                                ));

                                if (selectedBranch != null) {
                                  setState(() {});
                                }
                                selectBranchNameFun();
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.purple.shade300,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            selectedBranch ?? selectBranch,
                                            style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 30,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 2.h,
                  ),
                  if (selectedBranch != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: IfscMiceCode.ifscCodeDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          tempIndex = index;

                          return Wrap(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.purple.shade300,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "IFSC Code:",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              IfscMiceCode
                                                  .ifscCodeDataList[index]
                                                  .iFSCCodeText!,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              micrCode,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              IfscMiceCode
                                                  .ifscCodeDataList[index]
                                                  .mICRCode!,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              phoneNo,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              IfscMiceCode
                                                  .ifscCodeDataList[index]
                                                  .phoneNo!,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              address,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              IfscMiceCode
                                                  .ifscCodeDataList[index]
                                                  .address!,
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  selectedBranch != null
                      ? Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                          text: IfscMiceCode
                                              .ifscCodeDataList[tempIndex]
                                              .iFSCCodeText!))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Copied to Clipboard")));
                                  });
                                },
                                child: Container(
                                  height: 4.5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.purple,
                                  ),
                                  child: Center(
                                    child: Text(
                                      copyIfsc,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  tempString =
                                      """IFSCCode:${IfscMiceCode.ifscCodeDataList[tempIndex].iFSCCodeText!},
    MICRACode:${IfscMiceCode.ifscCodeDataList[tempIndex].mICRCode!},
    Phone NO:${IfscMiceCode.ifscCodeDataList[tempIndex].phoneNo!},
    Address:${IfscMiceCode.ifscCodeDataList[tempIndex].address!}""";
                                  Clipboard.setData(
                                          ClipboardData(text: tempString!))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Copied to Clipboard")));
                                  });
                                },
                                child: Container(
                                  height: 4.5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.purple,
                                  ),
                                  child: Center(
                                    child: Text(
                                      copyAll,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  tempString =
                                      """IFSCCode:${IfscMiceCode.ifscCodeDataList[tempIndex].iFSCCodeText!},
    MICRACode:${IfscMiceCode.ifscCodeDataList[tempIndex].mICRCode!},
    Phone NO:${IfscMiceCode.ifscCodeDataList[tempIndex].phoneNo!},
    Address:${IfscMiceCode.ifscCodeDataList[tempIndex].address!}""";
                                  _onShare(context);
                                },
                                child: Container(
                                  height: 4.5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.purple,
                                  ),
                                  child: Center(
                                    child: Text(
                                      share,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(tempString!,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
