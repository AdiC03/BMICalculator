import 'package:flutter/material.dart';
import 'constants.dart';

class GenderWidget extends StatelessWidget {


  final IconData icon;
  final String label;

  GenderWidget({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column( // Child has two features: an icon and text
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon, //icon
          size: 80,
          color: Color(0xffcfd8dc),
        ),
        SizedBox( // Padding between icon and text
          height: 15,
        ),
        Text(label,
            style: kLabelTextStyle),
      ],
    );
  }
}
