import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:syncfusion_flutter_core/theme.dart';

import '../Resources/StringResources.dart';
import 'OfflineCreditScoretwo.dart';

class OfflineCreditScoreSliderOne extends StatefulWidget {
  String? value1;
  String? value2;
  String? value3;
  String? value4;
  String? value5;
  String? value6;
  String? value7;

  OfflineCreditScoreSliderOne(
      {Key? key,
      this.value1,
      this.value2,
      this.value3,
      this.value4,
      this.value5,
      this.value6,
      this.value7})
      : super(key: key);

  @override
  State<OfflineCreditScoreSliderOne> createState() =>
      _OfflineCreditScoreSliderOneState();
}

class _OfflineCreditScoreSliderOneState
    extends State<OfflineCreditScoreSliderOne> {
  double _value8 = 0;
  double _value9 = 0;

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
                            "Add up all credit limit on your open credit cards.",
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
                                    "₹0",
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
                                          max: 100000.0,
                                          value: _value8,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              _value8 = newValue;
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
                                    "₹100000",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                _value8.toStringAsFixed(0),
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
                            "Add up all on your open credit cards.",
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
                                    "₹0",
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
                                          max: 100000.0,
                                          value: _value9,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              _value9 = newValue;
                                            });
                                          },
                                        ),
                                      ))),
                                  Text(
                                    "₹100000",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                _value9.toStringAsFixed(0),
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return OfflineScoreCreditTwo(
                      value1: widget.value1,
                      value2: widget.value2,
                      value3: widget.value3,
                      value4: widget.value4,
                      value5: widget.value5,
                      value6: widget.value6,
                      value7: widget.value7,
                      value8: _value8.toString(),
                      value9: _value9.toString(),
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
        ]));
  }
}
