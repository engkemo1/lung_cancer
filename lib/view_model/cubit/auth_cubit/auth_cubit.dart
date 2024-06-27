import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/model/auth_model.dart';
import 'package:lung_cancer/view/main_screen.dart';
import 'package:lung_cancer/view_model/cubit/auth_cubit/auth_state.dart';

import '../../../constants.dart';
import '../../database/local.dart';
import '../../database/network/dio_helper.dart';

class AuthCubit extends Cubit<AuthMainState> {
  AuthCubit() : super(AuthMainInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  User user = User();

  Future login(String email, String password, BuildContext context) async {
    emit(LoginLoadingState());
    try {
      var response = await DioHelper.postData(
          url: "$baseUrl/user_auth.php?action=login",
          data: {'email': email, 'password': password});
      var data = response.data; // Assuming you have the data string


      if (data["success"] == true) {
        await SmartDialog.showToast("Login Successfully");
        var responseBody = data['data'];
        user = User.fromJson(responseBody);
        CacheHelper.put(key: 'code', value: user.code);
        CacheHelper.put(key: 'name', value: user.userName);
        CacheHelper.put(key: 'email', value: user.email);
        CacheHelper.put(key: 'type', value: user.type);

        emit(LoginSuccessState());
      } else {
        SmartDialog.showToast(data["error"]);
      }
    } on DioError catch (e) {
      SmartDialog.showToast(e.response!.data["error"]);

      emit(LoginErrorState(e));
    }
  }

  Future register(String email, String password, String userName, String type,
      BuildContext context) async {
    emit(RegisterLoadingState());
    var body = {
      "user_name": userName,
      "name": userName,
      "email": email,
      "type": type,
      "lat": "34.052235",
      "lon": "-118.243683",
      "password": password
    };

    try {
      var response = await DioHelper.postData(
          url: "$baseUrl/user_auth.php?action=register", data: body);
      var data = response.data; // Assuming you have the data string

// Parse the JSON string into a Map

      if (data["success"] == true) {
        await SmartDialog.showToast("Login Successfully");
        var responseBody = data['data'];
        user = User.fromJson(responseBody);
        CacheHelper.put(key: 'code', value: user.code);
        CacheHelper.put(key: 'name', value: user.userName);
        CacheHelper.put(key: 'email', value: user.email);
        CacheHelper.put(key: 'type', value: user.type);
        emit(RegisterSuccessState());

      } else {
        await SmartDialog.showToast(data['error']);
      }
    } on DioError catch (e) {
      await SmartDialog.showToast(e.response!.data['error']);

      emit(RegisterErrorState(e));
    }
  }
}
