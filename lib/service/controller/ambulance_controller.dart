import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmbulanceController extends GetxController{
 final formkey = GlobalKey<FormState>();
  final TextEditingController drivernamecontroller = TextEditingController();
  final TextEditingController drivernumbercontroller = TextEditingController();
  final TextEditingController vehicledetailscontroller = TextEditingController();
    var ambulance = [].obs;

 @override
  void onInit() {
    fetchambulance();
    super.onInit();
  }
void savedetails(){
  
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              add_ambulance(drivernamecontroller.text, drivernumbercontroller.text, vehicledetailscontroller.text);
                            }
                          
                           drivernamecontroller.clear();
    drivernumbercontroller.clear();
    vehicledetailscontroller.clear();
}



  Future<void> fetchambulance() async {
    try {
      QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('ambulance_service').get();
      ambulance.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching hospitals: ${e.toString()}");
    }
  }
   Future<bool> add_ambulance(
    String name,String phone,String address, 
  ) async {
    try {
    CollectionReference hospital = FirebaseFirestore.instance.collection('ambulance_service');
    DocumentReference docRef = hospital.doc(); 
    String docId = docRef.id; 

    await docRef.set({
      'docId': docId,
       'name': name,
      'phone': phone,
      'address': address,
    });
      fetchambulance();
    return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }


 Future<bool> delete_collection(
    String docid,

  ) async {
    try {
      await FirebaseFirestore.instance.collection('ambulance_service').
      doc(docid).delete();
           
      fetchambulance();

      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

}