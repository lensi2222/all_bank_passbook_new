import 'package:all_bank_passbook_new/Resources/ListResources.dart';
import 'package:all_bank_passbook_new/UI/AllBankHolidays.dart';
import 'package:all_bank_passbook_new/UI/AllMutualFund.dart';
import 'package:all_bank_passbook_new/UI/BankStatements.dart';
import 'package:all_bank_passbook_new/UI/CardValidatorScreen.dart';
import 'package:all_bank_passbook_new/UI/EpfPassbook.dart';
import 'package:all_bank_passbook_new/UI/FinanceCalculator.dart';
import 'package:all_bank_passbook_new/UI/FindNearBy.dart';
import 'package:all_bank_passbook_new/UI/IfscMiceCode.dart';
import 'package:all_bank_passbook_new/UI/LoanDetails.dart';
import 'package:all_bank_passbook_new/UI/MissedCallBankingScreen.dart';
import 'package:all_bank_passbook_new/UI/SchemeForYou.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'BankInformation.dart';

class HomeScreen extends StatefulWidget {
  FirebaseAnalytics? analytics;

  HomeScreen({Key? key, this.analytics}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;

  void trackEvent() {
    widget.analytics!.logEvent(
      name: 'button_click',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.w,
                    crossAxisSpacing: 5.w,
                    childAspectRatio: 2 / 2),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      if (index == 0) {
                        trackEvent();
                        print("hyyy i am call");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const BankStatements();
                          },
                        ));
                      } else if (index == 1) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MissedCallBankingScreen();
                          },
                        ));
                      } else if (index == 2) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoanDetails();
                          },
                        ));
                      } else if (index == 3) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CardValidatorScreen();
                          },
                        ));
                      } else if (index == 4) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const BankInformation();
                          },
                        ));
                      } else if (index == 5) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const EpfPassbook();
                          },
                        ));
                      } else if (index == 6) {
                        loading = true;
                        if (loading == true) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                insetPadding: EdgeInsets.all(140),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 2.h),
                                        child: CircularProgressIndicator(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        Future.delayed(const Duration(milliseconds: 2000))
                            .then((value) {
                          loading = false;
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const IfscMiceCode();
                            },
                          ));
                        });
                      } else if (index == 7) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const AllBankHolidays();
                          },
                        ));
                      } else if (index == 8) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const FinanceCalculator();
                          },
                        ));
                      } else if (index == 9) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const FindNearBy();
                          },
                        ));
                      } else if (index == 10) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SchemeForYou();
                          },
                        ));
                      } else if (index == 11) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AllMutualFund();
                          },
                        ));
                        // if (result.success!) {
                        //   print("result: $result");
                        //
                        // } else {
                        //   Fluttertoast.showToast(
                        //       msg: "Data Not Funds",
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.BOTTOM,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: Colors.grey,
                        //       textColor: Colors.white,
                        //       fontSize: 16.0);
                        // }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(2.w),
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: homeList[index].color,
                            radius: 12.w,
                            child: Center(
                                child: Image.asset(
                              homeList[index].images!,
                              height: 5.h,
                            )),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(homeList[index].title!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 11.sp))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
