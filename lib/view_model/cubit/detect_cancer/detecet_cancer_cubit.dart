import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/model/auth_model.dart';
import 'package:lung_cancer/model/doctor_model.dart';
import 'package:lung_cancer/view/main_screen.dart';
import 'package:lung_cancer/view_model/cubit/auth_cubit/auth_state.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_state.dart';

import '../../../constants.dart';
import '../../database/local.dart';
import '../../database/network/dio_helper.dart';
import 'detetcet_cancer_state.dart';

class DetcetCancerCubit extends Cubit<DetcetCancerMainState> {
  DetcetCancerCubit() : super(DetcetCancerInitialState());

  static DetcetCancerCubit get(context) => BlocProvider.of(context);
  var result ;

  Future<void> detectImage(String image, BuildContext context) async {
    print(image);
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image),
    });
    emit(DetcetCancerLoadingState());
    try {
      final response = await Dio().post(
        "https://lung-colon-cancer.onrender.com/classify_image",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data; // Assuming you have the data string
        print(data);
result=data["predicted_category"];
print(result);
        // Process the data as needed

        emit(DetcetCancerSuccessState());
      } else {
        SmartDialog.showToast(response.data);

      }
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);

      emit(DetcetCancerErrorState(e));
    }
  }
}
