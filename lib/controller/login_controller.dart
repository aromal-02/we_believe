import 'package:get/get.dart';

class LoginController extends GetxController {
  var selectedRole = "User".obs;
  var email = "".obs;
  var password = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
var cnfrmpassword="".obs;
var name="".obs;
var nameError="".obs;
var phone="".obs;
var phoneError="".obs;
var age="".obs;
var ageError="".obs;
var bloodgroup="".obs;
var bloodgroupError="".obs;
var dob = "".obs; 
var dobError = "".obs;

var obscure = true.obs;
  var obscure1 = true.obs;

  bool loginvalidateForm() {
    emailError.value = email.value.isEmpty ? "Email is required" : "";
    passwordError.value = password.value.isEmpty ? "Password is required" : "";
    if( emailError.value.isEmpty && passwordError.value.isEmpty){
      return true;
    }return false;
  }
  
bool signupvalidateForm() {
  // Reset all error messages
  nameError.value = name.value.isEmpty ? "Enter your name" : "";
  emailError.value = email.value.isEmpty ? "Enter your email" : "";
  phoneError.value = phone.value.isEmpty ? "Enter your phone number" : "";
  ageError.value = age.value.isEmpty ? "Age is required" : "";
  bloodgroupError.value = bloodgroup.value.isEmpty ? "Blood group is required" : "";
  dobError.value = dob.value.isEmpty ? "DOB is required" : "";
  passwordError.value = password.value.isEmpty ? "Enter your password" : "";

  if (password.value != cnfrmpassword.value) {
    passwordError.value = "Password does not match";
  }

  // Check if any error message is not empty
  if (nameError.value.isNotEmpty ||
      emailError.value.isNotEmpty ||
      phoneError.value.isNotEmpty ||
      ageError.value.isNotEmpty ||
      bloodgroupError.value.isNotEmpty ||
      dobError.value.isNotEmpty ||
      passwordError.value.isNotEmpty) {
    return false; 
  }

  return true; 
}
}
