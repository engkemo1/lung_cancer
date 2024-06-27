import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/view/authentication/login_screen.dart';
import 'package:lung_cancer/view/main_screen.dart';
import 'package:lung_cancer/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:lung_cancer/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:lung_cancer/view_model/database/local.dart';
import 'package:lung_cancer/view_model/database/network/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
        home: CacheHelper.get(key: "code")==null? LoginScreen():MainScreen(),
      ),
    );
  }
}

