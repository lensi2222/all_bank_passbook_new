import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class PPFCalculator extends StatefulWidget {
  @override
  _PPFCalculatorState createState() => _PPFCalculatorState();
}

class _PPFCalculatorState extends State<PPFCalculator> {
  TextEditingController etMDpsitController = TextEditingController();
  TextEditingController etIRateController = TextEditingController();
  TextEditingController etPeriodController = TextEditingController();
  bool isVisible = false;
  NumberFormat numberFormat =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹');


  double rate = 0.0; // Initialize rate
  double totalInterest = 0.0;
  double finalAmount = 0.0;

  void calculatePPF() {
    if (etMDpsitController.text.isEmpty ||
        etIRateController.text.isEmpty ||
        etPeriodController.text.isEmpty) {
      // Handle the case when fields are empty
      setState(() {
        isVisible = false;
      });
      return;
    }

    double principalAmount =
    double.parse(etMDpsitController.text.replaceAll(',', ''));
    double interestRate = double.parse(etIRateController.text);
    int period = int.parse(etPeriodController.text);

    rate = interestRate / 100.0;
    finalAmount = principalAmount;

    for (int i = 0; i < period; i++) {
      double interest = finalAmount * rate;
      totalInterest += interest;
      finalAmount += interest + principalAmount;
    }

    setState(() {
      isVisible = true;
    });
  }


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
          "PPF Calculation",
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monthly Deposit",
              style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextField(
              controller: etMDpsitController,
              keyboardType: TextInputType.number,
              enableInteractiveSelection: true,
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
                hintText: 'Enter Principal Amount',
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "Interest Rate (%)",
              style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextField(
              controller: etIRateController,
              keyboardType: TextInputType.number,
              enableInteractiveSelection: true,
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
                hintText: 'Enter Interest Rate (%)',
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "Tenure (Years)",
              style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextField(
              controller: etPeriodController,
              keyboardType: TextInputType.number,
              enableInteractiveSelection: true,
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
                hintText: 'Enter Tenure (Years)',
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(height: 3.h),
            InkWell(
              onTap: () {
                setState(() {
                  if (etMDpsitController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please Enter Amount",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (etIRateController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please Enter Interest Rate",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (etPeriodController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please Enter Your Month ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {

                    calculatePPF();
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.h),
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
                                    "Total Interest:",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: Colors.purple),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${totalInterest.toStringAsFixed(2)}₹',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Final Amount:",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: Colors.purple),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${finalAmount.toStringAsFixed(2)}₹',
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
    );
  }
}
