// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:tellme_flutter/app.dart';
// import 'package:tellme_flutter/app/config/env.dart';
// import 'package:tellme_flutter/app/util/app_log_util.dart';
// import 'package:tellme_flutter/app/util/fcm_util.dart';
// import 'package:tellme_flutter/app/util/notification_util.dart';
// import 'package:tellme_flutter/di/di.dart';

// Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
//   AppLog.info('FCM received data when app in the background: ${message.data}');
// }

// void main() async {
//   runZonedGuarded(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await initDI(ENVType.prod);

//     if (Platform.isIOS) {
//       Firebase.initializeApp(); // Avoid iOS release build hang
//     } else {
//       await Firebase.initializeApp();
//     }

//     await di<NotificationUtil>().init();

//     final FCMUtil fcmUtil = di();
//     fcmUtil.getToken().then((fcmToken) => log('FCM TOKEN: $fcmToken'));

//     final NotificationUtil notificationUtil = di();

//     // fcmUtil.onMessage().listen((RemoteMessage event) {
//     //   AppLog.info(
//     //       'FCM received data when app visible on the screen: ${event.data}');
//     //   final NotificationData notificationData =
//     //       NotificationData.fromJson(event.data);

//     //   notificationUtil.show(notificationData);
//     // });

//     // fcmUtil.onMessageOpenedApp().listen((RemoteMessage event) {
//     //   AppLog.info(
//     //       'FCM received data when open app via notification from background: ${event.data}');
//     //   // final NotificationData notificationData =
//     //   //     NotificationData.fromJson(event.data);
//     // });

//     FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);

//     runApp(const MyApp());
//   }, (error, trace) {
//     AppLog.error('[DEV] Error while running app', error, trace);
//   });
// }
