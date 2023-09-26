import 'dart:io';

import 'package:all_bank_passbook_new/Resources/ImagesResources.dart';
import 'package:all_bank_passbook_new/Resources/StringResources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class EpfPassbook extends StatefulWidget {
  const EpfPassbook({Key? key}) : super(key: key);

  @override
  State<EpfPassbook> createState() => _EpfPassbookState();
}

class _EpfPassbookState extends State<EpfPassbook> {
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
          epfService,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  epfBalanceCheck,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    epfBalanceCheck1,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  epfBalanceCheck2,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          const Divider(
            height: 1,
          ),
          InkWell(
            onTap: () async {
              try {
                if (Platform.isAndroid) {
                  String uri =
                      'sms:077382 99899?body=${Uri.encodeComponent('EPFOHO UAN ENG')}';
                  await launchUrl(Uri.parse(uri));
                } else if (Platform.isIOS) {
                  String uri =
                      'sms:077382 99899&body=${Uri.encodeComponent('EPFOHO UAN ENG')}';
                  await launchUrl(Uri.parse(uri));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Some error occurred. Please try again!'),
                  ),
                );
              }
            },
            child: SizedBox(
              height: 10.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          checkBalanceSmsImg,
                          height: 8.h,
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          checkBalanceSms,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          InkWell(
            onTap: () async {
              try {
                if (Platform.isAndroid) {
                  String uri = "tel:011 2290 1406";
                  await launchUrl(Uri.parse(uri));
                } else if (Platform.isIOS) {
                  String uri = "tel:011 2290 1406";
                  await launchUrl(Uri.parse(uri));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Some error occurred. Please try again!'),
                  ),
                );
              }
            },
            child: SizedBox(
              height: 10.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          checkBalanceCallImg,
                          height: 8.h,
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          checkBalanceCall,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          InkWell(
            onTap: () async {
              try {
                if (Platform.isAndroid) {
                  String uri =
                      "https://passbook.epfindia.gov.in/MemberPassBook/login";
                  await launchUrl(Uri.parse(uri));
                } else if (Platform.isIOS) {
                  String uri =
                      "https://passbook.epfindia.gov.in/MemberPassBook/login";
                  await launchUrl(Uri.parse(uri));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Some error occurred. Please try again!'),
                  ),
                );
              }
            },
            child: SizedBox(
              height: 10.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          checkBalanceOnlineImg,
                          height: 8.h,
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          checkBalanceOnline,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
