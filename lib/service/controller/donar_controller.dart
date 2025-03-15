import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/model/donar_model.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DonarController extends GetxController {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var weightController = TextEditingController();
  var agecontroller = TextEditingController();
  var selectedgroup = RxnString();
  var selectedgender = RxnString();

  var isLoading = false.obs;
  var donorsList = <DonarMOdel>[].obs;  // Store all donors
  var filteredDonors = <DonarMOdel>[].obs; // Store filtered donors
  var searchQuery = ''.obs; // Observable for search query

  @override
  void onInit() {
    fetch_donar();
    super.onInit();
  }
void savedetails() async {
  try {
    if (formkey.currentState!.validate()) {
      isLoading.value = true;

      await add_donar(
        nameController.text,
        phoneController.text,
        emailController.text,
        addressController.text,
        selectedgroup.value ?? '',
        selectedgender.value ?? '',
        weightController.text,
        agecontroller.text,
      );

      nameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
      weightController.clear();
      agecontroller.clear();
      selectedgroup.value = null;
      selectedgender.value = null;

      Get.snackbar("Success", "Donor registered successfully!",
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
  Future<void> fetch_donar() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('donar').get();

      donorsList.value = querySnapshot.docs.map((doc) {
        return DonarMOdel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      filteredDonors.assignAll(donorsList); // Initially, all donors are displayed
    } catch (e) {
      print("Error fetching donors: ${e.toString()}");
    }
  }

  void filterDonors(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDonors.assignAll(donorsList);
    } else {
      filteredDonors.assignAll(
        donorsList.where((donor) => donor.group.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
  
 Future<List<Map<String, dynamic>>> fetchSharedDonar(String equal) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('donar')
        .where('group', isEqualTo: equal)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  } catch (e) {
    print("Error fetching donors: ${e.toString()}");
    return [];
  }
}

  static Future<bool> add_donar(
    String name,    String phone, String email, String address, String group, String gender, String weight,String age

  ) async {
    try {
     CollectionReference donar= FirebaseFirestore.instance.collection('donar');
     DocumentReference donarRef=donar.doc();
     
String docId=donarRef.id;
await donarRef.set({
        'name': name,
        'phone':phone,
        'email':email,
        'address':address,
        'group':group,
        'gender':gender,
        'weight':weight,
        'age':age,
        'donated':false,
        'docId':docId


      });
      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }
   
 Future<List<Map<String, dynamic>>> DonarHistory() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('donar')
        .where('donated', isEqualTo: true)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  } catch (e) {
    print("Error fetching donors: ${e.toString()}");
    return [];
  }
}


}
