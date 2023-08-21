import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/util/smart_devices.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of devices
  List mySmartDevices = [
    ["Smart Light", "assets/light-bulb.png", true],
    ["Smart AC", "assets/air-conditioner.png", true],
    ["Smart TV", "assets/smart-tv.png", true],
    ["Smart Fan", "assets/fan.png", true],
  ];

  //powerSwitchChanged
  powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'assets/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Welcome Home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'Bunnyhoops',
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                thickness: 2,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(25),
                    itemCount: mySmartDevices.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                    itemBuilder: (context, index) => SmartDeviceBox(
                          smartDeviceName: mySmartDevices[index][0],
                          iconPath: mySmartDevices[index][1],
                          powerStatus: mySmartDevices[index][2],
                          onChanged: (value) =>
                              powerSwitchChanged(value, index),
                        )))
          ],
        ),
      ),
    );
  }
}
