import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';
import 'HomeScreen.dart';

class OpacityAnimationExample extends StatefulWidget {


  OpacityAnimationExample({super.key});

  @override
  _OpacityAnimationExampleState createState() =>
      _OpacityAnimationExampleState();
}

class _OpacityAnimationExampleState extends State<OpacityAnimationExample>

    with SingleTickerProviderStateMixin {
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;

  final Tween<double> _opacityTween = Tween(begin: 0.0, end: 1.0);

  checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Future.delayed(const Duration(seconds: 4)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen(analytics: firebaseAnalytics);
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Future.delayed(const Duration(seconds: 4)).then((value) {

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen(analytics: firebaseAnalytics);
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      Future.delayed(const Duration(seconds: 4)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen(analytics: firebaseAnalytics);
          },
        ));
      });
    } else if (connectivityResult == ConnectivityResult.vpn) {
      Future.delayed(const Duration(seconds: 4)).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return  HomeScreen(analytics: firebaseAnalytics);
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
    super.initState();
    checkConnection();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = _opacityTween.animate(_controller);

    _animation1 = Tween<Offset>(
      begin: const Offset(1.5, 0), // Start from the right side
      end: const Offset(0, 0), // Move to the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _animation2 = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Start from the left side
      end: const Offset(0, 0), // Move to the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Image.asset(
                      'assets/images/ellipsegreen.png',
                      fit: BoxFit.fill,
                      height: 20.h,
                      width: 50.w,
                    ), // Replace with your image asset
                  );
                },
              )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Column(
              children: [
                SlideTransition(
                  position: _animation2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Text(
                      'Bank',
                      style: GoogleFonts.oleoScript(
                          color: Colors.purple.shade200,
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animation1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      'Passbook',
                      style: GoogleFonts.oleoScript(
                        color: Colors.purple.shade200,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
                Image.asset('assets/images/midel.gif', width: double.infinity),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Image.asset(
                      'assets/images/ellipseorange.png',
                      fit: BoxFit.fill,
                      height: 16.h,
                      width: 30.w,
                    ), // Replace with your image asset
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
