import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/authentication/login_screen.dart';
import 'package:lung_cancer/view/authentication/widget/auth_background.dart';
import 'package:svg_flutter/svg.dart';

import '../../view_model/cubit/auth_cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_cubit/auth_state.dart';
import '../main_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _hide = true;
  bool _hide2 = true;

////       index==1 ? DOCTOR : index ==2 ?  Patient :  none      ///////////
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthMainState>(
          builder: (context, state) {
            return Form(
              key: _globalKey,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    Authbackground(
                      height: height,
                      width: width,
                      title: "Sign Up",
                    ),
                    SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                            validator:(String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              // Add more validation rules for names (if needed)
                              return null;
                            },
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: "User name",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: blueColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2))),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                            validator:  (String? value) {
                        if (value == null || value.isEmpty) {
                        return 'Email is required';
                        }
                        return null;
                        },
                            controller: emailController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: "Email",
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: blueColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2))),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              // Add more validation rules as needed
                              return null;
                            },
                            obscureText: _hide,
                            controller: passController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hide = !_hide;
                                  });
                                },
                                icon: Icon(
                                  _hide == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: blueColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2))),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                            obscureText: _hide2,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password is required';
                              }
                              if (value != passController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            controller: confirmPassController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: "Confirm Password",
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hide2 = !_hide2;
                                  });
                                },
                                icon: Icon(
                                  _hide2 == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: blueColor)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2))),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: index == 1
                                    ? textColor.withOpacity(0.8)
                                    : Colors.white,

                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.personal_injury_sharp,
                                  color: index == 1 ? Colors.white : Colors
                                      .grey,
                                ),
                                Text(
                                  "Doctor",
                                  style: TextStyle(
                                      color: index == 1 ? Colors.white : Colors
                                          .grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                index = 0;
                              });
                            },
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3),
                              decoration: BoxDecoration(
                                  color: index == 2
                                      ? textColor.withOpacity(0.8)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_pin_outlined,
                                    color: index == 2 ? Colors.white : Colors
                                        .grey,
                                  ),
                                  Text(
                                    "Patient",
                                    style: TextStyle(
                                        color: index == 2
                                            ? Colors.white
                                            : Colors
                                            .grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39),
                      child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                if(_globalKey.currentState!.validate()){
                                  if(index!=0){
                                    AuthCubit.get(context).register(
                                        emailController.text, passController.text,
                                        userNameController.text, index==1?"doctor":index==2?"user":"other", context);
                                  }else{
                                    SmartDialog.showToast("please select type");
                                  }

                                }

                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStateProperty.all(blueColor)),
                              child: const Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already  have an account , ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Log in",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          }, listener: (BuildContext context, state) async{
          if (state is RegisterLoadingState) {
            SmartDialog.showLoading();
            await Future.delayed(Duration(seconds: 2));
            SmartDialog.dismiss();

          }
          if
           (state is RegisterSuccessState) {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MainScreen()));

          }

        },),
      ),
    );
  }
}
