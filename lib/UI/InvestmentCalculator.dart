import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class InvestmentCalculatorScreen extends StatefulWidget {
  @override
  _InvestmentCalculatorScreenState createState() =>
      _InvestmentCalculatorScreenState();
}

class _InvestmentCalculatorScreenState
    extends State<InvestmentCalculatorScreen> {
  bool isVisible = false;
  double _investmentAmount = 0;
  double _monthlySIP = 0;
  double _interestRate = 0;
  int _investmentPeriod = 0;
  double _totalValue = 0;
  double _lensim = 0;
  double _WealthGained = 0;

  void _calculateSIP() {
    double amount = _investmentAmount;
    double r = _interestRate / 100;
    int n = _investmentPeriod;
    double sip = _monthlySIP;
    double futureValue = 0;
    double abc = 0;
    double xyz = 0;

    for (int i = 0; i < n; i++) {
      futureValue = (futureValue + sip) * (1 + r / 12);
      abc = _monthlySIP * n;
      xyz = futureValue - abc;
    }

    setState(() {
      _totalValue = futureValue;
      _lensim = abc;
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
          investment,
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
                onChanged: (value) {
                  setState(() {
                    _monthlySIP = double.tryParse(value) ?? 0;
                  });
                },
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
                  hintText: 'Enter Amount',
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
                onChanged: (value) {
                  setState(() {
                    _interestRate = double.tryParse(value) ?? 0;
                  });
                },
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
                  hintText: 'Enter Annual Interest Rate(%)',
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
                onChanged: (value) {
                  setState(() {
                    _investmentPeriod = int.tryParse(value) ?? 0;
                  });
                },
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
                    if (_monthlySIP <= 0) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Amount",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_interestRate <= 0) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Interest Rate",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_investmentPeriod <= 0) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Your month",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      isVisible = true;
                      _calculateSIP();
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
                                      '${_lensim.toStringAsFixed(2)}₹',
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
