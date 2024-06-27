
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/model/doctor_model.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_state.dart';
import '../../../constants.dart';
import '../../database/local.dart';
import '../../database/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeMainState> {
  HomeCubit() : super(HomeMainInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<DoctorData> doctorsData = [];

  Future getDoctors(String type, BuildContext context) async {
    emit(DoctorLoadingState());
    try {
      var response = await DioHelper.postData(
          url: "$baseUrl/dr.php?action=Get_Dr",
          data: {"type": type},
          token: CacheHelper.get(key:"code")
      );
      var data = response.data; // Assuming you have the data string


      if (data["success"] == true) {
        var responseBody = data['data'];
        print("$responseBody this data");

        doctorsData=
            (responseBody as List).map((e) => DoctorData.fromJson(e)).toList();
        emit(DoctorSuccessState());
      } else {
        SmartDialog.showToast(data["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.statusCode);

      emit(DoctorErrorState(e));
    }
  }
}
