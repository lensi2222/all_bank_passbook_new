import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LumpsumCalculator extends StatefulWidget {
  const LumpsumCalculator({Key? key}) : super(key: key);

  @override
  State<LumpsumCalculator> createState() => _LumpsumCalculatorState();
}

class _LumpsumCalculatorState extends State<LumpsumCalculator> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController timePeriodController = TextEditingController();
  String result = '';
  String principalamount = "";
  String wealth = "";
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
          lumpsumCalculator,
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
                    hintText: 'Enter Principal Amount...',
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
                    hintText: 'Enter Interest Rate(%)',
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
                loanPeriod,
                style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: timePeriodController,
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
                    hintText: 'Enter Time Period(Year)',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    contentPadding: const EdgeInsets.all(12)),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {
                  setState(() {
                    if (principalController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Amount",
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
                    } else if (timePeriodController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter You Month",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      isVisible = true;
                      calculateLumpSum();
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
                          horizontal: 5.0.w, vertical: 3.h),
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
                                children: [
                                  Expanded(
                                    child: Text(
                                      netAmounts,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$principalamount ₹',
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
                                      totalWealth,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$wealth ₹',
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
                                      totalAmount,
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

  void calculateLumpSum() {
    double principal = double.tryParse(principalController.text) ?? 0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0;
    double timePeriod = double.tryParse(timePeriodController.text) ?? 0;

    double totalAmount = principal * (1 + (interestRate / 100) * timePeriod);
    double abc = principal;
    double xyz = totalAmount - principal;

    setState(() {
      result = '${totalAmount.toStringAsFixed(2)}';
      principalamount = '${abc.toStringAsFixed(2)}';
      wealth = '${xyz.toStringAsFixed(2)}';
    });
  }
}
