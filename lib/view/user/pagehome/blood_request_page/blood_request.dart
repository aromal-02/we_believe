
import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/bloodrequest_controller.dart';
import 'package:donation/widget/custom_signupbutton.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:donation/widget/textformfeildwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BloodRequest extends StatefulWidget {
  const BloodRequest({super.key});

  @override
  State<BloodRequest> createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
  
  String? selectedgroup;
  late String dateSelected;
  final bool _isRegistering = false;
  bool ispick = false;
  bool checkValue = false;
  final List<String> gender = ["Male", "Female", "Other"];
  final List<String> bloodgroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "RH+",
    "AB-",
    "RH-",
  ];
BloodController controller= Get.put(BloodController());
  String? selectedgender;
  Future _selectdate() async {
    ispick = true;
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        dateSelected = picked.toString().split(" ")[0];
      });
    }
    debugPrint(dateSelected);
    return dateSelected;
  }

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    dateSelected = currentDate.toLocal().toIso8601String().split('T')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "BloodRequest",
          style: TextStyle(color: Colours.white),
        ),
        backgroundColor: Colours.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:controller. formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .5,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv9uDdmjrFo6WmHa4Sel4yVIjUIw75aUvNPA&usqp=CAU'),
                  ),
                  TextFormFieldWidget(
                    label: "Patient Name",
                    icon: const Icon(Icons.person),
                    controller:controller. nameController,
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
                  CustomFormField(
                    controller: controller.phoneController,
                    textinputtype: TextInputType.number,
                    maxlength: 10,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                    icons: Icon(Icons.phone),
                    labeltxt: "Contact number",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomFormField(
                    labeltxt: "Hospital address",
                    maxline: 3,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormFieldWidget(
                            keyboardType: TextInputType.number,
                            label: "Age",
                            maxAgeLength: 3,
                            icon: const Icon(Icons.numbers),
                            controller:controller. agecontroller,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
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
                                color: Colours.red,
                              ),
                              border: InputBorder.none,
                              hintText: "Blood Type",
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            items: bloodgroups
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
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
                        const SizedBox(
                          width: 5,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(140, 64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: Colours.black,
                            side: const BorderSide(
                              color: Colours.lightRed,
                            ),
                          ),
                          onPressed: () {
                            _selectdate();
                          },
                          child: ispick
                              ? Text(dateSelected)
                              : const Text("Choose Date"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
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
                                color: Colours.red,
                              ),
                              border: InputBorder.none,
                              hintText: "Gender",
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            items: gender
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
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
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormFieldWidget(
                              keyboardType: TextInputType.number,
                              label: "Blood Unit",
                              maxAgeLength: 2,
                              icon: const Icon(Icons.numbers),
                              controller:controller. bloodunitcontroller,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "required";
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  
                  _isRegistering
                      ? CircularProgressIndicator()
                      : SignUpOrSignInButton(
                          buttonName: "Submit",
                          onPress: () {
controller.savedetails(selectedgroup, selectedgender, dateSelected);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Shared'),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    )
    ));Navigator.pop(context);
                          },
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
