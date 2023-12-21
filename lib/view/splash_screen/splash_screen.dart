import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.primaryWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'QUICK MECH',
              style: GoogleFonts.orbitron(
                  color: ColorConstants.bannerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ));
  }
}
