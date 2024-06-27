import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';
import 'package:lung_cancer/view_model/cubit/detect_cancer/detecet_cancer_cubit.dart';

import '../../view_model/cubit/detect_cancer/detetcet_cancer_state.dart';
import 'detector_result_screen.dart';

class DetectorUploadScreen extends StatefulWidget {
   DetectorUploadScreen({super.key});

  @override
  State<DetectorUploadScreen> createState() => _DetectorUploadScreenState();
}

class _DetectorUploadScreenState extends State<DetectorUploadScreen> {
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
            child: BlocProvider(
              create: (context)=>DetcetCancerCubit(),
              child: BlocConsumer<DetcetCancerCubit,DetcetCancerMainState>(
                listener: (context,state)async{
                  if(state is DetcetCancerLoadingState){
                    SmartDialog.showLoading();
                  await  Future.delayed(Duration(seconds: 5));
                    SmartDialog.dismiss();
                  } if(state is DetcetCancerSuccessState){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DetectorResultScreen(image: _image!,result: DetcetCancerCubit.get(context).result,)));

                  }
                },
                builder: (context,state) {
                  return ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(blueColor)),
                      onPressed: () {

                        _openImagePicker().then((v){
                          DetcetCancerCubit.get(context).detectImage(_image!.path, context);
                        });

                      },
                      child: const Center(
                        child: Text(
                          "upload image",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ));
                }
              ),
            ),
          ),
          const Spacer(flex: 2,),

        ],
      ),
    ));
  }
}
