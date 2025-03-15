

import 'package:donation/constant/colors.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/view/auth/login.dart';
import 'package:donation/view/superadmin/profile/about.dart';
import 'package:donation/view/superadmin/profile/privacypolicy.dart';
import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key, });



  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                  
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      
                        CircleAvatar(
                        child: Text("A",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                          radius: 50,
                        ),
                       
                     
                      Text(
                        capitalizeName(
                          "Admin",
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 18
                        ),
                      ),
                      Text(
                        'Admin@gmail.com',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '98645xxxxx',
                          style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                          },
                          leading: const Icon(
                            Icons.privacy_tip_outlined,//
                            color: Colours.red,
                          ),
                          title: const Text("Privacy Policy"),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));

                          },
                          leading: const Icon(
                            Icons.info_outline,
                            color: Colours.red,
                          ),
                          title: const Text("About"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                                FirebaseService.removeValue('uid');

                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          title: const Text("Logout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

  String capitalizeName(String? name) {
    if (name != null && name.isNotEmpty) {
      return name[0].toUpperCase() + name.substring(1);
    } else {
      return 'User';
    }
  }
