import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetectorResultScreen extends StatelessWidget {
  final String result;
  final File image;
  const DetectorResultScreen({super.key, required this.result, required this.image});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          appBar: appBar(hasIconBack: true, context: context, title: "Detector"),
          body:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Image.file(image,height: 300,),
),
const SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //  CircularPercentIndicator(
                  //   radius: 60.0,
                  //   lineWidth: 9.0,
                  //   percent: 0.5,
                  //
                  //   center: Text("50%"),
                  //   progressColor: const Color(0xff16A799),
                  // ),
                  const SizedBox(width: 30,),
                   Text(result,   style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),)
                ],),
              ),
              const SizedBox(height: 40,),

              // SizedBox(
              //   height: 50,width: 221,
              //   child: ElevatedButton(
              //       style: ButtonStyle(backgroundColor: WidgetStateProperty.all(blueColor)),
              //       onPressed: () {
              //         // Navigator.push(context, MaterialPageRoute(builder: (_)=>Detector2Screen()));
              //
              //       },
              //
              //       child: const Center(
              //         child: Text(
              //           "Save Results",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700),
              //         ),
              //       )),
              // ),
              const Spacer(flex: 2,),

            ],
          ),
        ));
  }
}
