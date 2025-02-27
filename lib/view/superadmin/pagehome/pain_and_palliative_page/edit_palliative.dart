import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';


class EditPalliative extends StatefulWidget {
  const EditPalliative({super.key});

  @override
  State<EditPalliative> createState() => _EditPalliativeState();
}

class _EditPalliativeState extends State<EditPalliative> {
  final formkey=GlobalKey<FormState>();
  final palliativename=TextEditingController();
  final palliativenumber=TextEditingController();
  final palliativelocation=TextEditingController();
  File? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Edit Palliative"),
      ),
      body:SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*.02,),
                Stack(children: [
                  CircleAvatar(
                      radius:MediaQuery.of(context).size.height*.09,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:_pickedImage!=null?
                      FileImage(_pickedImage!):null),

                  Positioned(
                      top:MediaQuery.of(context).size.height*.12,
                      left: MediaQuery.of(context).size.height*.11,
                      child: IconButton(onPressed:(){
                      }, icon:Icon(Icons.camera_alt,color:Colours.lightRed,))
                  ),
                ],),
                SizedBox(height:MediaQuery.of(context).size.height*.02,),
                CustomFormField(
                  controller: palliativename,
                  icons:Icon(Icons.person) ,
                  validation:(value){
                    if(value==null||value.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                  labeltxt: "palliativename",

                ),

                SizedBox(height:MediaQuery.of(context).size.height*.01,),
                CustomFormField(
                  icons:Icon(Icons.phone),
                  labeltxt:"Palliative Number" ,
                  controller:palliativenumber,
                  textinputtype: TextInputType.number,
                  validation: (value){
                    if(value==null||value.isEmpty){
                      return "Required";
                    }else if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },

                ),

                SizedBox(height:MediaQuery.of(context).size.height*.01,),
                CustomFormField(
                  controller: palliativelocation,
                  validation:(value){
                    if(value==null||value.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                  labeltxt: "Palliative details and locations",
                  maxline: 5,
                ),

                SizedBox(height:MediaQuery.of(context).size.height*.02,),


                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:MediaQuery.of(context).size.width*.4,
                      child: ElevatedButton(onPressed: (){
                        if(formkey.currentState!.validate()){
                          formkey.currentState!.save();
                          Navigator.pop(context);
                        }},
                        style:ButtonStyle(
                          backgroundColor:WidgetStateProperty.all(Colours.red),
                        ),
                        child:Text("Edit",style:TextStyle(fontSize:20,color:Colours.white),),
                      ),
                    ),

                    SizedBox(
                      width:MediaQuery.of(context).size.width*.4,
                      child: ElevatedButton(onPressed: (){

                      },
                        style:ButtonStyle(
                          backgroundColor:WidgetStateProperty.all(Colours.red),
                        ), child:Text("Delete",style:TextStyle(fontSize:20,color:Colours.white),),
                      ),
                    ),

                  ],),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
