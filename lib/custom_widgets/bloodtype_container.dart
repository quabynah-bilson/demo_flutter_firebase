import 'package:bloodapp/custom_styles.dart';
import 'package:flutter/material.dart';

class BloodtypeContainer extends StatelessWidget {
  const BloodtypeContainer(
      {Key? key,
      required this.bloodsymbol,
      required this.bloodtype,
      this.image = 'images/blood3.png'})
      : super(key: key);
  final String bloodtype;
  final String bloodsymbol;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: KColor1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      height: 122,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(children: [
              Image(image: AssetImage('images/blood3.png')),
              Positioned(
                left: 18,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: KColor3,
                  child: Text('$bloodsymbol'),
                ),
              )
            ]),
            Text(
              bloodtype,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
