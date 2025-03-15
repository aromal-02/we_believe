import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/model/ambulancemodel.dart';
import 'package:donation/model/hospitalmodel.dart';
import 'package:donation/model/painpalliative.dart';
import 'package:donation/model/donar_model.dart';
import 'package:donation/model/requestmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  static Future<bool> add_bloodrequest(
    String name,
    String phone,
    String group,
    String address,
    String age,
    String gender,
    String unit,
    date,
  ) async {
    try {
      CollectionReference request = FirebaseFirestore.instance.collection(
        'blood_request',
      );
      DocumentReference requestRef = request.doc();
String? uid = await getValue("uid");
      String docId = requestRef.id;
      await requestRef.set({
        'name': name,
        'phone': phone,
        'address': address,
        'age': age,
        'group': group,
        'date': date,
        'gender': gender,
        'unit': unit,
        'docId': docId,
        'uid':uid
      });
      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

  static Future<bool> add_user(
    String name,
    String email,
    String phone,
    String address,
    String age,
    String blood,
    String dob,
    String password,
  ) async {
    try {
      CollectionReference request = FirebaseFirestore.instance.collection(
        'user',
      );
      DocumentReference requestRef = request.doc();

      String docId = requestRef.id;

      await requestRef.set({
        'name': name,
        'email': email,
        'number': phone,
        'age': age,
        'blood': blood,
        'dob': dob,
        'address': address,
        'password': password,
        'docId': docId,
      });
        FirebaseService.storeValue('uid', docId);
String? username = await FirebaseService.getValue("uid");          
  log('signup=============================$username');
      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

  static Future<List<RequestModel>> fetch_request() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('blood_request').get();

      return querySnapshot.docs.map((doc) {
        return RequestModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching donors: ${e.toString()}");
      return [];
    }
  }
static Future<List<Map<String, dynamic>>> own_request(String equal) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('blood_request')
        .where('uid', isEqualTo: equal)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  } catch (e) {
    print("Error fetching donors: ${e.toString()}");
    return [];
  }
}
  static Future<List<DonarMOdel>> fetch_history() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection('donar')
              .where('donated', isEqualTo: true)
              .get();

      return querySnapshot.docs.map((doc) {
        return DonarMOdel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching donors: ${e.toString()}");
      return [];
    }
  }

  static Future<List<PainPalliative>> fetch_painpalliative() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('painpalliative').get();

      return querySnapshot.docs.map((doc) {
        return PainPalliative.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching donors: ${e.toString()}");
      return [];
    }
  }

  //update code

  static Future<bool> update_donar(String docid, String receiver) async {
    try {
      await FirebaseFirestore.instance.collection('donar').doc(docid).update({
        'donated': true,
        "donated_to": receiver,
        'donationDate': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }
static Future<bool> update_request(
  String docid,
  String name,
  String phone,
  String age,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('blood_request')
        .doc(docid)
        .update({
          'donations': FieldValue.arrayUnion([
            {'name': name, 'phone': phone, 'age': age}
          ])
        });

    return true;
  } catch (e) {
    print("Error updating donation list: $e");
    return false;
  }
}

  //delete code

  static Future<bool> delete_collection(String docid, String collection) async {
    try {
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(docid)
          .delete();

      return true;
    } catch (e) {
      print("Error adding bill details: $e");
      return false;
    }
  }

  static Future<void> storeValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
