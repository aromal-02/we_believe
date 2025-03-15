import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PainpalliativeController extends GetxController{
 final formkey = GlobalKey<FormState>();
  final TextEditingController palliativename = TextEditingController();
  final TextEditingController palliativenumber = TextEditingController();
  final TextEditingController detailscontroller = TextEditingController();
   var palliative = [].obs;


 @override
  void onInit() {
    fetchpalliative();
    super.onInit();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    palliativename.dispose();
    palliativenumber.dispose();
    detailscontroller.dispose();

  }

void savedetails(){
   
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              add_palliative(palliativename.text, palliativenumber.text, detailscontroller.text);
                            }
                          
                           palliativename.clear();
    palliativenumber.clear();
    detailscontroller.clear();
                          
}

  Future<void> fetchpalliative() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('painpalliative').get();
      palliative.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching painpalliative: ${e.toString()}");
    }
  }
   Future<bool> add_palliative(
    String name,String phone,String address, 
  ) async {
    try {
    CollectionReference palliative = FirebaseFirestore.instance.collection('painpalliative');
    DocumentReference docRef = palliative.doc(); 
    String docId = docRef.id; 

    await docRef.set({
      'docId': docId,
      'name': name,
      'phone': phone,
      'address': address,
    });
      fetchpalliative();
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
      await FirebaseFirestore.instance.collection('painpalliative').
      doc(docid).delete();
           fetchpalliative();

      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

}