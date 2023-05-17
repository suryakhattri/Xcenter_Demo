import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();


  static void initialize()  {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    _notificationsPlugin.initialize (
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");
      //
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );
      //   }
      // },

      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        //notificationResponse;
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            print("onSelectNotification");
           // selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            notificationResponse;
            print("onSelectNotification");
            // if (notificationResponse.actionId == navigationActionId) {
            //  // selectNotificationStream.add(notificationResponse.payload);
            // }
            break;
        }
      },
      //For backround notification
      // onDidReceiveBackgroundNotificationResponse: (NotificationResponse notificationResponse) {
      //   switch (notificationResponse.notificationResponseType) {
      //     case NotificationResponseType.selectedNotification:
      //       print("onSelectNotification1");
      //       //selectNotificationStream.add(notificationResponse.payload);
      //       break;
      //     case NotificationResponseType.selectedNotificationAction:
      //       notificationResponse;
      //       print("onSelectNotification2");
      //      //  if (notificationResponse.actionId == navigationActionId) {
      //      // //   selectNotificationStream.add(notificationResponse.payload);
      //      //  }
      //       break;
      //   }
      // },

    );
  }
  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "XcenterDemo",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
