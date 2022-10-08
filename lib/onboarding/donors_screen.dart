import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/custom_widgets/bloodtype_container.dart';

import 'package:bloodapp/onboarding/donorinfo_screen.dart';
import 'package:flutter/material.dart';

class DonorsScreen extends StatefulWidget {
  const DonorsScreen({Key? key}) : super(key: key);
  static const String id = "DonorsScreen";

  @override
  State<DonorsScreen> createState() => _DonorsScreenState();
}

class _DonorsScreenState extends State<DonorsScreen> {
  // final myProducts = List<String>.generate(1000, (i) => 'Product $i');
  final List<Map<String, dynamic>> _allUsers = [
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Andy",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Aragon",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Bob",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Barbara",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Candy",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Colin",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Audra",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Banana",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Caversky",
      "location": "Madina"
    },
    {
      "image": 'images/Avatar2.png',
      "distance": '5km',
      "name": "Becky",
      "location": "Madina"
    },
  ];

  // This list holds the data for the list view
  //List<Map<String, dynamic>> _foundUsers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: BloodtypeContainer(
                    image: 'images/blood2.png',
                    bloodtype: 'A Negative\n(A-)',
                    bloodsymbol: 'A-',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'All donors',
                    style: KNormalText,
                  ),
                ),
                Container(
                  height: 600,
                  child: ListView.builder(
                    itemCount: _allUsers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, DonorInfo.id);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            selectedTileColor: Colors.grey[300],
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(_allUsers[index]["image"])),
                            title: Text(_allUsers[index]["name"]),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Text(_allUsers[index]["location"]),
                              ],
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                  color: KColor1,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Text(
                                  _allUsers[index]["distance"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
