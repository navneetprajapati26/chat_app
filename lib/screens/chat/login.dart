import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../utils/neomorphism/neomorphism_box.dart';
import 'chat_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    double radius = 20;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuBox(
              background: Colors.grey[300],
              topShadow: Colors.white,
              bottomShadow: Colors.grey.shade500,
              borderRadiusGeometry: BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
              child: Container(
                // height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0x34a8a6a6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(radius),
                    topLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 2, bottom: 2),
                  child: TextField(
                    controller: _textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.normal),
                    decoration: const InputDecoration(
                      hintText: 'Enter your Username...',
                      hintStyle: TextStyle(
                          color: Color(0xff2f2d2d),
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<ChatController>(
                init: ChatController(),
                builder: (chatController) {
                  return CupertinoButton(
                      child: NeuBox(
                        background: Colors.grey[300],
                        topShadow: Colors.white,
                        bottomShadow: Colors.grey.shade500,
                        borderRadiusGeometry: BorderRadius.only(
                          topRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius),
                          bottomLeft: Radius.circular(radius),
                        ),
                        child: Container(
                            width: 400,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0x34a8a6a6),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(radius),
                                topLeft: Radius.circular(radius),
                                bottomRight: Radius.circular(radius),
                                bottomLeft: Radius.circular(radius),
                              ),
                            ),
                            child: Text("Login")),
                      ),
                      onPressed: () {
                        chatController.login(
                            _textEditingController.text.trim(), context);
                      });
                })
          ],
        ),
      ),
    );
  }
}
