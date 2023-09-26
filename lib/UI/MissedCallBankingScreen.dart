import 'dart:convert';

import 'package:all_bank_passbook_new/UI/MissedCallBankBalance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Model/MissedcallBanking.dart';
import '../Resources/ImagesResources.dart';

class MissedCallBankingScreen extends StatefulWidget {
  const MissedCallBankingScreen({Key? key}) : super(key: key);

  @override
  State<MissedCallBankingScreen> createState() =>
      _MissedCallBankingScreenState();
}

class _MissedCallBankingScreenState extends State<MissedCallBankingScreen> {
  String selectBankName = '';
  List<BankInformationModel> bankInformationDataList = [];
  List<BankNumberDetail> bankNumberDetailList = [];

  Future<void> loadData() async {
    var data = await rootBundle.loadString("assets/json/missed_call_banking.json");
    setState(() {
      bankInformationDataList = (json.decode(data) as List<dynamic>)
          .map((item) => BankInformationModel.fromJson(item))
          .toList();
      if (kDebugMode) {
        print(
            "=--=-==-=-=BANK INFORMATION DATA=-=-=-=-=-=-$bankInformationDataList");
      }
    });
  }

  selectBankNameFun() {
    for (int i = 0; i < bankInformationDataList.length; i++) {
      if (selectBankName == bankInformationDataList[i].bankName) {
        bankNumberDetailList = bankInformationDataList[i].bankNumberDetail!;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});

    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          backgroundColor: Colors.purple.shade50,
          title: Text(
            'Missed Call Bank Balance',
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bankInformationDataList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectBankName = bankInformationDataList[index].bankName!;

                      print("---selectbank-----${selectBankName}");
                      selectBankNameFun();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MissedCallBankBalance(
                            bankNumberData: bankNumberDetailList,
                            bankName: selectBankName,
                          );
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12),
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
                            Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    bankInformationDataList[index].bankImages!,
                                    height: 8.h,
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      bankInformationDataList[index].bankName!,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
