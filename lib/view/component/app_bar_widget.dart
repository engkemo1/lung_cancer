import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clipper.dart';

 PreferredSizeWidget appBar({String? title, required bool hasIconBack,required,Widget? child, required BuildContext context}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity,151),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
          clipper: BottomCurveClipper(),
          child: Container(
            height: 151,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff2A9DF4),
              Color(0xff2A82C4),
              Color(0xff7BBAE9)
            ], end: Alignment.topLeft, begin: Alignment.topRight)),
          ),
        ),
        title != null
            ? Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        hasIconBack==true?   Positioned(
            top: 35,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("images/arrow_back.png"),
            )):const SizedBox(),
child??SizedBox.shrink(),

      ],
    ),
  );
}
