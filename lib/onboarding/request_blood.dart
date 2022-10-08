import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/custom_widgets/bloodtype_container.dart';
import 'package:bloodapp/onboarding/donateblood_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({Key? key}) : super(key: key);
  static const String id = "RequestBlood";

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please Select your blood group',
            style: KNormalText,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'A Negative\n(A-)',
                      bloodsymbol: 'A-',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'AB Positive\n(AB+)',
                      bloodsymbol: 'AB+',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'A Negative\n(A-)',
                      bloodsymbol: 'A-',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'A Negative\n(A-)',
                      bloodsymbol: 'A-',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'A Negative\n(A-)',
                      bloodsymbol: 'A-',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BloodtypeContainer(
                      bloodtype: 'A Negative\n(A-)',
                      bloodsymbol: 'A-',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Card(
            elevation: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    color: KColor1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '| ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w100,
                        color: KColor2),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Units of Blood ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: KColor3),
                      ),
                      Text(
                        '~525mL ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, DonateBlood.id);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: KColor1,
            height: 50,
            minWidth: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'Emergency',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
