import 'package:flutter/cupertino.dart';
import 'package:svg_flutter/svg.dart';

import '../../../constants.dart';

class Authbackground extends StatelessWidget {
  const Authbackground({
    super.key,
    required this.title,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height*0.4,
          width: width,
          child: SvgPicture.asset("images/Vector 1.svg",fit: BoxFit.fill
            ,),
        ),
        Positioned(
            top: height * 0.10,
            left: width * 0.25,
            child: Column(
              children: [
                Image.asset("images/logo.png",fit: BoxFit.fill,)
                ,
                Text(
                  title,
                  style:const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),

              ],
            )),

      ],
    );
  }
}
