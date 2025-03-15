import 'package:donation/constant/colors.dart';
import 'package:donation/service/controller/donar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindDonar extends StatelessWidget {
  FindDonar({super.key});
  final DonarController controller = Get.put(DonarController());

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
              onChanged: controller.filterDonors, // Call search function on change
              decoration: InputDecoration(
                hintText: 'Search by name...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredDonors.isEmpty) {
                return Center(child: Text("Empty"));
              }

              return ListView.builder(
                itemCount: controller.filteredDonors.length,
                itemBuilder: (context, index) {
                  final donor = controller.filteredDonors[index];
                  
                  return ListTile(
                    title: Text(donor.name),
                    subtitle: Text(donor.phone),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text(
                        donor.group,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
