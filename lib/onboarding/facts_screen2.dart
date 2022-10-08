import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class FactsScreen2 extends StatelessWidget {
  const FactsScreen2({Key? key}) : super(key: key);
  static const String id = "FactsScreen2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            Image(image: AssetImage('images/splash 2.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              '100% of samples tested for all mandatory transfusion transmissible infections',
              style: KNormalText,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
