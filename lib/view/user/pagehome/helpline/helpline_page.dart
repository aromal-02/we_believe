import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpline extends StatelessWidget {
  const Helpline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Helpline",
          style: TextStyle(color: Colours.white),
        ),
        backgroundColor: Colours.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/helpline.png"),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Welcome to the Help Line!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          //  const SizedBox(height: 16),
            const SizedBox(height: 16),
            Column(
              children: [
                const SizedBox(width: 10),
                helpline(112, "NATIONAL EMERGENCY NUMBER"),
                const SizedBox(height: 16),
                helpline(100, "POLICE"),
                const SizedBox(height: 16),
                helpline(101, "FIRE"),
                 const SizedBox(height: 16),
                helpline(108, "AMBULANCE"), const SizedBox(height: 16),
                
                helpline(1091, "Women Helpline"),
              ],
            ),

          
          ],
        ),
      ),
    );
  }

  GestureDetector helpline(
    int number,
    String name,
  ) {
    return GestureDetector(
      onTap: () {
        final phone = number.toString();
        launch("tel:$phone");
      },
      child: Row(
        children: [
          Icon(
            Icons.phone,
            size: 15,
            color: Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            "$name: $number",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
