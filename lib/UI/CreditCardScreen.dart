import 'dart:developer';

import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../CardValidScreen.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  creditCardValidationBloc() {
    // debugger();
    CreditCardValidator _ccValidator = CreditCardValidator();

    var ccNumResults = _ccValidator.validateCCNum(cardNumber);
    var expDateResults = _ccValidator.validateExpDate(expiryDate);
    var cvvResults = _ccValidator.validateCVV(
      cvvCode,
      ccNumResults.ccType,
    );
    print("-================cccvv1============${expDateResults.isValid}");
    if (ccNumResults.isPotentiallyValid &&
        expDateResults.isPotentiallyValid &&
        cvvResults.isPotentiallyValid) {
      if (ccNumResults.isValid && expDateResults.isValid) {
        print("-================cccvv============${expDateResults.isValid}");

        return Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CardValidScreen();
          },
        ));
      }
      else {
        // debugger();
        if (!ccNumResults.isValid) {
          Fluttertoast.showToast(
              msg: ccNumResults.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (!expDateResults.isValid) {
          Fluttertoast.showToast(
              msg: expDateResults.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } else {
      // debugger();
      if (!ccNumResults.isValid) {
        Fluttertoast.showToast(
            msg: ccNumResults.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (!expDateResults.isValid) {
        Fluttertoast.showToast(
            msg: expDateResults.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

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
          'Credit Card Checker',
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.black,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          labelText: 'Number',
                          labelStyle: TextStyle(
                            fontSize: 11.sp, // Use relative font size with .sp
                            fontWeight: FontWeight.bold,
                            color:
                            Colors.purple, // Set your desired label text color
                          ),
                          hintText: 'xxxx xxxx xxxx xxxx',
                        ),
                        expiryDateDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            labelText: 'Expired Date',
                            labelStyle: TextStyle(
                              fontSize: 11.sp,
                              // Use relative font size with .sp
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .purple, // Set your desired label text color
                            ),
                            hintText: 'xx/xx'),
                        cvvCodeDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.8, color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  8.w)),
                            ),
                            labelText: 'CVV',
                            labelStyle: TextStyle(
                              fontSize: 11.sp,
                              // Use relative font size with .sp
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .purple, // Set your desired label text color
                            ),
                            hintText: 'xxx'),
                        cardHolderDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.8, color: Colors.purple),
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.w)),
                          ),
                          labelText: 'Card Holder',
                          labelStyle: TextStyle(
                            fontSize: 11.sp, // Use relative font size with .sp
                            fontWeight: FontWeight.bold,
                            color:
                            Colors.purple, // Set your desired label text color
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                creditCardValidationBloc();
                              });
                            }
                          },
                          child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.purple),
                            child: const Center(
                              child: Text(
                                'Check',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
