
import 'package:donation/constant/colors.dart';
import 'package:donation/view/user/pagehome/nss_activities_page/Details.dart';
import 'package:flutter/material.dart';

class Client_NssActivities extends StatelessWidget {
  const Client_NssActivities({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(" Activities",
            style:
                TextStyle(color: Colours.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colours.red,
      ),
      body:  ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {

                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Card(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colours.red),
                            ),
                            child: InkWell(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Image.network(
                                 'image_url',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Nss_Details_clinet(
                                //       docId: activityData['docId'],
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * .05,
                            top: MediaQuery.of(context).size.width * .15,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Nss_Details_clinet(
                                      docId: 'docId',
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 255, 1, 1),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ));}}
        