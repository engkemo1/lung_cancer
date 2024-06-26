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

class HomeCubit extends Cubit<HomeMainState> {
  HomeCubit() : super(HomeMainInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<DoctorData> doctorsData = [];

  Future getDoctors(String type, BuildContext context) async {
    print(type);
    emit(DoctorLoadingState());
    try {
      var response = await DioHelper.postData(
          url: "$baseUrl/dr.php?action=Get_Dr",
          data: {"type": type},
          token: "bNCS1TADpvzEkDwzD8dJJYe8toaPcpfYA4YKfEeHA"
      );
      String data = response.data; // Assuming you have the data string
      print(data);

      Map<String, dynamic> parsedData = json.decode(data);

      if (parsedData["success"] == true) {
        var responseBody = parsedData['data'];
        print("$responseBody this data");

        doctorsData=
            (responseBody as List).map((e) => DoctorData.fromJson(e)).toList();
        emit(DoctorSuccessState());
      } else {
        SmartDialog.showToast(parsedData["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);

      emit(DoctorErrorState(e));
    }
  }
}
