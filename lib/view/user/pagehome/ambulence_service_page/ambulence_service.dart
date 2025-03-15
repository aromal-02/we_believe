
import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/ambulance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ClientAmbulanceService extends StatelessWidget {
  
//   }

class ClientAmbulanceService extends StatelessWidget {
   ClientAmbulanceService({super.key});
 AmbulanceController ambulanceController=Get.put(AmbulanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Ambulance", style: TextStyle(color: Colors.white)),
        backgroundColor: Colours.red,
        
      ),
      body: Obx(() {
        if (ambulanceController.ambulance.isEmpty) {
          return Center(child: Text("No Ambulance Found"));
        }
        return RefreshIndicator(
          onRefresh: () async {
            await ambulanceController.fetchambulance();
          },
          child: ListView.builder(
            itemCount: ambulanceController.ambulance.length,
            itemBuilder: (context, index) {
              final ambulance = ambulanceController.ambulance[index];
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
                                    child:Text( ambulance['name'].isNotEmpty ? ambulance['name'][0].toUpperCase() : "", )
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
                                        
                                                ambulance['name'],
                                            style: TextStyle(
                                              fontSize:
                                                 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ), SizedBox(height: 8),
                                          Text(
                                              ambulance['address'], style: TextStyle(
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
                                                 ambulance['phone'], style: TextStyle(
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