import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';
import 'package:lung_cancer/view/scan_screen/detector_upload_screen.dart';

class Detector1Screen extends StatelessWidget {
  const Detector1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(hasIconBack: false, context: context, title: "Detector"),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset("images/lung2.png",height: height*0.2,),
              const SizedBox(height: 10,),

              SizedBox(
                height: 50,width: 221,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(blueColor)),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Detector2Screen()));
                    },
                    child: const Center(
                      child: Text(
                        "Lung",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ),
              const SizedBox(height: 30,),
              Image.asset("images/colon2.png",height:  height*0.2,),
              const SizedBox(height: 10,),

              SizedBox(
                height: 50,width: 221,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(blueColor)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Detector2Screen()));

                    },
                    child: const Center(
                      child: Text(
                        "Colon",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
