import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'YourScoreScreen.dart';

class OfflineScoreCreditTwo extends StatefulWidget {
  String? value1;
  String? value2;
  String? value3;
  String? value4;
  String? value5;
  String? value6;
  String? value7;
  String? value8;
  String? value9;

  OfflineScoreCreditTwo(
      {Key? key,
      this.value1,
      this.value2,
      this.value3,
      this.value4,
      this.value5,
      this.value6,
      this.value7,
      this.value8,
      this.value9})
      : super(key: key);

  @override
  State<OfflineScoreCreditTwo> createState() => _OfflineScoreCreditTwoState();
}

class _OfflineScoreCreditTwoState extends State<OfflineScoreCreditTwo> {
  double _value10 = 0;
  double _value11 = 0;
  int randomInt = 0;
  List<int> abc = [620, 600, 630, 650];

  void generateRandomNumbers() {
    final random = Random();
    setState(() {
      randomInt = abc[random.nextInt(abc.length)];

      print("'Random Integer: $randomInt',");
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
        body: Column(children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.purple.shade300, width: 1.5),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "How many time have you applied for credit in the last 6 month?",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "0",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Container(
                                      width: 67.w,
                                      child: Center(
                                          child: SfSliderTheme(
                                        data: SfSliderThemeData(
                                          tooltipBackgroundColor: Colors.purple,
                                        ),
                                        child: Slider(
                                          min: 0.0,
                                          max: 10.0,
                                          value: _value10,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              _value10 = newValue;
                                            });
                                          },
                                        ),

                                        // SfSlider(
                                        //   tooltipShape: SfPaddleTooltipShape(),
                                        //   activeColor: Colors.purple,
                                        //   enableTooltip: true,
                                        //   stepSize: 1,
                                        //   min: 0.0,
                                        //   max: 100000.0,
                                        //   interval: 1,
                                        //   showLabels: false,
                                        //   showTicks: false,
                                        //   value: _value1,
                                        //   onChanged: (dynamic newValue) {
                                        //     setState(() {
                                        //       _value1 = newValue;
                                        //     });
                                        //   },
                                        // ),
                                      ))),
                                  Text(
                                    "10",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                _value10.toStringAsFixed(0),
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.purple.shade300, width: 1.5),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "How many time have you applied for credit in the last 6 month?",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "0",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Container(
                                      width: 67.w,
                                      child: Center(
                                          child: SfSliderTheme(
                                        data: SfSliderThemeData(
                                          tooltipBackgroundColor: Colors.purple,
                                        ),
                                        child: Slider(
                                          min: 0.0,
                                          max: 10.0,
                                          value: _value11,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              _value11 = newValue;
                                            });
                                          },
                                        ),
                                      ))),
                                  Text(
                                    "10",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                _value11.toStringAsFixed(0),
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ]),
                  ),
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
                    return YourScoreScreen(
                      value1: widget.value1,
                      value2: widget.value2,
                      value3: widget.value3,
                      value4: widget.value4,
                      value5: widget.value5,
                      value6: widget.value6,
                      value7: widget.value7,
                      value8: widget.value8,
                      value9: widget.value9,
                      value10: _value10.toString(),
                      value11: _value11.toString(),
                      ranNum: randomInt.toString(),
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
                    'Estimate Your Score',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
