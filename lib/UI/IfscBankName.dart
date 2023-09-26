import 'dart:developer';

import 'package:all_bank_passbook_new/Model/IFSCCodeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ListResources.dart';
import '../Resources/StringResources.dart';

class IfscBankName extends StatefulWidget {
  List<IfscCodeModel>? ifscCodeList;

  IfscBankName({Key? key, this.ifscCodeList}) : super(key: key);
  static List<String> ifscCodeStateDataList = [];

  @override
  State<IfscBankName> createState() => _IfscBankNameState();
}

class _IfscBankNameState extends State<IfscBankName> {
  String? selectBankName;

  selectBankNameFun() {
    for (int i = 0; i < widget.ifscCodeList!.length; i++) {
      if (selectBankName == widget.ifscCodeList![i].bankName) {
        IfscBankName.ifscCodeStateDataList = widget.ifscCodeList![i].stateList!;
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
                Navigator.pop(context, selectBankName);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            selectBank,
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
                    itemCount: widget.ifscCodeList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectBankName =
                                widget.ifscCodeList![index].bankName!;
                            selectBankNameFun();
                          });
                          Navigator.pop(context, selectBankName);
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            widget.ifscCodeList![index].bankName!,
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
