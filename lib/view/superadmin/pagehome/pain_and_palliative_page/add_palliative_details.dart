import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/painpalliative_controller.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPalliativeDetails_super extends StatelessWidget {
   AddPalliativeDetails_super({super.key});
PainpalliativeController controller=Get.put(PainpalliativeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Add Details",
          style: TextStyle(color: Colors.white),
        ),
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
                  child: Image.asset("assets/images/care.jpg"),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                CustomFormField(
                  controller: controller.palliativename,
                  icons: Icon(Icons.person),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  labeltxt: "palliativename",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  icons: Icon(Icons.phone),
                  labeltxt: "Palliative Number",
                  controller: controller.palliativenumber,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomFormField(
                  controller: controller.detailscontroller,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  labeltxt: "Palliative details and locations",
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
