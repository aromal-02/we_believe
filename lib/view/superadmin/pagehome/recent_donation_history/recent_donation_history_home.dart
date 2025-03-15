// import 'package:donation/constant/colors.dart';
// import 'package:flutter/material.dart';

// class Super_RecentDonationHistoryHome extends StatefulWidget {
//   const Super_RecentDonationHistoryHome({super.key});

//   @override
//   State<Super_RecentDonationHistoryHome> createState() =>
//       _Super_RecentDonationHistoryHomeState();
// }

// class _Super_RecentDonationHistoryHomeState
//     extends State<Super_RecentDonationHistoryHome> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Center(
//           child: Text(
//             "Donation History",
//             style: TextStyle(color: Colours.white),
//           ),
//         ),
//         backgroundColor: Colours.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30.0, top: 20),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: SizedBox(
//             width: double.infinity,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: List.generate(5, (index) {
//                   return Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         children: [
//                           const SizedBox(height: 20),
//                           Row(
//                             children: [
//                               Text(
//                                 "akshay",
//                                 style: const TextStyle(fontSize: 18),
//                               ),
//                               const SizedBox(width: 50),
//                               Text(
//                                 "A+",
//                                 style: const TextStyle(
//                                     fontSize: 18, color: Colors.red),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Column(
//                             children: List.generate(2, (donorIndex) {
//                               return Row(
//                                 children: [
//                                   const SizedBox(width: 50),
//                                   Column(
//                                     children: [
//                                       const SizedBox(height: 20),
//                                       Text(
//                                         "Rahul",
//                                         style: const TextStyle(fontSize: 18),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(width: 50),
//                                   Column(
//                                     children: [
//                                       const SizedBox(height: 20),
//                                       Text(
//                                         '12/4/2020',
//                                         style: const TextStyle(fontSize: 18),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/constant/colors.dart';
import 'package:donation/constant/style.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/service/controller/donar_controller.dart';
import 'package:donation/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import 'package:http/http.dart' as http;

// import 'dart:developer';

// import 'package:donation/constant/colors.dart';
// import 'package:blood_donation/constants/firebase_const.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

class Super_RecentDonationHistoryHome extends StatefulWidget {
  const Super_RecentDonationHistoryHome({
    super.key,
   
    
  });
 
 

  @override
  State<Super_RecentDonationHistoryHome> createState() => _Super_RecentDonationHistoryHomeState();
}

class _Super_RecentDonationHistoryHomeState extends State<Super_RecentDonationHistoryHome> {
  bool isButtonVisible = false;
DonarController controller=Get.put(DonarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Donation History",
              style: TextStyle(color: Colours.white),
            ),
          ),
          backgroundColor: Colours.red,
        ),
body:  FutureBuilder(
  future: controller.DonarHistory(), 
  builder: (context,snapshot){
if(snapshot.connectionState==ConnectionState.waiting){
  return Center(child: CircularProgressIndicator(color: Colours.red,));
  
}else if(snapshot.hasError){
CustomToast().show("Error");
return Center(child: Text("No History"));
}else{
final donors = snapshot.data!;
if(donors.isEmpty){return Center(child: Text("History empty "),);}else{

            return ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final donor = donors[index];
                 Timestamp timestamp = donor['donationDate'];
DateTime dateTime = timestamp.toDate();
String formattedDate = DateFormat('d MMMM yyyy').format(dateTime);

                  return Container(
                            margin: const EdgeInsets.all(10),
                            
                            decoration: BoxDecoration(
                              border: Border.all(color: Colours.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all( 10.0),
                              child: Row(
                                children: [
                                     CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.09,
                                         child: Center(child: Text(donor['name'].isNotEmpty ? donor['name'][0].toUpperCase() : "",),),
                                        ),
                                     
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                children: [
                                   SizedBox(width: MediaQuery.of(context).size.width*0.03),  
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                                                      'Donar:${donor['name']}',
                                                                      style: const TextStyle(fontSize: 14),
                                                                    ),
                                                                     Text(
                                        "Receiver:${donor['donated_to']}",
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                               SizedBox(width: MediaQuery.of(context).size.width*0.05),
                              Text(
                               donor['group'],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.red),
                              ),
                                  
                                   SizedBox(width:MediaQuery.of(context).size.width*0.05),
                                                                       Text(
                                    formattedDate,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                },
              );}
      }})
                      );
              }
            
  }
