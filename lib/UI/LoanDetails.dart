import 'package:all_bank_passbook_new/UI/BusinessLoanScreen.dart';
import 'package:all_bank_passbook_new/UI/CarLoan.dart';
import 'package:all_bank_passbook_new/UI/HomeLoan.dart';
import 'package:all_bank_passbook_new/UI/MicroLoanScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../Resources/StringResources.dart';
import 'PersonalLoanScreen.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  List<String> loanNameList = [
    homeLone,
    carLone,
    personalLone,
    businessLone,
    microLone
  ];
  List<String> loanImageList = [
    homeLoneImg,
    carLoanImg,
    personalLoanImg,
    businessLoanImg,
    microLoanImg
  ];

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
            'Loan Details',
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  allBankPassbook,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  loanDummyText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomeLoanScreen();
                          },
                        ));
                      } else if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const PersonalLoanScreen();
                          },
                        ));
                      } else if (index == 4) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MicroLoanScreen();
                          },
                        ));
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.purple.shade300, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: index.isEven
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      decoration:  BoxDecoration(
                                          color: Colors.purple.shade200,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(9),
                                              bottomLeft: Radius.circular(9))),
                                      width: 15.w,
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0.w),
                                        child:
                                            Image.asset(loanImageList[index]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      loanNameList[index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                if (index == 1) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const CarLoanScreen();
                                    },
                                  ));
                                } else if (index == 3) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const BusinessLoanScreen();
                                    },
                                  ));
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0.w),
                                    child: Text(
                                      loanNameList[index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    height: 70,
                                    decoration:  BoxDecoration(
                                        color: Colors.purple.shade200,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(9),
                                            bottomRight: Radius.circular(9))),
                                    width: 15.w,
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0.w),
                                      child: Image.asset(loanImageList[index]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
