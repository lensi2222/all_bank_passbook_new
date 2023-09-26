import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../Resources/StringResources.dart';
import 'OfflineCreditScoresliderone.dart';

class OfflineScoreCheck extends StatefulWidget {
  const OfflineScoreCheck({Key? key}) : super(key: key);

  @override
  State<OfflineScoreCheck> createState() => _OfflineScoreCheckState();
}

class _OfflineScoreCheckState extends State<OfflineScoreCheck> {
  double _value1 = 0;
  double _value2 = 0;
  double _value3 = 0;
  double _value4 = 0;
  double _value5 = 0;
  double _value6 = 0;
  double _value7 = 0;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),

            width: double.infinity,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "When Was the Last negative item on your credit report?",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "year",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Container(
                              width: 81.w,
                              child: Center(
                                  child: SfSliderTheme(
                                data: SfSliderThemeData(
                                  tooltipBackgroundColor: Colors.purple,
                                ),
                                child: SfSlider(
                                  tooltipShape: SfPaddleTooltipShape(),
                                  activeColor: Colors.purple,
                                  enableTooltip: true,
                                  stepSize: 1,
                                  min: 0.0,
                                  max: 7.0,
                                  interval: 1,
                                  showLabels: true,
                                  showTicks: false,
                                  value: _value1,
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      _value1 = newValue;
                                    });
                                  },
                                ),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        _value1.toStringAsFixed(0),
                        style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "How many of the follwoing account(Open and Closed) do you have lised on your credit report?",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Credit Cards",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value2,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value2 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value2.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              "Mortgages",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value3,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value3 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value3.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "RetailFinance",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value4,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value4 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value4.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "AutoLoan",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value5,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value5 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value5.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "StudentLaon",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value6,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value6 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value6.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "OtherLoan",
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Container(
                                    width: 65.w,
                                    child: Center(
                                        child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        tooltipBackgroundColor: Colors.purple,
                                      ),
                                      child: SfSlider(
                                        tooltipShape: SfPaddleTooltipShape(),
                                        activeColor: Colors.purple,
                                        enableTooltip: true,
                                        stepSize: 1,
                                        min: 0.0,
                                        max: 6.0,
                                        interval: 1,
                                        showLabels: false,
                                        showTicks: false,
                                        value: _value7,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _value7 = newValue;
                                          });
                                        },
                                      ),
                                    ))),
                                Text(
                                  _value7.toStringAsFixed(0),
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return OfflineCreditScoreSliderOne(
                      value1: _value1.toString(),
                      value2: _value2.toString(),
                      value3: _value3.toString(),
                      value4: _value4.toString(),
                      value5: _value5.toString(),
                      value6: _value6.toString(),
                      value7: _value7.toString(),
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
                    'Next',
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
    );
  }
}
