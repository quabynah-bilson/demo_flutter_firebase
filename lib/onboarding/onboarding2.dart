import 'package:bloodapp/onboarding/facts_splash.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class Onbaording2 extends StatelessWidget {
  const Onbaording2({Key? key}) : super(key: key);
  static const String id = "Onbaording2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor1,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Color(0XffD9D9D9),
            decoration: BoxDecoration(
              color: KColor2,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300.0),
                  bottomRight: Radius.circular(300.0)),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            //   width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              'NeedBlood',
              style: KOnbaording2_textstyle,
            )),
          ),
          const SizedBox(
            height: 70,
          ),
          MaterialButton(
            minWidth: 300,
            color: KColor2,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Navigator.pushNamed(context, FactsSplash.id);
            },
            child: const Text('Let\'s go'),
          )
        ],
      ),
    );
  }
}
