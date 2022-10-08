import 'package:bloodapp/custom_styles.dart';
import 'package:flutter/material.dart';

class TextfieldClass extends StatelessWidget {
  const TextfieldClass(
      {Key? key, required this.labeltext, required this.onChanged})
      : super(key: key);
  final String labeltext;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged(value),
      style: TextStyle(color: KColor4),
      decoration: InputDecoration(
          filled: true, //<-- SEE HERE
          fillColor: KColor2,
          labelText: labeltext,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: KColor2),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: KColor2),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
