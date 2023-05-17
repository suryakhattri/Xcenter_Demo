import 'package:flutter/material.dart';
import 'package:xcenter_demo/UI/Login/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xcenter_demo/UI/NotificationService/local_notification_services.dart';
import 'package:xcenter_demo/Model/sport_model.dart';
import 'package:provider/provider.dart';
import 'package:xcenter_demo/Model/cart_model.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationServices.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    ),
  );
}
