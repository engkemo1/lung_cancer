import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../component/app_bar_widget.dart';
import '../component/clipper.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {

  const ChatListScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title: "Chat", hasIconBack: false, context: context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
              children: List.generate(10, (index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatScreen()));

                  },
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(flex: 1, child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset("images/doctor.png"),
                              Positioned(
                                bottom: 0,right: -4,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CupertinoColors.activeGreen),
                                ),
                              ),
                            ],
                          )),
                          const Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Spacer(),

                                      Text(
                                        " 9:12",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11,
                                            color: Colors.grey),
                                      )
                                                                            ,
                                    ],
                                  ),
                                  Text(
                                    "Dr.Guy Hawkinss",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "oncologist",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet consectetur.",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
