import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/authentication/register_screen.dart';
import 'package:lung_cancer/view/authentication/widget/auth_background.dart';
import 'package:lung_cancer/view/main_screen.dart';
import 'package:lung_cancer/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:lung_cancer/view_model/cubit/auth_cubit/auth_state.dart';
import 'package:svg_flutter/svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                Authbackground(
                  height: height,
                  width: width,
                  title: "Sign in",
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      validator: (String? value) {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 28),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                BlocConsumer<AuthCubit, AuthMainState>(
                  builder: (context, state) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 39),
                        child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_globalKey.currentState!.validate()) {
                                    AuthCubit.get(context).login(
                                        emailController.text,
                                        passController.text,
                                        context);
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(blueColor)),
                                child: const Center(
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ))));
                  },
                  listener: (BuildContext context,  state) async{
                    if (state is LoginLoadingState) {
                      SmartDialog.showLoading();
                    await  Future.delayed(const Duration(seconds: 2));
                     SmartDialog.dismiss();

                    }
                    if (state is LoginSuccessState) {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MainScreen()));
                    }

                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      Text(
                        "   or   ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/facebook.png"),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset("images/google.png"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account , ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
