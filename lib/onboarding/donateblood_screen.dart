import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/onboarding/donorinfo_screen.dart';
import 'package:bloodapp/onboarding/donors_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/historytab_container.dart';

class DonateBlood extends StatefulWidget {
  const DonateBlood({Key? key}) : super(key: key);
  static const String id = "DonateBlood";

  @override
  State<DonateBlood> createState() => _DonateBloodState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _DonateBloodState extends State<DonateBlood> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: KColor3),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          '3',
                          style: TextStyle(fontSize: 25),
                        ))),
                    Text('lives saved')
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/man.png'),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
                Column(
                  children: [
                    Stack(children: [
                      Image(image: AssetImage('images/blood3.png')),
                      Positioned(
                        left: 18,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: KColor3,
                          child: Text(
                            _auth.currentUser?.displayName ?? 'B+',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                    ]),
                    Text('Blood group')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            HistoryTabContainer(
              date: ' 27\nJune',
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Donation Date',
                    style: KNormalText,
                  ),
                  Text('4 days left')
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                color: KColor4,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DonorsScreen.id);
                  },
                  child: SwitchListTile(
                      title: Text(
                        'I am available to donate',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      value: _value,
                      onChanged: (bool value) {
                        setState(() {
                          _value = value;
                          Navigator.pushNamed(context, DonorsScreen.id);
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'History',
              style: KNormalText,
            ),
            SizedBox(height: 10),
            HistoryTabContainer(
                date: ' 7 \nJune', widget: Text('Dansoman Car Park')),
            SizedBox(height: 10),
            HistoryTabContainer(
                date: ' 1 \nJune', widget: Center(child: Text('Korle Bu'))),
          ],
        ),
      ),
    );
  }
}
