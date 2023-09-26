import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ListResources.dart';

class DisputeCreditScore extends StatefulWidget {
  const DisputeCreditScore({Key? key}) : super(key: key);

  @override
  State<DisputeCreditScore> createState() => _DisputeCreditScoreState();
}

class _DisputeCreditScoreState extends State<DisputeCreditScore> {
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
          disputeCreditScore,
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
                    "Unlimited Access: You Can Check Your CIBIL Score report every 34 hours.with in your subscripation peroid(1 month ,6 month,12 month).Here is what memebers get : unlimited Access,loan Offers,Credit Monitoring,Dispute Resoluation and more",
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
                    "https://www.cibil.com/",
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
                  ClipboardData(text: creditScoreDetailList[5].subtitle!))
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
