import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class FactsScreen3 extends StatelessWidget {
  const FactsScreen3({Key? key}) : super(key: key);
  static const String id = "FactsScreen3";

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
              height: 80,
            ),
            Image(image: AssetImage('images/splash 3.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your body would regenerate blood only in few weeks.',
              style: KNormalText,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
