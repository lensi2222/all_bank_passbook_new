import 'dart:async';

import 'package:all_bank_passbook_new/Model/IFSCCodeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class IfscStateName extends StatefulWidget {
  List<String>? ifscCodeStateDataList;
  List<IfscCodeModel>? ifscCodeList;
  String? selectdBank;

  IfscStateName({Key? key,
    this.ifscCodeStateDataList,
    this.ifscCodeList,
    this.selectdBank})
      : super(key: key);
  static List<String>? ifscCodeCityDataList;

  @override
  State<IfscStateName> createState() => _IfscStateNameState();
}

class _IfscStateNameState extends State<IfscStateName> {
  String? selectStateName;

  selectStateNameFun() {
    for (int i = 0; i < widget.ifscCodeList!.length; i++) {
      for (int j = 0; j < widget.ifscCodeList![i].stateList!.length; j++) {
        if (widget.selectdBank == widget.ifscCodeList![i].bankName) {
          if (selectStateName == widget.ifscCodeList![i].city![j].state!) {
            IfscStateName.ifscCodeCityDataList =
            widget.ifscCodeList![i].city![j].cityList!;
          }
        }
      }
    }
  }
 Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer=  Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        widget.ifscCodeStateDataList!;
        print("111111111111111111111111111${widget.ifscCodeStateDataList!}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, selectStateName);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            selectState,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body:
        widget.ifscCodeStateDataList == null ? Center(
          child: CircularProgressIndicator(color: Colors.purple,),
        ) :
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.ifscCodeStateDataList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          timer!.cancel();
                          setState(() {
                            selectStateName =
                            widget.ifscCodeStateDataList![index];
                            selectStateNameFun();
                          });
                          Navigator.pop(context, selectStateName);
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
                                            widget
                                                .ifscCodeStateDataList![index],
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
            ))
    );
  }
}
