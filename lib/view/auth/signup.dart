import 'package:donation/constant/colors.dart';
import 'package:donation/controller/login_controller.dart';
import 'package:donation/view/user/home.dart';
import 'package:donation/widget/custom_button.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset("assets/images/logo2.png", fit: BoxFit.cover),
                ),
                Row(
                  children: [
                    Text(
                      "Welcome to ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colours.black),
                    ),
                    Text(
                      "We believe",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: Colours.red),
                    ),
                  ],
                ),
                Text(
                  "Create your new account",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colours.textLightBlack),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: [
                      CustomFormField(
                        labeltxt: "Enter your name",
                        onChanged: (value) => controller.name.value = value,
                      ),
                      if (controller.nameError.value.isNotEmpty)
                        Text(
                          controller.nameError.value,
                          style: TextStyle(color: Colours.red, fontSize: 12),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: [
                      CustomFormField(
                        labeltxt: "Enter your email",
                        onChanged: (value) => controller.email.value = value,
                      ),
                      if (controller.emailError.value.isNotEmpty)
                        Text(
                          controller.emailError.value,
                          style: TextStyle(color: Colours.red, fontSize: 12),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: [
                      CustomFormField(
                        labeltxt: "Enter your phone number",
                        onChanged: (value) => controller.phone.value = value,
                      ),
                      if (controller.phoneError.value.isNotEmpty)
                        Text(
                          controller.phoneError.value,
                          style: TextStyle(color: Colours.red, fontSize: 12),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Age, Blood, and DOB Row
                Obx(
                  () => Column(
                    children: [
                      Row(
                        children: [
                          // Age Field
                          Expanded(
                            child: Column(
                              children: [
                                CustomFormField(
                                  labeltxt: "Age",
                                  onChanged: (value) => controller.age.value = value,
                                ),
                                if (controller.ageError.value.isNotEmpty)
                                  Text(
                                    controller.ageError.value,
                                    style: TextStyle(color: Colours.red, fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10), // Spacing between fields
                          // Blood Group Field
                          Expanded(
                            child: Column(
                              children: [
                                CustomFormField(
                                  labeltxt: "Blood",
                                  onChanged: (value) => controller.bloodgroup.value = value,
                                ),
                                if (controller.bloodgroupError.value.isNotEmpty)
                                  Text(
                                    controller.bloodgroupError.value,
                                    style: TextStyle(color: Colours.red, fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10), // Spacing between fields
                          // DOB Field
                          Expanded(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null) {
                                      controller.dob.value = picked.toString();
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: CustomFormField(
                                      labeltxt: "DOB",
                                      controller: TextEditingController(
                                        text: controller.dob.value,
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.dobError.value.isNotEmpty)
                                  Text(
                                    controller.dobError.value,
                                    style: TextStyle(color: Colours.red, fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    CustomFormField(
                      labeltxt: "Enter your address",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
  () => Column(
    children: [
      CustomFormField(
        icons: controller.obscure.value
             ? Icon(Icons.visibility_off,color:  Colours.red,)
            : Icon(Icons.visibility,color: Colours.red),
        labeltxt: "Enter your password",
        ontap: () {
          controller.obscure.value = !controller.obscure.value; // Toggle visibility
        },
        obscureText: controller.obscure.value, // Pass the reactive value
        onChanged: (value) => controller.password.value = value,
      ),
      if (controller.passwordError.value.isNotEmpty)
        Text(
          controller.passwordError.value,
          style: TextStyle(color: Colours.red, fontSize: 12),
        ),
    ],
  ),
),
SizedBox(height: 20),
Obx(
  () => Column(
    children: [
      CustomFormField(
        icons: controller.obscure1.value
            ? Icon(Icons.visibility_off,color:  Colours.red,)
            : Icon(Icons.visibility,color: Colours.red),
        labeltxt: "Enter your confirm password",
        ontap: () {
          controller.obscure1.value = !controller.obscure1.value; // Toggle visibility
        },
        obscureText: controller.obscure1.value, 
        onChanged: (value) => controller.cnfrmpassword.value = value,
      ),
    ],
  ),
),
                SizedBox(height: 20),
                CustomElevatedBtn(
                  name: "Sign Up",
                  ontap: () {
                    if (controller.signupvalidateForm()) {
                                             Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserHome()));

                    } else {
                      print("Signup Failed");
                    }
                  },
                  backgroundColor: Colours.red,
                  textColor: Colours.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}