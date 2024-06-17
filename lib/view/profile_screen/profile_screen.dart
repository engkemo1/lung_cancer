import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/authentication/login_screen.dart';
import 'package:lung_cancer/view/component/app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: appBar(hasIconBack: true, context: context, title: "profile"),
          body: ListView(
            children: [
              const SizedBox(height: 70,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Elsia Rhiel Madsen",
                            style:
                            TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              const Expanded(child: Column(
                                children: [
                                  Text(
                                    "45",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2A9DF4)),
                                  ),
                                  Text(
                                    "Age",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )

                                ],
                              ),),
                              Column(
                                children: [
                                  Container(
                                    height: 50, // Adjust height as needed
                                    width: 1, // Width of the divider line
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              const Expanded(child: Column(
                                children: [
                                  Text(
                                    "175cm",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2A9DF4)),
                                  ),
                                  Text(
                                    "Height",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )

                                ],
                              ),),
                              Column(
                                children: [
                                  Container(
                                    height: 50, // Adjust height as needed
                                    width: 1, // Width of the divider line
                                    color: Colors.grey,
                                  ),
                                ],
                              ), const Expanded(child: Column(
                                children: [
                                  Text(
                                    "A+",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2A9DF4)),
                                  ),
                                  Text(
                                    "Blood",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )

                                ],
                              ),),
                              Column(
                                children: [
                                  Container(
                                    height: 50, // Adjust height as needed
                                    width: 1, // Width of the divider line
                                    color: Colors.grey,
                                  ),
                                ],
                              ), const Expanded(child: Column(
                                children: [
                                  Text(
                                    "80kg",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff2A9DF4)),
                                  ),
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )

                                ],
                              ),),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -60,
                      right: 100, left: 100,
                      child: Image.asset("images/logo.png", height: 90,)),


                ],
              ),
              SizedBox(height: 40,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Image.asset("images/edit_profile.png"),
                              const Text("     Edit Profile", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Image.asset("images/treatment.png"),
                              Text("     Previous Treatment", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Image.asset("images/privacy.png"),
                              Text("     Privacy Policy", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //   MaterialPageRoute(builder: (_) => LoginScreen()));
                          },
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(
                              //         builder: (_) => LoginScreen()));
                            },
                            child: Row(
                              children: [
                                Image.asset("images/help.png"),
                                const Text("     Help", style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Image.asset("images/settings.png"),
                              Text("     Settings", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      const Divider(), Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Image.asset("images/log out.png"),
                              Text("     logout", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              )
            ],
          ),
        ));
  }
}
