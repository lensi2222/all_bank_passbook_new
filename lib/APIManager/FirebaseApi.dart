// import 'package:firebase_messaging/firebase_messaging.dart';
//
//
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   void handleMessage(RemoteMessage? message){
//     if(message ==null){
//     }
//
//   }
//   Future<void> handleBankgroundMessage(RemoteMessage message) async {
//     print('Title: ${message.notification?.title}');
//     print('Body: ${message.notification?.body}');
//     print('Payload: ${message.data}');
//   }
//
//   Future<void> initNotification() async {
//     try {
//       // Request permission for notifications
//       await _firebaseMessaging.requestPermission();
//
//       // Get the FCM token
//       String? fCMToken = await _firebaseMessaging.getToken();
//       if (fCMToken != null) {
//         print("FCM Token: $fCMToken");
//         FirebaseMessaging.onBackgroundMessage(handleBankgroundMessage);
//       } else {
//         print("Failed to get FCM Token.");
//       }
//     } catch (e) {
//       // Handle any exceptions that might occur
//       print("Error initializing notifications: $e");
//     }
//   }
// }