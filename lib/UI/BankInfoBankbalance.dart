import 'dart:io';

import 'package:all_bank_passbook_new/Model/BankInformationModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';

class BankInfoBankBalance extends StatefulWidget {
  String? bankName;
  List<BankNumberDetail>? bankNumberData;
   BankInfoBankBalance({Key? key,this.bankNumberData,this.bankName}) : super(key: key);

  @override
  State<BankInfoBankBalance> createState() => _BankInfoBankBalanceState();
}

class _BankInfoBankBalanceState extends State<BankInfoBankBalance> {
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
            widget.bankName!,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              bankBalanceCheck,
              style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                bankInfoBalance,
                style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 1.h,
                      );
                    },
                    itemCount: widget.bankNumberData!.length,
                    // itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return

                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                try {
                                  if (Platform.isAndroid) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].bankBalance!}";
                                    await launchUrl(Uri.parse(uri));
                                  } else if (Platform.isIOS) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].bankBalance!}";
                                    await launchUrl(Uri.parse(uri));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Some error occurred. Please try again!'),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      bankBalance,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 10.h,
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
                                              Image.asset(
                                                missedCallImg,
color: Colors.purple,
                                                height: 10.h,
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                widget.bankNumberData![index]
                                                    .bankBalance!,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InkWell(
                              onTap: () async {
                                try {
                                  if (Platform.isAndroid) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].miniStatement!}";
                                    await launchUrl(Uri.parse(uri));
                                  } else if (Platform.isIOS) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].miniStatement!}";
                                    await launchUrl(Uri.parse(uri));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Some error occurred. Please try again!'),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      miniStatement,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 10.h,
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
                                              Image.asset(
                                                missedCallImg,
                                                color: Colors.purple,
                                                height: 10.h,
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                widget.bankNumberData![index]
                                                    .miniStatement!,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () async {
                                try {
                                  if (Platform.isAndroid) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].customerCare!}";
                                    await launchUrl(Uri.parse(uri));
                                  } else if (Platform.isIOS) {
                                    String uri =
                                        "tel:${widget.bankNumberData![index].customerCare!}";
                                    await launchUrl(Uri.parse(uri));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Some error occurred. Please try again!'),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      customerCare,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 10.h,
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
                                              Image.asset(
                                                missedCallImg,
                                                color: Colors.purple,
                                                height: 10.h,
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                widget.bankNumberData![index]
                                                    .customerCare!,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
