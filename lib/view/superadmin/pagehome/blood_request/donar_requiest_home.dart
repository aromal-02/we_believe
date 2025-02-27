
import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';


class DonorRequestHome_super extends StatefulWidget {
  const DonorRequestHome_super({super.key});

  @override
  State<DonorRequestHome_super> createState() => _DonorRequestHome_superState();
}

class _DonorRequestHome_superState extends State<DonorRequestHome_super> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Blood Requests",
            style: TextStyle(color: Colours.white)),
        backgroundColor: Colours.red,
      ),
      body:LayoutBuilder(
            builder: (context, constraints) {
              return ListView.builder(
                itemCount:5,
                itemBuilder: (context, index) {
                
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ForDonorRequiest()),
                      // );
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.all(constraints.maxWidth * 0.02),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colours.red,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          textDirection: TextDirection.ltr,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.02,
                                  top: constraints.maxWidth * 0.02),
                              child: CircleAvatar(
                                radius: constraints.maxHeight * 0.05,
                                child: Center(child: Text("N"),),
                              ),
                            ),
                            SizedBox(width: constraints.maxWidth * 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                               
                               
                              children: [
                                Text(
                                'name',
                                ),
                                Text(
                                 'date',
                                ),
                                Text(
                                  'address',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: constraints.maxWidth * 0.1,
                              width: constraints.maxWidth * 0.225,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: const Text('Are you sure '),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                    
                                            
                                          },
                                          child: const Text('Yes'),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colours.red),
                                ),
                                child: Text(
                                  "Decline",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.027,
                                      color: Colours.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
      )
    );}}

