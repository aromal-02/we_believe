
import 'package:donation/constant/colors.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/service/controller/hospital_controller.dart';
import 'package:donation/view/superadmin/pagehome/hospitals/add_hospital_details.dart';
import 'package:donation/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Super_Hospitals extends StatelessWidget {
  final HospitalController hospitalController = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Hospitals", style: TextStyle(color: Colors.white)),
        backgroundColor: Colours.red,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddHospitalDetails()));
              hospitalController.fetchHospitals(); 
            },
            icon: Icon(Icons.add, color: Colours.white),
          )
        ],
      ),
      body: Obx(() {
        if (hospitalController.hospitals.isEmpty) {
          return Center(child: Text("No Hospitals Found"));
        }
        return RefreshIndicator(
          onRefresh: () async {
            await hospitalController.fetchHospitals();
          },
          child: ListView.builder(
            itemCount: hospitalController.hospitals.length,
            itemBuilder: (context, index) {
              final hospital = hospitalController.hospitals[index];
                               return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            //padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            // height: constraints.maxHeight * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colours.red,
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius:35,
                                    child:Text( hospital['name'].isNotEmpty ? hospital['name'][0].toUpperCase() : "", )
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                        
                                                hospital['name'],
                                            style: TextStyle(
                                              fontSize:
                                                 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ), SizedBox(height: 8),
                                          Text(
                                              hospital['address'], style: TextStyle(
                                              fontSize:
                                                 16,
                                              fontWeight: FontWeight.w500,
                                            ),),
                                          
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                 
                                                  
                                                },
                                                child: Text(
                                                 hospital['phone'], style: TextStyle(
                                              fontSize:
                                                 16,
                                              fontWeight: FontWeight.w500,
                                            ),),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.phone,
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text("Are You Sure Delete?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: ()async {
                                        hospitalController.delete_collection(hospital['docId']);
                                       Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            );
              }));
  }
  }
