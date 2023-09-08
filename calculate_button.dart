import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CalculateButton extends StatelessWidget {
  final Function() onTap;
  final String buttonTitle;

  CalculateButton({required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      /*() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage())); //Navigating to just one page
      }, */
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: kLabelTextStyle,
        ),
        color: Colors.pinkAccent,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        //height: bottomContainerHeight,
        height: MediaQuery.of(context).size.height *
            0.075, // 10 percent of screen size
      ),
    );
  }
}