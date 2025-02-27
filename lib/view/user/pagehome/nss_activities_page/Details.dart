import 'package:flutter/material.dart';

class Nss_Details_clinet extends StatefulWidget {
  const Nss_Details_clinet({super.key, this.docId});
  final docId;

  @override
  State<Nss_Details_clinet> createState() => _Nss_Details_super();
}

class _Nss_Details_super extends State<Nss_Details_clinet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            'Event Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
              itemCount:5,
              itemBuilder: (context, index) {
              

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromARGB(26, 255, 0, 0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         "Title",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                        "About program",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ));
          
  }
}
