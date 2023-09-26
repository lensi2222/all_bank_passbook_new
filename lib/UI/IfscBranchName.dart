import 'package:all_bank_passbook_new/Model/IFSCCodeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class IfscBranchName extends StatefulWidget {
  List<IfscCodeModel>? ifscCodeList;
  List<String>? ifscCodeBranchDataList;

  IfscBranchName({Key? key, this.ifscCodeBranchDataList, this.ifscCodeList})
      : super(key: key);

  @override
  State<IfscBranchName> createState() => _IfscBranchNameState();
}

class _IfscBranchNameState extends State<IfscBranchName> {
  var selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, selectedBranch);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.purple.shade50,
          title: Text(
            selectBranch,
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
                    itemCount: widget.ifscCodeBranchDataList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedBranch =
                                widget.ifscCodeBranchDataList![index];
                          });

                          Navigator.pop(context, selectedBranch);
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
                                            widget
                                                .ifscCodeBranchDataList![index],
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
