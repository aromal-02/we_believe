
// ignore_for_file: must_be_immutable

import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart' show LoadingAnimationWidget;


class CustomElevatedBtn extends StatelessWidget {
  final String name;
 final VoidCallback ontap;
 Color backgroundColor;
 Color textColor;
 Color outlineBorderColor;
 bool isOutline;
 bool isLoading;
 String? type;

   CustomElevatedBtn({
    super.key,
     required this.name, 
     required this.ontap,
     required this.backgroundColor ,
     required this.textColor ,
     this.isOutline = false,
     this.isLoading = false,
     this.outlineBorderColor = Colours.white,  String? type
  });
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,height: 40,
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:isOutline ? Colors.transparent : backgroundColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15),),),
             
              side:isOutline ? BorderSide(
               color: outlineBorderColor, 
               width: 1.5,
             ):null
            ),
            onPressed:!isLoading?ontap:null, 
            child:!isLoading ? Text(
                name,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: textColor)
              ):Center(child:  LoadingAnimationWidget.waveDots(color: Colours.white, size:50 ),)),
    );
  }
}

