// Cookbook has a lot of features (ex. themes)
// To keep styling the same between apps, we need to incorporate a ThemeData
// Main use of the main file is to create a theme, what app is going to be named, etc.
// Also, main file directs users to every other screen, and each screen is a seperate file

import 'package:flutter/material.dart';
import 'input_page.dart'; //imported this to get access of the inputpage.dart

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //adding theme
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // color for major backgrounds of app (toolbars/tab bars
        scaffoldBackgroundColor: Colors.grey, // background color
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)) //Middle theme text (looked at documentation)
      ),
      home: InputPage(),
    );
  }
}