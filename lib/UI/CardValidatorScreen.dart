import 'package:all_bank_passbook_new/UI/BinChecker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/ListResources.dart';
import 'CreditCardScreen.dart';
import 'CreditScoreCheck.dart';

class CardValidatorScreen extends StatefulWidget {
  const CardValidatorScreen({Key? key}) : super(key: key);

  @override
  State<CardValidatorScreen> createState() => _CardValidatorScreenState();
}

class _CardValidatorScreenState extends State<CardValidatorScreen> {
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
            'Card Validator',
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.w,
                    crossAxisSpacing: 1.w),
                shrinkWrap: true,
                itemCount: creditCardList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CreditCardScreen();
                          },
                        ));
                      } else if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const BinCheckerScreen();
                          },
                        ));
                      }
                      else if(index==2){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CreditScoreCheckScreen();
                          },
                        ));
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.purple.shade300, width: 1.5),
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
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              creditCardList[index].images!,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              creditCardList[index].title!,
                              style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
