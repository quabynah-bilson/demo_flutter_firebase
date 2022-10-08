import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class FactsScreen1 extends StatelessWidget {
  const FactsScreen1({Key? key}) : super(key: key);
  static const String id = "FactsScreen1";

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
              height: 40,
            ),
            Image(image: AssetImage('images/splash 1.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              'Every year, over 170000 units of blood are collected across the country',
              style: KNormalText,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
