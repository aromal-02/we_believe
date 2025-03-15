import 'package:donation/constant/colors.dart';
import 'package:donation/constant/style.dart';
import 'package:donation/service/api/api_service.dart';
import 'package:donation/service/controller/donar_controller.dart';
import 'package:donation/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableDonors extends StatefulWidget {
  const AvailableDonors({super.key,});

  @override
  State<AvailableDonors> createState() => _AvailableDonorsState();
}

class _AvailableDonorsState extends State<AvailableDonors> {
  String? username;

  @override
  void initState() {
    super.initState();
    fetchUID();
  }

  Future<void> fetchUID() async {
    String? fetchedUid = await FirebaseService.getValue("uid");
    setState(() {
      username = fetchedUid; // Update the state after fetching UID
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Donors",
            style: TextStyle(color: Colours.white),
          ),
        ),
        backgroundColor: Colours.red,
      ),
      body: username == null
          ? const Center(
              child: CircularProgressIndicator(color: Colours.red),
            )
          : FutureBuilder(
              future: FirebaseService.own_request(username!), // Now username is initialized
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colours.red));
                } else if (snapshot.hasError) {
                  CustomToast().show("Error");
                  return const Center(child: Text("Error"));
                } else {
                  final donors = snapshot.data!;
                  if (donors.isEmpty) {
                    return const Center(child: Text("Request empty"));
                  } else {
                    return ListView.builder(
                      itemCount: donors.length,
                      itemBuilder: (context, index) {
                        final donor = donors[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      donor['name'],
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    Text('ph: ${donor['phone']}'),
                                    Row(children: [
                                      Text('age: ${donor["age"]}'),
                                      const SizedBox(width: 120),
                                      Text(
                                        'group: ${donor["group"]}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 207, 2, 2)),
                                      ),
                                    ]),
                                    Text('date: ${donor["date"]}'),
                                  ],
                                ),
                              ],
                            ),
                                                    children: [
                          const SizedBox(
                            height: 10,
                          ),
                           ListView.builder(
                                  itemCount: donor['donations']?.length ?? 0,

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
                                             donor['donations'][index]['name']??"name",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                             donor['donations'][index]['phone']??"phone",
                                              style: const TextStyle(),
                                            ),
                                            Text(
                                             donor['donations'][index]['age']??"age",
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
                                    onPressed:(){
                                      Navigator.pop(context);
                                    },
                                   
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
                                  //   FirebaseService.delete_collection(donor["docId"], 'blood_request');
                                  // },  onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text("Are You Sure Delete?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: ()async {
                                        FirebaseService.delete_collection(donor["docId"], 'blood_request');
                                       Navigator.pop(context);
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
                );}}}
                )
                );}}  
