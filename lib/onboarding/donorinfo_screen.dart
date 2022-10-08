import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/onboarding/healthtips_screen.dart';
import 'package:bloodapp/onboarding/home_page.dart';
import 'package:bloodapp/onboarding/home_screen.dart';
import 'package:bloodapp/onboarding/messages_screen.dart';
import 'package:bloodapp/onboarding/news_screen.dart';
import 'package:bloodapp/onboarding/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class DonorInfo extends StatefulWidget {
  const DonorInfo({Key? key}) : super(key: key);
  static const String id = "DonorInfo";
  @override
  State<DonorInfo> createState() => _DonorInfoState();
}

class _DonorInfoState extends State<DonorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: SfMaps(
                      layers: [
                        MapTileLayer(
                          //TODO
                          //TODO
                          //TODO
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/man.png'),
                ),
                SizedBox(
                  width: 70,
                ),
                MaterialButton(
                  height: 40,
                  //      minWidth: 50,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    //Navigate to splash 1
                  },
                  child: const Text('Request now'),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  width: 50,
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Peter Donkor',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Legon, Accra',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: KColor1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(
                    '   Distance:                  2.5km',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: KColor1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(
                    '   Estimated Time:     15mins',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: KColor1,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, HomeScreen.id);
      //           },
      //           child: Icon(Icons.home)),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, NewsScreen.id);
      //           },
      //           child: Icon(Icons.newspaper_rounded)),
      //       label: 'News',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //           onTap: (() {
      //             Navigator.pushNamed(context, MessagesScreen.id);
      //           }),
      //           child: Icon(Icons.mark_email_unread)),
      //       label: 'Messages',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, HealthTipsScreen.id);
      //           },
      //           child: Icon(Icons.heart_broken_sharp)),
      //       label: 'Health Tips',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, SettingScreen.id);
      //           },
      //           child: Icon(Icons.person)),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
