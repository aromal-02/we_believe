import 'package:donation/constant/colors.dart';
import 'package:donation/controller/login_controller.dart';
import 'package:donation/view/auth/signup.dart';
import 'package:donation/view/superadmin/home.dart' show AdminHome;
import 'package:donation/view/user/home.dart';
import 'package:donation/widget/custom_button.dart';
import 'package:donation/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset("assets/images/logo2.png", fit: BoxFit.cover),
                ),
                Row(
                  children: [
                    Text(
                      "Welcome back to ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colours.black),
                    ),
                    Text(
                      "We believe",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: Colours.red),
                    )
                  ],
                ),
                Text(
                  "Enter your email and password to login",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colours.textLightBlack),
                ),
                SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    height: 55,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colours.lightRed)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colours.lightRed)),
                      ),
                      value: controller.selectedRole.value,
                      items: [
                        DropdownMenuItem(value: "User", child: Text("User")),
                        DropdownMenuItem(value: "Admin", child: Text("Admin")),
                      ],
                      onChanged: (value) => controller.selectedRole.value = value!,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: [
                      CustomFormField(
                        labeltxt: "Email",
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
                          icons: controller.obscure1.value
             ? Icon(Icons.visibility_off,color:  Colours.red,)
            : Icon(Icons.visibility,color: Colours.red),
        labeltxt: "Password",
        ontap: () {
          controller.obscure1.value = !controller.obscure1.value; // Toggle visibility
        },
        obscureText: controller.obscure1.value, // Pass 
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
                CustomElevatedBtn(
                  name: "Login",
                  ontap: () {
                    if (controller.loginvalidateForm()) {
                      if(controller.selectedRole.value == "User"){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  UserHome()));

                      }else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  AdminHome()));
                      }
                      // 
                    } else {
                      print("Login Failed");
                    }


                  },
                  backgroundColor:  Colours.red,
                  textColor: Colours.white,
                ),
                SizedBox(height: 18),
                Center(child: Text("Don’t have an account?")),
                SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colours.red),
                    minimumSize: Size(double.infinity, 40),
                  ),
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Signup()));

                  },
                  child: Text("Sign up", style: TextStyle(color: Colours.black, fontSize: 15)),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
