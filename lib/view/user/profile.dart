

import 'package:donation/constant/colors.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/view/auth/login.dart';
import 'package:donation/view/user/pagehome/profile/about.dart';
import 'package:donation/view/user/pagehome/profile/privacy.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.name, required this.email, required this.phone});
  final String name;
  final String email;
  final String phone;

  
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
                radius: 50,
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : "",
                  style: TextStyle(fontSize: 40),
                ),
              ),
                       
                     
                      Text(
                        capitalizeName(
                          name,
                        ),
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        email,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                      ),
                      Text(
                        phone,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
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
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'admin@gmail.com',
                    );
                    if (await canLaunch(emailLaunchUri.toString())) {
                      await launch(emailLaunchUri.toString());
                    } else {
                      throw 'Could not launch $emailLaunchUri';
                    }
                  },
                  leading: const Icon(
                    Icons.message,
                    color: Colours.red,
                  ),
                  title: const Text("Help&Feedback"),
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
                            Navigator.pop(context);
                            FirebaseService.removeValue('uid');
                             FirebaseService.removeValue('uname');
                            FirebaseService.removeValue('uemail');
                            FirebaseService.removeValue('unumber');

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
