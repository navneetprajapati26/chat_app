

import 'package:chat_app_fe/screens/chat/login.dart';
import 'package:chat_app_fe/screens/chat/models/model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
     // home: ChatScreen(),
      home: Login(),
    );
  }
}
