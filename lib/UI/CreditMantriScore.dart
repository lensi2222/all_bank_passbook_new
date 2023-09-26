import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ListResources.dart';

class CreditMantriScore extends StatefulWidget {
  const CreditMantriScore({Key? key}) : super(key: key);

  @override
  State<CreditMantriScore> createState() => _CreditMantriScoreState();
}

class _CreditMantriScoreState extends State<CreditMantriScore> {
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
          mantriCreditScore,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade300, width: 1.5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.purple.shade100,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                      offset: const Offset(3, 7)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "india Ratings and research (Ind-RA) is indias MOst Respected credit ratting agenct committed to prvoding india's credit markets asscurate,timely and prospective credit opinions",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 7.h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade300, width: 1.5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.purple.shade100,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                      offset: const Offset(3, 7)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "https://www.creditmantri.com/",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(
                  ClipboardData(text: creditScoreDetailList[6].subtitle!))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Copied to Clipboard")));
              });
            },
            child: Container(
              height: 6.h,
              width: 28.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Center(
                child: Text(
                  "Copy Link",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
