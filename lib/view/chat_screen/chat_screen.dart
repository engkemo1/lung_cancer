import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(hasIconBack: true, context: context, title: "Chat"),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.asset("images/doctor.png"),
                    title: const Text(
                      "Dr.Guy Hawkinss",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Row(
                      children: [
                        Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CupertinoColors.activeGreen),
                        ),
                        const Text(
                          "  online",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    trailing: Image.asset("images/phone.png"),
                  ),
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 20,right: 10),
                color: const Color(0xffF1F1F1),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Align(
                              alignment: index == 1
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: index == 1
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: index == 1
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child:index == 1
                                        ? Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: blueColor),
                                      child:  const Center(
                                        child:    Text(
                                          "E",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ),
                                    ):const CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage("images/doctor.png"),),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: index == 1
                                          ? Colors.white
                                          : blueColor,
                                      borderRadius: index == 1
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                4,
                                              ),
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(4))
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                15,
                                              ),
                                              topRight: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                            ),
                                    ),
                                    child: Text(
                                      "Please descripe your pain",
                                      style: TextStyle(
                                          color: index == 1
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                          hintText: 'write message',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                                "images/voice.png")),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                                "images/attach.png")),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset("images/send.png"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
