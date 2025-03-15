import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class client_hospital extends StatelessWidget {
   client_hospital({super.key, });
final HospitalController hospitalController = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Hospitals", style: TextStyle(color: Colors.white)),
        backgroundColor: Colours.red,
       
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
