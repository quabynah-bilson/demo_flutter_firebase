import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);
  static const String id = "Splash1";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //container containing picture here
        Text(
          'Every year, over 170000 units of blood are collected across the country',
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                //push to splash2
              },
              child: Text('Skip'),
            ),

            //put the loading indicator here..get the flutter package for that
          ],
        ),
      ],
    );
  }
}
