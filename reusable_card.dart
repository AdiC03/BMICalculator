import 'package:flutter/material.dart';

// This is a widget skeleton
// Stateless widgets are immutable (think of actual lego blocks)
// To change whatever you want to change, you would have to destroy the current one
// And then create a new one in its place (which is why you use key word final)
class ReusableCard extends StatelessWidget {

  /*
  const ReusableCard({
    super.key,
  });
  */

  final Color colour; // instantiation variables, final makes this property immutable
  // Color is not const, since the card can be created at any time when app is running

  final Widget? cardChild; // Nullable and Optional

  final Function? onPress; // void call back vs. function

  ReusableCard({required this.colour, this.cardChild, this.onPress}); // Constructor (color is a required property)


  // Key class: used to keep track of the state of widgets
  // Useful for scrolling on the screen or the widgets are moving around
  // But in most cases, it's not super useful

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress != null ? () => onPress!() : null, // call onPress function if it is not null,
      child: Container ( // Card essentially and position is default at top left
        child: cardChild, // Child of container (we use if we need content inside of the widget)
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration( //Actual box (like curve hedges and color)
          color: colour,
          borderRadius: BorderRadius.circular(25),
        ),
        height: MediaQuery.of(context).size.height * .25, // prevents overflow and specific to screen size (25% of screen size)
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}