import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';
class SignUpOrSignInButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;
  
  const SignUpOrSignInButton({super.key, required this.buttonName, required this.onPress, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(

          backgroundColor: Colours.red,
          fixedSize:const Size(370, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      ),
      onPressed:onPress, child: Text(buttonName,style: const TextStyle(color: Colours.white,fontWeight: FontWeight.w500),),
    );
  }
}