import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';

class Client_DonorRegistrationHome extends StatefulWidget {
  const Client_DonorRegistrationHome({super.key});

  @override
  State<Client_DonorRegistrationHome> createState() =>
      _Client_DonorRegistrationHomeState();
}

class _Client_DonorRegistrationHomeState
    extends State<Client_DonorRegistrationHome> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final addressController = TextEditingController();
  final weightController = TextEditingController();
  final agecontroller = TextEditingController();
  final gentercontroller = TextEditingController();
  final List<String> gender = ["Male", "Female", "Other"];
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
  String? selectedgender;
  String? selectedgroup;
  File? _pickedimage;
  final bool _isRegistering = false;
  final int maxAgeLenght = 3;
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: _formkey,
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
                    controller: nameController,
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
                    controller: emailController,
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
                    controller: phoneController,
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
                            controller: agecontroller,
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
                          height: 55,
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
                              hintStyle: TextStyle(fontSize: 10),
                            ),
                            items: bloodgroups
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e,style: TextStyle(fontSize: 13),),
                                    ))
                                .toList(),
                            value: selectedgroup,
                            onChanged: (value) {
                              setState(() {
                                selectedgroup = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: CustomFormField(
                            textinputtype: TextInputType.number,
                            labeltxt: "Weight",
                            icons: Icon(Icons.numbers),
                            controller: weightController,
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
                          height: 55,
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
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            items: gender
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e,style: TextStyle(fontSize: 13)),
                                    ))
                                .toList(),
                            value: selectedgender,
                            onChanged: (value) {
                              setState(() {
                                selectedgender = value;
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
                    controller: addressController,
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
                  _isLoading
                      ? CircularProgressIndicator()
                      : SignUpOrSignInButton(
                          buttonName: 'Register',
                          onPress: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Shared'),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    )
    ));
    Navigator.pop(context);
                          }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   Future<void> add_Donor() async {
//     try {
//       String uid = fire_auth.currentUser!.uid;
//       String name = nameController.text;
//       String email = emailController.text;
//       String phone = phoneController.text;
//       String age = agecontroller.text;
//       String? blood = selectedgroup;
//       String weight = weightController.text;
//       String adress = addressController.text;
//       String? gender = selectedgender;
//       if (_formkey.currentState!.validate()) {
//         setState(() {
//           _isRegistering = true;
//         });
//         _formkey.currentState!.save();
//         await FireService()
//             .donorregistration(name, email, phone, age, blood!, weight, adress,
//                 _pickedimage, gender!, uid)
//             .then((value) => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Client_BottomNav(),
//                 )));
//       }
//     } catch (e) {
//       print("addd_Doonor errrrrorr$e");
//     } finally {
//       setState(() {
//         _isRegistering = false;
//       });
//     }
//   }
// }
    }