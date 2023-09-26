import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class EMIScreen extends StatefulWidget {
  const EMIScreen({Key? key}) : super(key: key);

  @override
  State<EMIScreen> createState() => _EMIScreenState();
}

class _EMIScreenState extends State<EMIScreen> {
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  bool isVisible = false;
  TextEditingController dateInput = TextEditingController();
  TextEditingController txtLoanAmount = TextEditingController();
  TextEditingController txtRate = TextEditingController();
  TextEditingController txtLoanPeriod = TextEditingController();

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
            emiCalculators,
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      loanAmount,
                      style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextField(
                      controller: txtLoanAmount,
                      keyboardType: TextInputType.number,
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
                          hintText: 'Enter Loan Amount...',
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                    SizedBox(
                      height: 4.h,
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
                      controller: txtRate,
                      keyboardType: TextInputType.number,
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
                          hintText: 'Enter Interest Rate...',
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                    SizedBox(
                      height: 4.h,
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
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: txtLoanPeriod,
                            keyboardType: TextInputType.number,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.w),
                                  borderSide: BorderSide(
                                      color: Colors.purple.shade300)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.w),
                                  borderSide: BorderSide(
                                      color: Colors.purple.shade300)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.w),
                              ),
                              hintText: '12',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          height: 5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple.shade300),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: DropdownButton<String>(
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            underline: Container(),
                            dropdownColor: Colors.white,
                            icon: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.purple,
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            isExpanded: true,

                            // The list of options
                            items: list
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          e,
                                        ),
                                      ),
                                    ))
                                .toList(),

                            // Customize the selected item
                            selectedItemBuilder: (BuildContext context) => list
                                .map((e) => Center(
                                      child: Text(
                                        e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              onClear();
                            },
                            child: Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.purple.shade300)),
                              child: const Center(
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (txtLoanAmount.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Loan Amount",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (txtRate.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Interest Rate",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (txtLoanPeriod.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter Your Month And Year",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  calculation();
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
                                      monthlyEMI,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$miResult ₹',
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
                                      '$tiResult ₹',
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
                                      totalPayment,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: Colors.purple),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$tcResult ₹',
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
        ));
  }

  // define a list of options for the dropdown
  final List<String> list = ["Month", "Year"];
  String miResult = "";
  String tiResult = "";
  String tcResult = "";

  // the selected value
  String selectedValue = 'Month';

  calculation() {
    setState(() {
      double monthlyEmi = 0.0;
      double totalInterest = 0.0;
      double totalPayment = 0.0;

      double P = double.parse(txtLoanAmount.text);
      double r = double.parse(txtRate.text) / 12 / 100;
      double n = selectedValue == "Year"
          ? double.parse(txtLoanPeriod.text) * 12
          : double.parse(txtLoanPeriod.text);

      monthlyEmi = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
      totalPayment = (monthlyEmi * n);
      totalInterest = (totalPayment - P);

      NumberFormat format = NumberFormat('#,###,###.00');
      miResult = format.format(monthlyEmi);
      tiResult = format.format(totalInterest);
      tcResult = format.format(totalPayment);

      print(
          'monthlyEmi:       $miResult'); // Print the value of A to the console
      print(
          'totalInterest:       $tiResult'); // Print the value of I to the console
      print('totalPayment:       $tcResult');
    });
  }

  onClear() {
    setState(() {
      isVisible = false;
      txtLoanAmount.text = "";
      txtRate.text = "";
      txtLoanPeriod.text = "";
      miResult = "";
      tiResult = "";
      tcResult = "";
    });
  }
}
