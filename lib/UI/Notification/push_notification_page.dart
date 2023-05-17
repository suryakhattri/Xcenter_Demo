import 'package:flutter/material.dart';



class PushNotificationPage extends StatelessWidget {
  const PushNotificationPage({Key? key , required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(id.toString()),),

    );
  }
}