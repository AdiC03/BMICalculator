import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculate_button.dart';

class ResultsPage extends StatelessWidget{

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({required this.bmiResult, required this.interpretation, required this.resultText})
  {}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text('Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                //padding: EdgeInsets.all(15),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Results Here:',
                  style: kDataLabelStyle,
                ),
          )
          ), // One widget
          Expanded(
            flex: 7, // property of widget taking up space
            child: ReusableCard(
              colour: Color(0xffbbc517),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultStyleText
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle
                  ),
                  Text(
                    interpretation,
                    style: kResultStyleText
                  ),
                ],
              ), // Main contents
            ),// The card containing everything
          ),
          CalculateButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Recalculate'
          )
        ],
      ),
    );
  }


}