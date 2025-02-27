import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';


class PainAndPalliative extends StatelessWidget {
  const PainAndPalliative({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "PainAndPalliative",
          style: TextStyle(color: Colours.white),
        ),
        backgroundColor: Colours.red,
        
      ),
      body: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  itemCount:5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  child: const Text("Yes"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          height: constraints.maxHeight * 0.16,
                          width: constraints.maxWidth * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colours.lightRed,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * 0.09,
                              ),
                              CircleAvatar(
                                radius: constraints.maxWidth * 0.1,
                                child: Center(child: Text("N"),),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.05,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "name",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Text(
                                      'phone',
                                      style: TextStyle(
                                          // fontSize: constraints.maxWidth * 0.05,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'location',
                                    style: TextStyle(
                                        // fontSize: constraints.maxWidth * 0.05,
                                        ),
                                  ),
                                ],
                              ),
                            ],
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
        
  