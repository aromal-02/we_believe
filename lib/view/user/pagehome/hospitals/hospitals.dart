import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';

class client_hospital extends StatelessWidget {
  const client_hospital({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Hospitals",
            style: TextStyle(color: Colours.white),
          ),
          backgroundColor: Colours.red,
        
        ),
        body:  LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                 

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          //padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          // height: constraints.maxHeight * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colours.red,
                            ),
                          ),
                          child: InkWell(
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: Colors.red.shade400,
                                  radius: constraints.maxWidth * 0.08,
                                  child:Text("H")
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                      
                                              "Hospital Name",
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                            "Hospital Location"),
                                        //  SizedBox(height: 8),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                               
                                                
                                              },
                                              child: Text(
                                               'phone'),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.phone,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Delete"),
                                  content: const Text("Are You Sure Delete?"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                      
                                      },
                                      child: const Text("Yes"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ));
          
          }
        
}
