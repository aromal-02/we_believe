import 'dart:io';

import 'package:donation/constant/colors.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';


class AddAmbulanceService extends StatefulWidget {
  const AddAmbulanceService({super.key});

  @override
  State<AddAmbulanceService> createState() => _AddAmbulanceServiceState();
}

class _AddAmbulanceServiceState extends State<AddAmbulanceService> {
  final formkey = GlobalKey<FormState>();
  final drivername = TextEditingController();
  final drivernumber = TextEditingController();
  final vehicledetailsandlocation = TextEditingController();
  File? _pickedImage;
  final bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text("Add Ambulance Service")),
        backgroundColor: Colours.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),


                  Container(
                    child: Image.asset("assets/images/ambulancee.jpg"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
              
                  CustomFormField(
                    labeltxt: "Driver Name",
                    icons: Icon(Icons.person),
                    controller: drivername,
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
                    controller: drivernumber,
                    textinputtype: TextInputType.number,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                    icons: Icon(Icons.phone),
                    labeltxt: "Driver number",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  CustomFormField(
                    controller: vehicledetailsandlocation,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    maxline: 5,
                    labeltxt: "vehicle details and locations",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  _isRegistering
                      ? const Center(child: CircularProgressIndicator())
                      : SignUpOrSignInButton(
                          buttonName: 'submit',
                          onPress: () {
                            if (!_isRegistering) {
            
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                //aadd();
                              }
                            }
                          },
            
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
