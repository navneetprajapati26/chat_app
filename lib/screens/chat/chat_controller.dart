import 'dart:math';

import 'package:chat_app_fe/screens/chat/chating_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'models/model.dart';

class ChatController extends GetxController {
  late IO.Socket socket;

  List<Message> _messages = [];
  get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    //socket.onDisconnect((_) => print('disconnected'));
    super.onInit();
  }

  void login(String username, BuildContext context) async {
    socket = IO.io('https://chat-socket-api-qsas.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
    });
    //Handle socket events
    socket.onConnect((_) {
      print('connected');
      socket.emit('login', username); //Send username
    });
    // Get.to(ChatScreen());
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => ChatScreen()),);
    update();
  }

  void addMessage(String message,) async {
    // Add main message to the list
    socket.emit('chat message', message);
    update();
  }

  Future<void> fetchData() async {
    print("-----------------------------> in fechData");
    socket.off('chat message');
    socket.on('chat message', (data) {
      print("----------------------------->");
      print(data);
      Message message = Message.fromJson(data);
      _messages.add(message);
      update();
      //Add new message to messages list
    });
    //update();
  }
}
