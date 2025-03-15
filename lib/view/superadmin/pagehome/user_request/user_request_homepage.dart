
import 'package:donation/constant/colors.dart';
import 'package:donation/constant/style.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/view/superadmin/pagehome/user_request/user_accept_and_decline.dart';
import 'package:donation/widget/custom_toast.dart';
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
      body:  FutureBuilder(future: FirebaseService.fetch_request(), 
      builder: (context,snapshot){
if(snapshot.connectionState==ConnectionState.waiting){
  return Center(child: CircularProgressIndicator(color: Colours.red,));
}else if(snapshot.hasError){
CustomToast().show("Error");
return Center(child: Text("Error"));
}else{
final donors = snapshot.data!;
if(donors.isEmpty){return Center(child: Text("Request empty "),);}else{

           
            return ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final donor = donors[index];
                 
                  return Stack(
                    children: [
                     
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
                                  donor.name,
                                  style: AppTextStyles.title
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
          "Address: ${donor.address}", 
          style: AppTextStyles.tiledetails,
        ),
                                  Text(
                                    "Ph : ${donor.phone}",
                                            style: AppTextStyles.tiledetails,

                                  ),
                                  Text(
                                    "Group : ${donor.group}",
                                            style: AppTextStyles.tiledetails,

                                  ),
                                  Text(
                                    "Age : ${donor.age}",
                                             style: AppTextStyles.tiledetails,

                                  ),
                                  Text(
                                    "Gender : ${donor.gender}",
                                           style: AppTextStyles.tiledetails,

                                  ),
                                  Text(
                                    "Blood Unit : ${donor.unit}",
                                              style: AppTextStyles.tiledetails,

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
                                                bloodgroup: "O+", reqId: donor.docId,
                                                reciever:  donor.name,
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
      }}})
              
              
        
            
          );
        }
      
    
  }
