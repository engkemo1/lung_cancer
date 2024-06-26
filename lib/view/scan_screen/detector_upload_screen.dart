import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';

import 'detector_result_screen.dart';

class Detector2Screen extends StatefulWidget {
   Detector2Screen({super.key});

  @override
  State<Detector2Screen> createState() => _Detector2ScreenState();
}

class _Detector2ScreenState extends State<Detector2Screen> {
  File? _image;
 // This will store the picked image
  final _picker = ImagePicker();
 // Image picker instance
  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: appBar(hasIconBack: true, context: context, title: "Detector"),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "his is a photo detector it is used byuploading x-ray image inorder to seeif there are cancerous cell or not"
            ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,),textAlign: TextAlign.center,
            ),
          ),
          const   SizedBox(height: 80,),
          const   Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "upload an x-ray image to start"
              ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
            ),

          ),
          const SizedBox(height: 50,),
          SizedBox(
            height: 50,width: 221,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(blueColor)),
                onPressed: () {
                  _openImagePicker();
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>Detector3Screen()));

                },
                child: const Center(
                  child: Text(
                    "upload image",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )),
          ),
          const Spacer(flex: 2,),

        ],
      ),
    ));
  }
}
