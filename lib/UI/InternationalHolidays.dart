import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ListResources.dart';

class InternationalHolidays extends StatefulWidget {
  const InternationalHolidays({Key? key}) : super(key: key);

  @override
  State<InternationalHolidays> createState() => _InternationalHolidaysState();
}

class _InternationalHolidaysState extends State<InternationalHolidays> {
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
            'International Holiday',
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: generalHolidays.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(10),
                  height: 10.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.purple.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(

                    padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    child: Text(
                      generalHolidays[index],
                      style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ));
            },
          ),
        ])));
  }
}
