import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ListResources.dart';
import 'BuyCreditScore.dart';
import 'CalculatorCreditsScore.dart';
import 'CompanyCreditScore.dart';
import 'CreditMantriScore.dart';
import 'DisputeCreditScore.dart';
import 'FaqsCreditScore.dart';
import 'HomeCreditScore.dart';
import 'MediaCreditScore.dart';

class OnlineScoreCheckScreen extends StatefulWidget {
  const OnlineScoreCheckScreen({Key? key}) : super(key: key);

  @override
  State<OnlineScoreCheckScreen> createState() => _OnlineScoreCheckScreenState();
}

class _OnlineScoreCheckScreenState extends State<OnlineScoreCheckScreen> {
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
            'Online Score Check',
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
                itemCount: offlineScoreList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomeCreditScore();
                          },
                        ));
                      } else if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const BuyCreditScore();
                          },
                        ));
                      } else if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return  const CompamyCreditScore();
                          },
                        ));
                      } else if (index == 3) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CalculatorCreditScore();
                          },
                        ));
                      } else if (index == 4) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MediaCreditScore();
                          },
                        ));
                      } else if (index == 5) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const DisputeCreditScore();
                          },
                        ));
                      } else if (index == 6) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CreditMantriScore();
                          },
                        ));
                      } else if (index == 7) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const FaqsCreditScore();
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
                              offlineScoreList[index].images!,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              offlineScoreList[index].title!,
                              style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              offlineScoreList[index].subtitle!,
                              style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
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
