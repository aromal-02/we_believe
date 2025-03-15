import 'dart:developer';

import 'package:donation/constant/colors.dart';
import 'package:donation/constant/style.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/service/controller/donar_controller.dart';
import 'package:donation/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAcceptandDecline extends StatefulWidget {
  const UserAcceptandDecline({
    super.key,
    required this.bloodgroup, required this.reqId, required this.reciever,
    
  });
  final String bloodgroup;
  final String reqId;
  final String reciever;
 

  @override
  State<UserAcceptandDecline> createState() => _UserAcceptandDeclineState();
}

class _UserAcceptandDeclineState extends State<UserAcceptandDecline> {
  bool isButtonVisible = false;
DonarController controller=Get.put(DonarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Share Doner",
              style: TextStyle(color: Colours.white),
            ),
          ),
          backgroundColor: Colours.red,
        ),
body:  FutureBuilder(future: controller.fetchSharedDonar(widget.bloodgroup), 
      builder: (context,snapshot){
if(snapshot.connectionState==ConnectionState.waiting){
  return Center(child: CircularProgressIndicator(color: Colours.red,));
}else if(snapshot.hasError){
CustomToast().show("Error");
return Center(child: Text("Error"));
}else{
final donors = snapshot.data!;

            return ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final donor = donors[index];
                if(donor.isEmpty){return Center(child: Text("donar empty "),);}else{

            
                  return Container(
                            margin: const EdgeInsets.all(10),
                            
                            decoration: BoxDecoration(
                              border: Border.all(color: Colours.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                     CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                         child: Center(child: Text(donor['name'].isNotEmpty ? donor['name'][0].toUpperCase() : "", ),),
                                        ),
                                     
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      // const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                donor['name'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Address :${donor['address']}",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Ph : ${donor['phone']}",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Group : ${donor['group']}",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Age : ${donor['age']}",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Gender : ${donor['gender']}",
                                                style: const TextStyle(),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              InkWell(
                                                onTap: () {

                                                  FirebaseService.update_donar(donor['docId'],widget.reciever);
                                                  FirebaseService.update_request(widget.reqId, donor['name'], donor['phone'], donor['age']);
                                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Text('Shared'),
                                                  behavior: SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(24),
                                                  )
                                                  ));
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                                  color:Colours.red,
),
                                                  child: Center(
                                                    child: Text(
                                                     "share",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                }
});
      }})
                      );
              }
            
  }
