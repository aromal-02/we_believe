
import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';

class ClientAmbulanceService extends StatelessWidget {
  List<Map<String,dynamic>>ambulanceData=[
    {
      'name': 'Ambulance Service 1',
      'location': 'Location 1',
      'image_url': 'https://www.google.com',
      'number': '1234567890',
    },
    {
      'name': 'Ambulance Service 2',
      'location': 'Location 2',
      'image_url': 'https://www.google.com',
      'number': '1234567890',
    },
    {
      'name': 'Ambulance Service 3',
      'location': 'Location 3',
      'image_url': 'https://www.google.com',
      'number': '123456789  ',},
  ];

  ClientAmbulanceService({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Ambulance Service",
          style: TextStyle(color: Colours.white),
        ),
        backgroundColor: Colours.red,
        
      ),
      body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Delete"),
                        content: const Text("Are You Sure Delete?"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              
                              },
                              child: const Text("Yes")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"))
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .16,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colours.lightRed,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * .01),
                        CircleAvatar(
                        radius: 40,
                        child: Text("S"),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * .01),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Service Name",
                              style: TextStyle(fontSize: 21),
                            ),GestureDetector(
                              onTap: () {

                               
                              },
                              child: Text("number"),
                            ),
                            // Text(
                            //   serviceData['number'] ?? "Phone Number",
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            Text(
                          "Location",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
    );
                
              }
            }
        

