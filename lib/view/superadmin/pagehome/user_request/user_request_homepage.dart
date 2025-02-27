
import 'package:donation/constant/colors.dart';
import 'package:donation/view/superadmin/pagehome/user_request/user_accept_and_decline.dart';
import 'package:flutter/material.dart';


class UserRequestHome extends StatelessWidget {
  const UserRequestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text(
            "User Requests",
            style: TextStyle(color: Colours.white),
          ),
        ),
        backgroundColor: Colours.red,
      ),
      body:  LayoutBuilder(  
            builder: (context, constraints) {
              return ListView.builder(
                itemCount:3,
                itemBuilder: (context, index) {
                  final name ='name' ;
                  final address = 'address' ;
                  final phone = 'phone' ;
                  final blood = 'blood' ;
                  final gender = 'gender' ;
                  final id = 'uid' ;
                  final age = 'age' ;
                  final Unit = 'bloodUint' ;

                  return Stack(
                    children: [
                      // Visibility(
                      //   visible: 'emergency' == true,
                      //   child: const Positioned(
                      //     right: 10,
                      //     top: 10,
                      //     child: CornerBanner(
                      //       bannerPosition: CornerBannerPosition.topRight,
                      //       bannerColor: Colors.red,
                      //       child: Text(
                      //         'Urgent',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colours.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    // fontSize: constraints.maxWidth * .050,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address :$address",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                    // overflow: TextOverflow.fade,
                                  ),
                                  Text(
                                    "Ph : $phone",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  Text(
                                    "Group : $blood",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  Text(
                                    "Age : $age",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  Text(
                                    "Gender : $gender",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  Text(
                                    "Blood Unit : $Unit",
                                    // style: TextStyle(
                                    //   fontSize: constraints.maxWidth * .040,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Colors.red),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserAcceptandDecline(
                                                bloodgroup: blood,
                                                bloodid: id,
                                                docId: "document.id",
                                                unit:Unit,
                                                

                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Doners",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ));
        }
      
    
  }
