import 'dart:developer';

import 'package:all_bank_passbook_new/UI/IfscStateName.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Model/IFSCCodeModel.dart';

class IfscCityName extends StatefulWidget {
  List<String>? ifscCodeCityDataList;

  List<IfscCodeModel>? ifscCodeList;
  String? selectdBank;
  String? selectStateName;

  IfscCityName(
      {Key? key,
      this.ifscCodeCityDataList,
      this.ifscCodeList,
      this.selectdBank,
      this.selectStateName})
      : super(key: key);
  static List<String>? ifscCodeBranchDataList;

  @override
  State<IfscCityName> createState() => _IfscCityNameState();
}

class _IfscCityNameState extends State<IfscCityName> {
  var selectCity;

  selectCityNameFun() {
    IfscCityName.ifscCodeBranchDataList != [];
    for (int i = 0; i < widget.ifscCodeList!.length; i++) {
      for (int j = 0; j < widget.ifscCodeList![i].stateList!.length; j++) {
        if (widget.selectStateName == widget.ifscCodeList![i].stateList![j]) {
          // for (int k = 0; k < widget.ifscCodeList![i].city!.length; k++) {
          if (widget.selectdBank == widget.ifscCodeList![i].bankName) {
            for (int k = 0; k < widget.ifscCodeList![i].branch!.length; k++) {
              print(
                  "******-------*******${widget.ifscCodeList![i].branch![k].city!}");
              if (selectCity == widget.ifscCodeList![i].branch![k].city!) {
                IfscCityName.ifscCodeBranchDataList =
                    widget.ifscCodeList![i].branch![k].branchList!;
                setState(() {});

                print(
                    "=-=-=====branch=-=-=-=-=-=-==${IfscStateName.ifscCodeCityDataList}");
              }
            }

            // }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, selectCity);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            "Select City",
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.ifscCodeCityDataList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectCity = widget.ifscCodeCityDataList![index];

                            selectCityNameFun();
                          });

                          Navigator.pop(context, selectCity);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.purple.shade300, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            widget.ifscCodeCityDataList![index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
