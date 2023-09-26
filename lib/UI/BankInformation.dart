import 'dart:convert';

import 'package:all_bank_passbook_new/UI/BankInfoBankbalance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Model/BankInformationModel.dart';
import '../Resources/StringResources.dart';
import 'MissedCallBankBalance.dart';

class BankInformation extends StatefulWidget {
  const BankInformation({Key? key}) : super(key: key);

  @override
  State<BankInformation> createState() => _BankInformationState();
}

class _BankInformationState extends State<BankInformation> {
  TextEditingController txtSearch = TextEditingController();
  String selectBankName = '';
  String searchText = '';
  List<BankInformationBalanceCheck> bankInformationDataList = [];
  List<BankNumberDetail> bankNumberDetailList = [];

  Future<void> loadData() async {
    var data = await rootBundle.loadString("assets/json/bank_information.json");
    setState(() {
      bankInformationDataList = (json.decode(data) as List<dynamic>)
          .map((item) => BankInformationBalanceCheck.fromJson(item))
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
            bankInfo,
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
                padding: EdgeInsets.symmetric(horizontal: 2.9.w, vertical: 2.w),
                child: TextField(
                  onChanged: (search) {
                    setState(() {
                      searchText = search.toLowerCase();
                    });
                  },
                  controller: txtSearch,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.w),
                          borderSide: BorderSide(
                              color: Colors.purple.shade300, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
                      hintText: 'Search Here...',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                      contentPadding: const EdgeInsets.all(15)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bankInformationDataList
                      .where((bank) =>
                          bank.bankName!.toLowerCase().contains(searchText))
                      .length,
                  itemBuilder: (context, index) {
                    final filteredList = bankInformationDataList
                        .where((bank) =>
                            bank.bankName!.toLowerCase().contains(searchText))
                        .toList();
                    final bank = filteredList[index];
                    return InkWell(
                      onTap: () {
                        selectBankName =
                            bankInformationDataList[index].bankName!;
                        selectBankNameFun();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BankInfoBankBalance(
                              bankNumberData: bankNumberDetailList,
                              bankName: selectBankName,
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
                                    bank.bankName!,
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
                ),
              ),
            ],
          ),
        ));
  }
}
