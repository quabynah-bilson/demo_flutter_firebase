import 'package:bloodapp/custom_styles.dart';
import 'package:flutter/material.dart';

class HistoryTabContainer extends StatelessWidget {
  const HistoryTabContainer(
      {Key? key, required this.date, required this.widget})
      : super(key: key);
  final String date;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: KColor3),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.2,
            color: KColor2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    '$date',
                    style: KNormalText,
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0), child: widget),
        ],
      ),
    );
  }
}
