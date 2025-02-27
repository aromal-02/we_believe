import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// import 'dart:developer';

// import 'package:donation/constant/colors.dart';
// import 'package:blood_donation/constants/firebase_const.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

class UserAcceptandDecline extends StatefulWidget {
  const UserAcceptandDecline({
    super.key,
    required this.bloodgroup,
    required this.bloodid,
    required this.docId,
    required this.unit,
  });
  final String bloodgroup;
  final String bloodid;
  final String docId;
  final String unit;

  @override
  State<UserAcceptandDecline> createState() => _UserAcceptandDeclineState();
}

class _UserAcceptandDeclineState extends State<UserAcceptandDecline> {
  bool isButtonVisible = false;


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
        body: 
             ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                
                        final name = 'name';
                        final address = 'adress';
                        final phone = 'phone';
                        final blood = "blood";
                        final gender = 'gender';
                        final age = 'age';
                       

                        return SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            // width: MediaQuery.of(context).size.width,
                            // height: constraints.maxHeight * 0.335,
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
                                         child: Center(child: Text("N"),),
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
                                                name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Address :$address",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Ph : $phone",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Group : $blood",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Age : $age",
                                                style: const TextStyle(),
                                              ),
                                              Text(
                                                "Gender : $gender",
                                                style: const TextStyle(),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              InkWell(
                                                onTap: () {
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
                          ),
                        );
                     
                    }
             )
                      );
              }
            
  }
