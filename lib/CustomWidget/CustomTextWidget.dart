import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextWidget extends StatelessWidget {
  String? text;

  CustomTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.poppins(
          fontSize: 11.sp, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
