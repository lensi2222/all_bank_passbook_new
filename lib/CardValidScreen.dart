import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CardValidScreen extends StatefulWidget {
  const CardValidScreen({Key? key}) : super(key: key);

  @override
  State<CardValidScreen> createState() => _CardValidScreenState();
}

class _CardValidScreenState extends State<CardValidScreen> {
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
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.purple.shade50,
        title: Text(
          'Card Results',
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/valid_credit_card.png",
                height: 20.h,
                fit: BoxFit.cover,
              ),
              Text(
                'Credit Card is Valid',
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),



              ),
            ],
          ),
        ),
      ),
    );
  }
}
