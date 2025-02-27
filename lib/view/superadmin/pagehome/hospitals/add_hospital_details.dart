import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';


class AddHospitalDetails extends StatefulWidget {
  const AddHospitalDetails({super.key});

  @override
  State<AddHospitalDetails> createState() => _AddHospitalDetailsState();
}

class _AddHospitalDetailsState extends State<AddHospitalDetails> {
  final formkey = GlobalKey<FormState>();
  final hospitalname = TextEditingController();
  final hospitalnumber = TextEditingController();
  final hospitaldetailsandlocation = TextEditingController();
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colours.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                SizedBox(
                 height: 200, 
                  child: Image.asset("assets/images/hospital.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                CustomFormField(
                  labeltxt: "Hospital Name",
                  icons: Icon(Icons.local_hospital),
                  controller: hospitalname,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  labeltxt: "Hospital Number",
                  icons: Icon(Icons.phone),
                  controller: hospitalnumber,
                  textinputtype: TextInputType.number,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                //
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  controller: hospitaldetailsandlocation,
                  labeltxt: "Hospital details and locations",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  maxline: 5,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                SignUpOrSignInButton(
                  buttonName: 'submit',
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                    //  Hospitals_add();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
