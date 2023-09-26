import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../Resources/ImagesResources.dart';
import '../main.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  final Tween<double> _opacityTween = Tween(begin: 0.0, end: 1.0);

  checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen();
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.vpn) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen();
          },
        ));
      });

    } else if (connectivityResult == ConnectivityResult.bluetooth) {
    } else if (connectivityResult == ConnectivityResult.other) {
    } else if (connectivityResult == ConnectivityResult.none) {
      noInternetDialog();
    }
  }

  noInternetDialog() {
    showDialog(
      context: MyApp.navigatorKey.currentContext!,
      // barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Lottie.asset('assets/images/NoInternetAnimation.json',
                    height: 20.h, width: 50.w),
              ),
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Text(
                  'No Internet Connection Was Found Check Your Connection And Try Again',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15.w)),
                    child: Center(
                      child: Text(
                        'CLOSE',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
     checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Image.asset(splashScreenImg,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height),
            ),
          ],
        ));
  }
}
