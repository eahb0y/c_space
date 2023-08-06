// import 'dart:async';
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
// InitializationSettings initializationSettings = const InitializationSettings(
//   android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//   iOS: DarwinInitializationSettings(
//     defaultPresentAlert: true,
//     defaultPresentBadge: true,
//     defaultPresentSound: true,
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//   ),
// );
//
// class NotificationService {
//   static Future<void> initialize() async {
//     await Firebase.initializeApp();
//     await setupFlutterNotifications();
//     foregroundNotification();
//     backgroundNotification();
//     terminateNotification();
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestPermission();
//   }
//
//   static Future<String> getFcmToken() async {
//     var fcmToken = await FirebaseMessaging.instance.getToken();
//     return fcmToken ?? "";
//   }
//
//   static Future<void> setupFlutterNotifications() async {
//     if (Platform.isIOS) {
//       await FirebaseMessaging.instance.requestPermission(
//         announcement: true,
//         provisional: true,
//         alert: true,
//         badge: true,
//         criticalAlert: true,
//         sound: true,
//       );
//     }
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.max,
//       playSound: true,
//     );
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   static void showFlutterNotification(RemoteMessage message) {
//     // RemoteNotification? notification = message.notification;
//     if (message.data.isNotEmpty && !kIsWeb) {
//       var bigTextStyleInformation =
//           BigTextStyleInformation(message.data['body'] ?? "");
//       flutterLocalNotificationsPlugin.show(
//         message.hashCode,
//         message.data['title'],
//         message.data['body'],
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: '@mipmap/ic_launcher',
//             priority: Priority.high,
//             importance: Importance.high,
//             visibility: NotificationVisibility.public,
//             playSound: true,
//             styleInformation: bigTextStyleInformation,
//           ),
//           iOS: const DarwinNotificationDetails(
//             presentAlert: true,
//             presentBadge: true,
//             presentSound: true,
//             sound: 'default',
//           ),
//         ),
//       );
//     }
//   }
//
//   static void foregroundNotification() {
//     FirebaseMessaging.onMessage.listen(showFlutterNotification);
//
//     ///When tapped
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (response) async {
//       debugPrint('foreground notification tapped');
//       debugPrint("$response");
//     });
//   }
//
//   static void backgroundNotification() {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint('A new onMessageOpenedApp event was published!');
//       showFlutterNotification(message);
//     });
//   }
//
//   static void terminateNotification() async {
//     RemoteMessage? remoteMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage == null) {
//       FirebaseMessaging.onBackgroundMessage(
//           _firebaseMessagingBackgroundHandler);
//     } else {
//       showFlutterNotification(remoteMessage);
//     }
//   }
// }
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   await NotificationService.setupFlutterNotifications();
//   NotificationService.showFlutterNotification(message);
// }
