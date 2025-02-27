// import 'package:blood_donation/view/superadmin/screens/pagehome/ambulence_service_page/add_ambulance_service.dart';
// import 'package:blood_donation/view/superadmin/screens/pagehome/ambulence_service_page/edit_ambulance_service.dart';
// import 'package:flutter/material.dart';
//
// import 'package:donation/constant/colors.dart';
//
//
// class AmbulenceService extends StatelessWidget {
//   const AmbulenceService({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//       automaticallyImplyLeading: true,
//       centerTitle: true,
//       title:  const Text("Ambulance Service",style: TextStyle(color: Colours.white),),
//       backgroundColor: Colours.red,
//         actions: [
//           IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAmbulanceService()));
//           }, icon:Icon(Icons.add,color:Colours.white,))
//         ],
//     ),
//       body:
//           ListView.builder(
//             itemCount:3,
//             itemBuilder: (context,index){
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAmbulanceService()));},
//                 child: Container(
//                 height:MediaQuery.of(context).size.height*.16,
//                 width: MediaQuery.of(context).size.width*.9,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   border:Border.all(
//                     color:Colours.lightRed,
//                   ),
//                 ),
//                   child:Row(
//                     children: [
//                       SizedBox(width:MediaQuery.of(context).size.width*.01,),
//                       CircleAvatar(
//
//                         backgroundImage:NetworkImage("https://i.pinimg.com/564x/b2/54/ea/b254ea1ec256b93c61aecb2aca62e277.jpg"),
//                         radius:40,
//
//                       ),
//                       SizedBox(width:MediaQuery.of(context).size.width*.01,),
//                       Column(
//                         mainAxisAlignment:MainAxisAlignment.center,
//                         crossAxisAlignment:CrossAxisAlignment.start,
//                         children: [
//                           Text("service name",style:TextStyle(fontSize:21,),),
//                           Text("8086796522",style:TextStyle(fontSize:16,),),
//                           Text("Location",style:TextStyle(fontSize:16,),),
//                         ],
//                       ),
//                     ],
//                   ),
//         ),
//               ),
//             );}
//           ),
//
//     );
//   }
// }

import 'package:donation/constant/colors.dart';
import 'package:donation/view/superadmin/pagehome/ambulence_service_page/add_ambulance_service.dart';
import 'package:flutter/material.dart';

class AmbulanceService extends StatelessWidget {
  const AmbulanceService({super.key});

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAmbulanceService()),
              );
            },
            icon: Icon(Icons.add, color: Colours.white),
          )
        ],
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
