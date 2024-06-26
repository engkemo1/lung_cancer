import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_state.dart';

import '../../constants.dart';
import '../component/app_bar_widget.dart';

class DoctorScreen extends StatelessWidget {
  final String title;

  const DoctorScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title: title, hasIconBack: true, context: context),
        body: BlocProvider(
          create: (context) => HomeCubit()
            ..getDoctors(title == "Lung Doctors" ? "lung" : "colon", context),
          child: BlocConsumer<HomeCubit, HomeMainState>(
            builder: (context, state) {
              var data = HomeCubit.get(context).doctorsData;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                    children: List.generate(data.length, (index) {
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Image.network(
                                data[index].img!,
                                errorBuilder: (context, e, o) =>
                                    Image.asset("images/doctor.png"),
                              )),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 5,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: CupertinoColors
                                                    .activeGreen),
                                          ),
                                          const Text(
                                            "  online",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 11,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 10,
                                          ),
                                          Text(
                                            " 4.2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 11,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                   Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      data[index].userName!,
                                      style:const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Text(
                                    "oncologist",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
              );
            },
            listener: (BuildContext context, HomeMainState state) {
              if (state is DoctorLoadingState) {
                SmartDialog.showLoading();
                Future.delayed(const Duration(seconds: 3));
                SmartDialog.dismiss();
              }
            },
          ),
        ),
      ),
    );
  }
}
