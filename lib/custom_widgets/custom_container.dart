import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.firstwidget,
      required this.secondWidget,
      required this.thirdWidget})
      : super(key: key);
  final Widget firstwidget;
  final Widget secondWidget;
  final Widget thirdWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstwidget,
          secondWidget,
          thirdWidget,
        ],
      ),
    );
  }
}
