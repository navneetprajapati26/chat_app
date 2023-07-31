import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custoum_circular_progress_indicator.dart';
import '../../utils/neomorphism/neomorphism_box.dart';
import 'models/model.dart';
import 'chat_controller.dart';



class ChatComponent extends StatelessWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    double radius = 15;
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (chatController) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatController.messages.length,
              itemBuilder: (context, index) {
                Message chatMessage = chatController.messages[chatController.messages.length - 1 - index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8,right: 76),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: NeuBox(
                      background:  Colors.grey[300],
                      topShadow: Colors.white,
                      bottomShadow: Colors.grey.shade500,
                      borderRadiusGeometry: BorderRadius.only(
                          topRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0x34a8a6a6),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(radius),
                              topLeft: Radius.circular(radius),
                              bottomLeft: Radius.circular(radius),
                              bottomRight: Radius.circular(radius)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8,right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3,bottom: 8,left: 0,right: 15),
                                child: Text(
                                  chatMessage.username!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: Color(0xFF131313)),
                                ),
                              ),
                              Text(
                                chatMessage.msg!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF131313)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: NeuBox(
                        background:  Colors.grey[300],
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
                                left: 10, right: 10, top: 0, bottom: 0),
                            child: TextField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style:  const TextStyle(
                                  color:Color(0xff000000),
                                  fontWeight: FontWeight.normal),
                              decoration: const InputDecoration(
                                hintText: 'Enter a message...',
                                hintStyle: TextStyle(
                                    color: Color(0xff2f2d2d),
                                    fontWeight: FontWeight.normal),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    chatController.isLoading
                        ? CustoumCircularIndi()
                        : CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: NeuBox(
                              background:  Colors.grey[300],
                              topShadow: Colors.white,
                              bottomShadow: Colors.grey.shade500,
                              borderRadiusGeometry: BorderRadius.only(
                                topRight: Radius.circular(radius),
                                topLeft: Radius.circular(radius),
                                bottomRight: Radius.circular(radius),
                                bottomLeft: Radius.circular(radius),
                              ),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(radius),
                                      topLeft: Radius.circular(radius),
                                      bottomRight: Radius.circular(radius),
                                      bottomLeft: Radius.circular(radius),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.send_rounded,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            onPressed: () async {
                              String message = _textEditingController.text;
                              if (message.isNotEmpty) {
                                chatController.addMessage(message,);
                                _textEditingController.clear();
                                chatController.fetchData();
                                //chatProvider.addMessage( await apiProvider.apiResponse!.content!.toString(), false);
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
