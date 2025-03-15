import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalController extends GetxController{
 final formkey = GlobalKey<FormState>();
  final TextEditingController hospitalnamecontroller = TextEditingController();
  final TextEditingController hospitalnumbercontroller = TextEditingController();
  final TextEditingController detailscontroller = TextEditingController();
    var hospitals = [].obs;


 @override
  void onInit() {
    fetchHospitals();
    super.onInit();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    hospitalnamecontroller.dispose();
    hospitalnumbercontroller.dispose();
    detailscontroller.dispose();

  }

void savedetails(){
  
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              add_hosptals(hospitalnamecontroller.text, hospitalnumbercontroller.text, detailscontroller.text);
                            }
                          
                           hospitalnamecontroller.clear();
    hospitalnumbercontroller.clear();
    detailscontroller.clear();
                          
}

  Future<void> fetchHospitals() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('hospital').get();
      hospitals.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching hospitals: ${e.toString()}");
    }
  }
   Future<bool> add_hosptals(
    String name,String phone,String address, 
  ) async {
    try {
    CollectionReference hospital = FirebaseFirestore.instance.collection('hospital');
    DocumentReference docRef = hospital.doc(); 
    String docId = docRef.id; 

    await docRef.set({
      'docId': docId,
      'name': name,
      'phone': phone,
      'address': address,
    });
      fetchHospitals();
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
      await FirebaseFirestore.instance.collection('hospital').
      doc(docid).delete();
           fetchHospitals();

      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

 
}