import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/component/clipper.dart';
import 'package:lung_cancer/view/doctor_screen/doctor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: BottomCurveClipper(),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: primaryColor,
                  ),
                ),
                const Text(
                  'Hello, Veronica',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  " Doctors",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: textColor2),
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DoctorScreen(title: "Lung Doctors",)));
                        },
                        child: Container(
                          height: 208,
                          width: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: primaryColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/lung.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Lung",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DoctorScreen(title: 'Colon Doctors',)));
                      },
                      child: Container(
                        height: 208,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: primaryColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/colon.png"),
                            const Text(
                              "Colon",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  " Blog",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: textColor2),
                ),
              ),
            ),
            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "images/test.png",
                        height: 165,
                        width: 400,
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 10,
                      child: SizedBox(
                        width: 280,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "every thing you need to know about lung cancer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
