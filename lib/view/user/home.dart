import 'package:donation/view/user/profile.dart';
import 'package:donation/widget/user_tileslist.dart';
import 'package:flutter/material.dart';

import '../../widget/optiontile.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor:  Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: GestureDetector(
                onTap: () {
Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ));
                },
                child: Row(
                  children: [
                    
                     CircleAvatar(
                       
                      ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("User Name"),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .020,
                vertical: MediaQuery.of(context).size.width * .020,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tileList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                              return 
                                InkWell(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => optionScreen[index],
                                  )),
                                  child: OptionsTile(
                                    image: tileList[index].image,
                                    name: tileList[index].name,
                                  ),
                                );
                              
                            }
                          
                        
                    ),
                   
                  ],
                ),)),);
        }
      }
   
