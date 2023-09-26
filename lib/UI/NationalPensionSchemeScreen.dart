import 'package:all_bank_passbook_new/Resources/ListResources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class NationalPensionSchemeScreen extends StatefulWidget {
  const NationalPensionSchemeScreen({Key? key}) : super(key: key);

  @override
  State<NationalPensionSchemeScreen> createState() => _NationalPensionSchemeScreenState();
}

class _NationalPensionSchemeScreenState extends State<NationalPensionSchemeScreen> {
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
            nationalPensionScheme,
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
                itemCount: retirementNPSTitle.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        border:
                        Border.all(color: Colors.purple.shade300, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                          iconColor: Colors.black,
                          shape: const Border(),
                          title: Text(
                            retirementNPSTitle[index],
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Text(
                                  retirementNPSDetailList[index],
                                  textAlign: TextAlign.justify,
                                  style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ])));
  }
}
