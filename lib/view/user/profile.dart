

import 'package:donation/constant/colors.dart';
import 'package:donation/view/user/home.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  
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
                        ),
                       
                     
                      Text(
                        capitalizeName(
                          "User",
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'email',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'phone',
                          style: const TextStyle(fontWeight: FontWeight.w500),
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
                          
                          },
                          leading: const Icon(
                            Icons.share,
                            color: Colours.red,
                          ),
                          title: const Text("invite friends"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            
                          },
                          leading: const Icon(
                            Icons.privacy_tip_outlined,
                            color: Colours.red,
                          ),
                          title: const Text("Privacy Policy"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: ()  {
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserHome()));
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
