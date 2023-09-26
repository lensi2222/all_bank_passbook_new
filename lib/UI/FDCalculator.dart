import 'dart:math';

import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FDCalculatorScreen extends StatefulWidget {
  @override
  _FDCalculatorScreenState createState() => _FDCalculatorScreenState();
}

class _FDCalculatorScreenState extends State<FDCalculatorScreen> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  String result = '';
  String deposit = "";
  String investment = "";
  bool isVisible = false;

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
          "FD Calculators",
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                principalAmount,
                style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    hintText: 'Enter principal amount...',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    contentPadding: const EdgeInsets.all(12)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                interestRate,
                style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: interestRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    hintText: 'Enter Interest Rate...',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    contentPadding: const EdgeInsets.all(12)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                month,
                style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide(color: Colors.purple.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    hintText: 'Enter Your Month...',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    contentPadding: const EdgeInsets.all(12)),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {
                  setState(() {
                    if (principalController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Principal Amount",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (interestRateController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Interest Rate",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (durationController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Your Month ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      calculateMaturityAmount();
                      isVisible = true;
                    }
                  });


                },
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple),
                  child: const Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              isVisible
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0.w, vertical: 5.h),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w, vertical: 2.h),
                          child: Wrap(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text(
                                      depositAmount,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$deposit ₹',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      totalInterest,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$investment ₹',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      maturity,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$result ₹',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void calculateMaturityAmount() {
    double principal = double.tryParse(principalController.text) ?? 0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0;
    int durationInMonths = int.tryParse(durationController.text) ?? 0;

    double maturityAmount =
        principal * pow((1 + (interestRate / (12 * 100))), durationInMonths);
    double amount = principal;
    double value = maturityAmount - amount;
    setState(() {
      result = '${maturityAmount.toStringAsFixed(2)}';
      deposit = '${amount.toStringAsFixed(2)}';
      investment = '${value.toStringAsFixed(2)}';
    });
  }
}
