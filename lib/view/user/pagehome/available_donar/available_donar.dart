import 'package:flutter/material.dart';

class AvailableDonors extends StatefulWidget {
  const AvailableDonors({super.key,});
  //late String? _token;

  @override
  State<AvailableDonors> createState() => _AvailableDonorsState();
}

class _AvailableDonorsState extends State<AvailableDonors> {
  @override
  Widget build(BuildContext context) {
    bool isButtonPressed = false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Donors",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
              
            

                return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                     "Name",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Text(
                                   "Phone Number",
                                  ),
                                  Row(children: [
                                    Text(
                                       "age",
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                     
                                          " O+",
                                      style: const TextStyle(
                                       
                                          color:
                                              Color.fromARGB(255, 207, 2, 2)),
                                    ),
                                  ]),
                                  Text(
                                  "date",
                                    //   style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                           ListView.builder(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Donor Details",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            Text(
                                              "name",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "phone",
                                              style: const TextStyle(),
                                            ),
                                            Text(
                                              "age",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                           
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: ElevatedButton(
                                    onPressed:(){},
                                   
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(
                                                Colors.red)),
                                    child: const Text(
                                      "Accept",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: ElevatedButton(
                                  onPressed: ()  {
                                    
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.red)),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ));
              }
        }
  


