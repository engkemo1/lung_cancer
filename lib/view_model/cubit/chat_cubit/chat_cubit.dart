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
import 'package:lung_cancer/view_model/cubit/chat_cubit/chat_state.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_state.dart';

import '../../../constants.dart';
import '../../database/local.dart';
import '../../database/network/dio_helper.dart';



class ChatCubit extends Cubit<ChatMainState> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  var result;

  Future<void> getChats(BuildContext context) async {
    emit(GetChatLoadingState());
    try {
      final response = await DioHelper.postData(
          url: "$baseUrl/messages.php?action=getAllConversation",
          token: CacheHelper.get(key: "code"));
      String data = response.data; // Assuming you have the data string

      Map<String, dynamic> parsedData = json.decode(data);
      if (response.statusCode == 200) {
        final data = response.data; // Assuming you have the data string
        print(data);
        // Process the data as needed

        result=
            (data["data"] as List).map((e) => DoctorData.fromJson(e)).toList();
        emit(GetChatSuccessState());
      } else {
        SmartDialog.showToast(response.data);
      }
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);

      emit(GetChatErrorState(e));
    }
  }
}
