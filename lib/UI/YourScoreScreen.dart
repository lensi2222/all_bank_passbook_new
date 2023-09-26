import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';
import 'SeeFullScoreReportScreen.dart';

class YourScoreScreen extends StatefulWidget {
  String? value1;
  String? value2;
  String? value3;
  String? value4;
  String? value5;
  String? value6;
  String? value7;
  String? value8;
  String? value9;
  String? value10;
  String? value11;
  String? ranNum;

  YourScoreScreen(
      {Key? key,
      this.ranNum,
      this.value1,
      this.value2,
      this.value3,
      this.value4,
      this.value5,
      this.value6,
      this.value7,
      this.value8,
      this.value9,
      this.value10,
      this.value11})
      : super(key: key);

  @override
  State<YourScoreScreen> createState() => _YourScoreScreenState();
}

class _YourScoreScreenState extends State<YourScoreScreen> {
  int randomInt = 0;
  List<int> abc = [620, 600, 630, 650];

  void generateRandomNumbers() {
    final random = Random();
    setState(() {
      randomInt = abc[random.nextInt(abc.length)];
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
          offlineScoreCheck,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ALL the information Credit Score it Add card limit,recent statement bank account data add and add type of any loan data after your see the full Report your crdit Score.: $randomInt',
                  style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Your Score",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 15.h,
                width: 30.w,
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
                child: Center(
                    child: Text(
                  ' ${widget.ranNum}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              generateRandomNumbers();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SeeFullScoreScreen(
                    value1: widget.value1,
                    value2: widget.value2,
                    value3: widget.value3,
                    value4: widget.value4,
                    value5: widget.value5,
                    value6: widget.value6,
                    value7: widget.value7,
                    value8: widget.value8,
                    value9: widget.value9,
                    value10: widget.value10,
                    value11: widget.value11,
                    ranNum: widget.ranNum,
                  );
                },
              ));
            },
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple),
              child: const Center(
                child: Text(
                  'See Full Report',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
