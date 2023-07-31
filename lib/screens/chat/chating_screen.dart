import 'package:flutter/material.dart';

import 'chat_component.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: ChatComponent(),
    );
  }
}
