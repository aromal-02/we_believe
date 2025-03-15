import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/hospital_controller.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddHospitalDetails extends StatelessWidget {
   AddHospitalDetails({super.key});
HospitalController controller=Get.put(HospitalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colours.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
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
                  controller: controller.hospitalnamecontroller,
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
                  controller: controller.hospitalnumbercontroller,
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
                  controller: controller.detailscontroller,
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
                 controller.savedetails();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Created'),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    )
    ));
                 Navigator.pop(context);
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
