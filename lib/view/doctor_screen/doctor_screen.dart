import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../component/app_bar_widget.dart';
import '../component/clipper.dart';

class DoctorScreen extends StatelessWidget {
  final String title;

  const DoctorScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title: title, hasIconBack: true, context: context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
              children: List.generate(10, (index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 1, child: Image.asset("images/doctor.png")),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 10,
                                    ),
                                    Text(
                                      " 4.2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Dr.Guy Hawkinss",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "oncologist",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: textColor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
        ),
      ),
    );
  }
}
