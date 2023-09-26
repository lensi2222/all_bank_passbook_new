import 'dart:developer';

import 'package:all_bank_passbook_new/Resources/ImagesResources.dart';
import 'package:all_bank_passbook_new/UI/BinCheakerDetail.dart';
import 'package:all_bank_passbook_new/UI/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Repository/BinCheckerRepo.dart';

class BinCheckerScreen extends StatefulWidget {
  const BinCheckerScreen({Key? key}) : super(key: key);

  @override
  State<BinCheckerScreen> createState() => _BinCheckerScreenState();
}

class _BinCheckerScreenState extends State<BinCheckerScreen> {
  TextEditingController principalController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var result;
  bool loading = false;

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
          'Bin Checker',
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Colors.purple.shade400,
                ),
                height: 30.h,
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "THE BANK OF ANYTHING",
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        child: Image.asset(chipImg,
                            height: 5.h, width: 15.w, fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TextField(
                          controller: principalController,
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.poppins(
                            // Set the text style
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.white
                                .withOpacity(0.9), // Set the desired text color
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Bin Number',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.sp,
                                  color: Colors.white.withOpacity(0.4)),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          width: double.infinity,
                          height: 0.2.h,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: InkWell(
                onTap: () async {
                  if (principalController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please Enter Card Deatil",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    loading = true;
                    if (loading == true) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            insetPadding: EdgeInsets.all(140),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.h),
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }

                    result = await BinCheckRepository.ads(
                        endPoint: principalController.text);

                    if (result.bank != null) {
                      loading = false;
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BinCheckerDetailScreen(
                            binNumber: principalController.text,
                            bindetail: result,
                          );
                        },
                      ));
                    } else {
                      loading = false;
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: "Invalid Bin Number",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    setState(() {});
                  }
                },
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple),
                  child: const Center(
                    child: Text(
                      'Check',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
