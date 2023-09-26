import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class GSTCalculatorScreen extends StatefulWidget {
  @override
  _GSTCalculatorScreenState createState() => _GSTCalculatorScreenState();
}

class _GSTCalculatorScreenState extends State<GSTCalculatorScreen> {
  double _amount = 0;
  double _gstPercent = 0;
  double _totalAmount = 0;
  double gstAmount = 0;
  double netAmount = 0;
  bool isVisible = false;

  void _calculateGST() {
    setState(() {
      _totalAmount = _amount + (_amount * (_gstPercent / 100));
      gstAmount = _amount * (_gstPercent / 100);
      netAmount = _amount;
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
          gstCalculator,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                        _amount = double.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
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
                  SizedBox(height: 20),
                  Text(
                    gstPercentage,
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
                        _gstPercent = double.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.w),
                          borderSide:
                              BorderSide(color: Colors.purple.shade300)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      hintText: 'Enter GST Percentage',
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
                        if (_amount <= 0) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Amount",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (_gstPercent <= 0) {
                          Fluttertoast.showToast(
                              msg: "Please Enter GST Percentage",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          isVisible = true;
                          _calculateGST();
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
                ],
              ),
            ),
            isVisible
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
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
                                    '$netAmount ₹',
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
                                    gstAmounts,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        color: Colors.purple),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '$gstAmount ₹',
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
                                    '$_totalAmount ₹',
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
