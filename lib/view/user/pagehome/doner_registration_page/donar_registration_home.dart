import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/donar_controller.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DonorRegistrationHome extends StatefulWidget {
  const DonorRegistrationHome({super.key});

  @override
  State<DonorRegistrationHome> createState() =>
      _DonorRegistrationHomeState();
}

class _DonorRegistrationHomeState
    extends State<DonorRegistrationHome> {

DonarController controller =Get.put(DonarController());
  final List<String> bloodgroups = [
    "A+",
    "B+",
    "AB+",
    "RH+",
    "O+",
    "A-",
    "AB-",
    "RH-",
    "B-",
    "O-",
  ];
  final List<String> gender = ["Male", "Female", "Other"];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: controller.formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .030,
                  ),
                 SizedBox(
                 height: 200, 
                  child: Image.asset("assets/images/donar Registration.jpg"),),//assets\images\donar Registration.jpg
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .020,
                  ),
                  CustomFormField(
                    labeltxt: "Name",
                    icons: const Icon(Icons.person),
                    controller: controller.nameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomFormField(
                    labeltxt: "Email",
                    icons: const Icon(Icons.email_outlined),
                    controller: controller.emailController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@gmail.com$")
                          .hasMatch(value)) {
                        return "please enter valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomFormField(
                    textinputtype: TextInputType.number,
                    labeltxt: "Phone Number",
                    icons: const Icon(Icons.phone),
                    controller: controller.phoneController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,                          

                          child: CustomFormField(
                            textinputtype: TextInputType.number,
                            labeltxt: "Age",
                            icons: Icon(Icons.numbers),
                            controller: controller.agecontroller,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /2.5,
                          height: MediaQuery.of(context).size.height *0.067,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colours.lightRed)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colours.lightRed)),
                              prefixIcon: Icon(
                                Icons.bloodtype_outlined,
                                color: Colours.red,size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: "Blood Type",
                              hintStyle: TextStyle(fontSize: 8),
                            ),
                              items: bloodgroups.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),

                             value: controller.selectedgroup.value ?? null,

                          onChanged: (value) => controller.selectedgroup.value = value!,

                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height *0.067,

                          child: CustomFormField(
                            textinputtype: TextInputType.number,
                            labeltxt: "Weight",
                            icons: Icon(Icons.numbers),
                            controller: controller.weightController,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height *0.067,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colours.lightRed)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colours.lightRed)),
                              prefixIcon: Icon(
                                Icons.man_outlined,
                                color: Colours.red,size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: "Gender",
                              hintStyle: TextStyle(fontSize: 10),
                            ),
                            items: gender
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e,style: TextStyle(fontSize: 13)),
                                    ))
                                .toList(),
                            value:controller. selectedgender.value,
                            onChanged: (value) {
                              setState(() {
                                controller.selectedgender.value = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomFormField(
                    labeltxt: "Address",
                    maxline: 5,
                    controller: controller.addressController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => controller.isLoading.value 
    ? CircularProgressIndicator() 
    : SignUpOrSignInButton(
        buttonName: 'Register',
        onPress: () {controller.savedetails();
        
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Shared'),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    )
    ));
    Navigator.pop(context);
    }
      ),
),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
