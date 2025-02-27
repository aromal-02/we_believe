
import 'package:flutter/material.dart';

class FindDonar extends StatefulWidget {
  const FindDonar({super.key});


  @override
  _FindDonarState createState() => _FindDonarState();
}

class _FindDonarState extends State<FindDonar> {
 

  List<String> name = [
    "akash","vivek","manu"


  ];List<String> bloodgroup = [
    "A+","B+","O+"


  ];List<String> phone = [

    "9876543212","8765432345","7898765456"

  ];

  
  void showDetails(String selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(selectedItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Find Donor",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(name[index]),
                  subtitle: Text(phone[index]),
                  leading:  Text(bloodgroup[index],style: TextStyle(fontSize: 20),),
                  onTap: () {
                    
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String selectedItem;

  const DetailsPage(this.selectedItem, {super.key});

  // final CollectionReference itemsCollection =
  //     FirebaseFirestore.instance.collection(DonorRegistration);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Details for $selectedItem',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body:ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              //final userData = users[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details for $selectedItem:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Name'),
                    Text('Phone:'),
                    Text('Adress:'),
                    // Add more fields as needed
                  ],
                ),
              );
            },
          ));
        }
}
