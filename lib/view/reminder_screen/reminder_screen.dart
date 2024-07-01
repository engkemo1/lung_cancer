import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';
import 'package:lung_cancer/view/scan_screen/detector_upload_screen.dart';
import 'package:svg_flutter/svg.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(double.infinity,150),
        child: SvgPicture.asset("images/calendar.svg",fit: BoxFit.fill,width: double.infinity,)
          ,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
Image.asset("images/reminder_background.png"),
                SizedBox(height: 20,),
                SizedBox(width: width*0.7,child: ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),onPressed: (){}, child: Text("+ Add Medicine",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),)))
                ],
            ),
      ),
    );
  }
}
