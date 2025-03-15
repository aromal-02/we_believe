import 'package:donation/service/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodController extends GetxController{
 final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final agecontroller = TextEditingController();
  final bloodunitcontroller = TextEditingController();
var isLoading = false.obs;

void savedetails(selectedgroup,selectedgender,date) async {
  try {
    if (formkey.currentState!.validate()) {
      isLoading.value = true;

      await FirebaseService.add_bloodrequest(nameController.text, phoneController.text, selectedgroup, 
      addressController.text,agecontroller.text, selectedgender,bloodunitcontroller.text, date);

      nameController.clear();
   
      phoneController.clear();
      addressController.clear();
      
      agecontroller.clear();
     

      Get.snackbar("Success",'',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to register donor: $e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } finally {
    isLoading.value = false;
  }
}

}

