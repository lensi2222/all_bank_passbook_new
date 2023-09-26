import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';
import 'EMIScreen.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({Key? key}) : super(key: key);

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  emiCalculators,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dummyText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     margin: const EdgeInsets.all(10),
              //     height: 70,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border:
              //             Border.all(color: Colors.purple.shade300, width: 1.5),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 2.w),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             children: [
              //               Image.asset(
              //                 compareLoanImg,
              //                 color: Colors.purple,
              //                 height: 9.h,
              //                 width: 9.w,
              //               ),
              //               SizedBox(
              //                 width: 5.w,
              //               ),
              //               Text(
              //                 compareLoan,
              //                 style: GoogleFonts.poppins(
              //                     fontSize: 11.sp,
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.black),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EMIScreen();
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.purple.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              emiCalculatorImg,
                              height: 9.h,
                              width: 9.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              emiCalculators,
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
              ),
            ],
          ),
        ));
  }
}
