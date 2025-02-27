import 'package:donation/view/auth/login.dart';
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
    Future.delayed(const Duration(seconds:4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
    });
  }
   @override
  build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo1.png',
              
               height: MediaQuery.of(context).size.height*0.4, width:MediaQuery.of(context).size.width*0.8,
               
               ),
             
              LoadingAnimationWidget.threeRotatingDots(color: const Color.fromARGB(255, 128, 5, 11), size:50 )
             
            ],
          ),
        ),
      ),
    );
  }
}