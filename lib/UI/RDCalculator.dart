import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class RDCalculator extends StatefulWidget {
  const RDCalculator({Key? key}) : super(key: key);

  @override
  State<RDCalculator> createState() => _RDCalculatorState();
}

class _RDCalculatorState extends State<RDCalculator> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  bool isVisible = false;
  double _monthlySIP = 0;
  double _totalValue = 0;
  double lensim = 0;
  double _WealthGained = 0;
  void _calculateSIP() {
    double amount = double.tryParse(principalController.text) ?? 0;
    double rate = double.tryParse(interestRateController.text) ?? 0;
    int period = int.tryParse(durationController.text) ?? 0;

    double r = rate / 100;
    int n = period * 12;
    double sip = amount / n; // Calculate monthly SIP amount
    double futureValue = 0;
    double abc = sip * n; // Calculate the total investment
    double xyz = 0;

    for (int i = 0; i < n; i++) {
      futureValue = (futureValue + sip) * (1 + r / 12);
    }

    xyz = futureValue - abc; // Calculate wealth gained

    setState(() {
      _monthlySIP = sip; // Assign calculated SIP amount
      _totalValue = futureValue;
      lensim = abc;
      _WealthGained = xyz;
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
          rdCalculation,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                amount,
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
                  hintText: 'Enter Amount...',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey),
                  contentPadding: const EdgeInsets.all(10),
                ),
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
                  hintText: 'Enter Interest Rate(%)',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                investmentPeriod,
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
                  hintText: 'Enter Investment Period',
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

                      _calculateSIP();
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
                        padding:  EdgeInsets.symmetric(
                            horizontal: 5.0.w, vertical: 2.h),
                        child: Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    '${lensim.toStringAsFixed(2)}₹',
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
                                    investmentValue,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: Colors.purple),
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    '${_WealthGained.toStringAsFixed(2)}₹',
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
                                    '${_totalValue.toStringAsFixed(2)}₹',
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
}
