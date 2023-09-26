import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../Resources/StringResources.dart';

class BankStatements extends StatefulWidget {
  const BankStatements({Key? key}) : super(key: key);

  @override
  State<BankStatements> createState() => _BankStatementsState();
}

class _BankStatementsState extends State<BankStatements> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  List debitList = [];
  List debitTitleList = [];

  @override
  void initState() {
    super.initState();
    fetchSMS();
    handelPermission();
  }

  String creditedString = "Credited to your Ac";
  String debitedString = "debited by Rs.";
  int creditedCount = 0;
  int debitedCount = 0;

  fetchSMS() async {
    try {
      _messages = await _query.getAllSms;
      print("message.length: ${_messages.length}");
      for (var i = 0; i < _messages.length; i++) {
        if (_messages[i].body.toString().contains(creditedString)) {
          print("creditedString found at $i");
          print(_messages[i].body);
          creditedCount++;
        } else if (_messages[i].body.toString().contains(debitedString)) {
          print("debitedString found at $i");
          debitedCount++;
          print(_messages[i].body);
          debitList.add(_messages[i].body);
          debitTitleList.add(_messages[i].sender);
          print(_messages[i].sender);
          print(debitTitleList);
        }
      }
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
 handelPermission () async {
   var permission = await Permission.sms.status;
   if (permission.isGranted) {
     final messages = await _query.querySms(
       kinds: [
         SmsQueryKind.inbox,
         SmsQueryKind.sent,
       ],
       // address: '+254712345789',
       count: 10,
     );
     debugPrint('sms inbox messages: ${messages.length}');

     setState(() => _messages = messages);
   } else {
     await Permission.sms.request();
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
            'Bank Statements',
            style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            debitList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: debitList.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.purple.shade300, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text(
                              '${debitTitleList[i]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            subtitle: Text(
                              '${debitList[i]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Expanded(
                    child: Center(
                      child: Text(
                        'NO TRANSACTION SMS FOUND!',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                  ),
          ],
        ));
  }
}

class _MessagesListView extends StatelessWidget {
  const _MessagesListView({
    Key? key,
    required this.messages,
    required this.messages1,
  }) : super(key: key);

  final List messages;
  final List messages1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int i) {
        var message = messages[i];
        var message1 = messages1[i];

        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.purple.shade300, width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          child:
          Column(
            children: [
              Text(
                '${messages1[i]}',
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                '${messages[i]}',
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          )
        );
      },
    );
  }
}
