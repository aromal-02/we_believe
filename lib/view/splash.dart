import 'dart:developer';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/view/auth/login.dart';
import 'package:donation/view/superadmin/home.dart';
import 'package:donation/view/user/home.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checking(); // Call the checking function to determine navigation
  }

  Future<void> checking() async {
  String uid = await FirebaseService.getValue("uid") ?? "";
  String uname = await FirebaseService.getValue("uname") ?? "";
  String uemail = await FirebaseService.getValue("uemail") ?? " ";
  String uphone = await FirebaseService.getValue("unumber") ?? "";

    log('Checking user session: uid=$uid, uname=$uname, email=$uemail, phone=$uphone');

    // Navigate based on the user session
    Widget nextScreen;
    if (uid == 'admin') { nextScreen = AdminHome();
     
    } else if (uid == null||uid.isEmpty) {
      nextScreen = LoginScreen();
    } else {
      nextScreen = UserHome(name: uname, email: uemail, phone: uphone);
    }

    // Add a delay before navigation
    await Future.delayed(const Duration(seconds: 4));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 20),
            LoadingAnimationWidget.threeRotatingDots(
              color: const Color.fromARGB(255, 128, 5, 11),
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
