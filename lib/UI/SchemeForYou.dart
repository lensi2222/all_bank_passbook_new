import 'package:all_bank_passbook_new/Resources/ListResources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';
import 'AtalPensionSchemeScreen.dart';
import 'EmployeeProvidentFundScreen.dart';
import 'FixedDepositSTDRScreen.dart';
import 'FixedDepositTDRScreen.dart';
import 'GratutitySchemeScreen.dart';
import 'KisanVikasPatraScreen.dart';
import 'NationalPensionSchemeScreen.dart';
import 'NationalSavingCeritificateScreen.dart';
import 'PMJeevanJyotiBimaScreen.dart';
import 'PMSharmYogiMaanDhamScreen.dart';
import 'PMSurakshaBima.dart';
import 'PMVayaVandhanaSchemeScreen.dart';
import 'PublicProvidentFundScreen.dart';
import 'RecurringDeposit.dart';
import 'SeniorCitizensSavingSchemeScreen.dart';
import 'SukanyaSamriddhiAccountScreen.dart';

class SchemeForYou extends StatefulWidget {
  const SchemeForYou({Key? key}) : super(key: key);

  @override
  State<SchemeForYou> createState() => _SchemeForYouState();
}

class _SchemeForYouState extends State<SchemeForYou> {
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
            schemesInformation,
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: schemesList.length,
                  itemBuilder: (context, index1) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              schemesList[index1].name!,
                              style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: schemesList[index1].detailList!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (index1 == 0) {
                                      if (index == 0) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const FixedDepositTDR();
                                          },
                                        ));
                                      }
                                      if (index == 1) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const FixedDepositSTDRScreen();
                                          },
                                        ));
                                      }
                                      if (index == 2) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const RecurringDeposit();
                                          },
                                        ));
                                      }
                                    } else {
                                      if (index1 == 1) {
                                        if (index == 0) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const PublicProvidentFund();
                                            },
                                          ));
                                        }
                                        if (index == 1) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const SukanyaSamriddhiAccountScreen();
                                            },
                                          ));
                                        }
                                        if (index == 2) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const SeniorCitiZensSavingScheme();
                                            },
                                          ));
                                        }
                                        if (index == 3) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const KishanVikasPatraScreen();
                                            },
                                          ));
                                        }
                                        if (index == 4) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const NationSavingsCertificateScreen();
                                            },
                                          ));
                                        }
                                      } else {
                                        if (index1 == 2) {
                                          if (index == 0) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const AtalPensionScheme();
                                              },
                                            ));
                                          }
                                          if (index == 1) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const NationalPensionSchemeScreen();
                                              },
                                            ));
                                          }
                                          if (index == 2) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const EmployeeProvidentFund();
                                              },
                                            ));
                                          }
                                          if (index == 3) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const PMShramYogiMaandham();
                                              },
                                            ));
                                          }
                                          if (index == 4) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const PMVayaVandhanaScheme();
                                              },
                                            ));
                                          }
                                          if (index == 5) {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const GratuityScreen();
                                              },
                                            ));
                                          }
                                        } else {
                                          if (index1 == 3) {
                                            if (index == 0) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const PMJeevanJyotiBimaScreen();
                                                },
                                              ));
                                            }
                                            if (index == 1) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const PMSurakshaBima();
                                                },
                                              ));
                                            }
                                          }
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    margin: const EdgeInsets.all(8),
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.purple.shade300,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          schemesList[index1]
                                              .detailList![index],
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
