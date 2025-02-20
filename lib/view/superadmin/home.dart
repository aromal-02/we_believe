import 'package:donation/view/superadmin/profile.dart';
import 'package:donation/widget/optiontile.dart';
import 'package:donation/widget/superadmin_tilelist.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
                    builder: (context) => const AdminProfilePage(),
                  ));
                },
                child: Row(
                  children: [
                    
                     CircleAvatar(
                       
                      ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Admin Home"),
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
                      itemCount: admintileList.length,
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
                                    builder: (context) => SuperadminoptionScreen[index],
                                  )),
                                  child: OptionsTile(
                                    image: admintileList[index].image,
                                    name: admintileList[index].name,
                                  ),
                                );
                              
                            }
                          
                        
                    ),
                   
                  ],
                ),)),);
        }
      }
   
