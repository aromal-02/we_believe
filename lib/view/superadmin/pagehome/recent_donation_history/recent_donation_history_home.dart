import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';

class Super_RecentDonationHistoryHome extends StatefulWidget {
  const Super_RecentDonationHistoryHome({super.key});

  @override
  State<Super_RecentDonationHistoryHome> createState() =>
      _Super_RecentDonationHistoryHomeState();
}

class _Super_RecentDonationHistoryHomeState
    extends State<Super_RecentDonationHistoryHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Donation History",
            style: TextStyle(color: Colours.white),
          ),
        ),
        backgroundColor: Colours.red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(5, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "akshay",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 50),
                              Text(
                                "A+",
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: List.generate(2, (donorIndex) {
                              return Row(
                                children: [
                                  const SizedBox(width: 50),
                                  Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        "Rahul",
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        '12/4/2020',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}