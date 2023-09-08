// Use hot reload for basic changes, and hot restart for big changes
// How containers work: if they have no children, they will be as large as the parent
// However, once there is a child, then the widget will size itself to what the child is
// Main thing to take away: read the documentation

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculate_button.dart';
import 'reusable_card.dart';
import 'gender_widget.dart';
import 'constants.dart';
import 'results_page.dart';
import 'functionality.dart';

// Stateful widget: things can change within them
class InputPage extends StatefulWidget {
  // We have stateful widget since the state of the widget changes with each tap
  @override
  _InputPageState createState() => _InputPageState();
}

// main use is to make code more readable (enum)
enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  // Mutable State; properties for class can change

  Gender? selectedGender;
  int height = 180; // default value for slider
  int weight = 60;
  int age = 20;

/*

Color maleCardColor = regCardColor;
Color femaleCardColor = regCardColor;

void updateColor(Gender gender)
{
  // male card pressed
  if (gender == Gender.male)
    {
        if (maleCardColor == regCardColor)
          {
            maleCardColor = pressedCardColor;
            femaleCardColor = regCardColor;
          }
        else
          {
            maleCardColor = regCardColor;
          }
    }
  else
    {
      if (femaleCardColor == regCardColor)
      {
        femaleCardColor = pressedCardColor;
        maleCardColor = regCardColor;
      }
      else
      {
        femaleCardColor = regCardColor;
      }
    }
}
*/

  @override
  Widget build(BuildContext context) {
    // Context is current state of the app
    // Scaffold is the main page
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        // Column layout

        // Child/Children property: gives the content in a widget (contained by container)
        // Use it to create custom content
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            //First Row
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kPressedCardColor
                      : kRegCardColor, // ternary operator deciding color (default is false)
                  cardChild: GenderWidget(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                // Alt enter to wrap with another widget (gesture detector)
                onTap: () {
                  // When button is tapped
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kPressedCardColor
                      : kRegCardColor, // ternary operator deciding color (default is false)
                  cardChild: GenderWidget(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              )),
            ],
          )),

          Expanded(
              child: ReusableCard(
            colour: Colors.green,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // along length of row (big axis)
                  crossAxisAlignment: CrossAxisAlignment
                      .baseline, //short side (width of row) (small axis)
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kDataLabelStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ), // Same column, but creating a row
                SliderTheme(
                  // Use this to customize widgets further (styling)
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFF101981),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    overlayColor: Color(0x28101981),
                  ), // Only need to provide several things
                  child: Slider(
                      // Actual functionality of the slider
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Color(0xFF101981),
                      // inactiveColor: Color(0xFF8D8E98), // both colors are from the slider class
                      onChanged: (double newValue) {
                        setState(() {
                          height =
                              newValue.round(); // changes the slider position
                        });
                      }),
                ),
              ],
            ), //Things will be stacked vertically in this third widget
          )), // Second Row

          Expanded(
              child: Row(
            //Third Row
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: Colors.orange,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kDataLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight += 1;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 10),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight -= 1;
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                ), // Multiple things are getting stacked
              )),
              Expanded(
                  child: ReusableCard(
                colour: Colors.orange,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kDataLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age += 1;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 10),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age -= 1;
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                ), // Multiple things are getting stacked
              )),
            ],
          )),
          CalculateButton(
            buttonTitle: 'Calculate',
            onTap:() {
              Functionality calc = Functionality(height: height, weight: weight); // height and weight from the components

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(), // method that returns string of the bmi
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ))); //Navigating to just one page
            },
          ),
        ],
      ),
    );
  }
}


/*
 class RoundIconButton extends StatelessWidget{

  final IconData icon;
  final Function() onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
   return RawMaterialButton(
       onPressed: onPressed,
     child: Icon(icon),
     elevation: 6.0,
     constraints: BoxConstraints.tightFor(
       width: 56,
       height: 56,
     ),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
     fillColor: Color(0xFF4C4F5E),
   );
  }

 }
*/

// Maybe review flex properties, columns, row expanded widgets

/* Final vs. Const
* Both cannot change their values once set in stone
* Final: can only be set once
* Const: is compile-time constant (nothing can be accessed at run time)
* - (ex.) When getting the current time, you would use final, but not const
* since you're getting the information at run time
*
*  */

/* Enums: action of establishing the number of something
(ex. different numbers representing different cars)
Use enums to represent more states than just regular boolean true or false
(different settings like high, medium, low)
enums:
enum EnumName {typeA, typeB, typeC} //declaring it (needs to be outside of a class)
EnumName.typeA // using the enum

ex.
enum CarType{
 SUV,
 convertible,
 hatchback.
}

class Car{
  CarType carStyle;
  Car({this.carStyle});
}

void main(){
  Car myCar = Car(carStyle: carType.convertible);

}

 */

/* Ternary Operators

if (ConditionsTrue) {DoThisIfTrue}
else {DoThisIfFalse}

gets reduced to ConditionsTrue ? DoThisIfTrue : DoThisIfFalse

ex.
bool isGoofy = true;

if (isGoofy == true)
{
  print('Nice');
}
else
{
  print('Dang');
}

----> isGoofy == true ? print('Nice') : print('Dang');

another ex.

int myAge = 12;

bool canBuyBeer = myAge > 21 ? true : false;
 */

/* Functions (First class objects)
- has a type and can be passed around
- can be set as th value of a variable or constant

ex. int result = add(1,4);

- you can use functions in a parameter of another function

ex.
void main()
{
  int result = calculator(5,8,multiply);
}

int calculator(int num1, int num2, Function operation)
{
  return calculation(num1, num2);
}

int multiply(int num1, int num2)
{
  return num1 * num2;
}

- You can pass in function as variables (even when creating an object)

void main()
{
  Car myCar = Car(drive: slowDrive); // passing in name of the function, not actually calling it

  myCar.drive; // This is the instantiation variable (prints out: Closure 'slowDrive')
  myCar.drive(); // This actually calls the function of Car class (prints out: Drive slow)

  myCar.drive = fastDrive; // no parenthesis since you're not calling the function;
  // Setting the instantiation variable to the name of the new function
}

class Car
{
  function drive;

  Car({this.drive});
}

void slowDrive()
{
  print('Drive slow');
}

void fastDrive()
{
  print('Drive fast');
}

 */

/* Inheritance (more customization for widgets)
- inherit the base class and then override the properties we want to change
- However, composition is favored over inheritance in flutter
(ex.) a limited box over a constrained box over align over padding over decorated box all form a container
- Will use this concept for the last two reusable cards at the bottom (used in the other class by using RawMaterialButton)


 */

/*

Routes and Navigation:
Routes = screens and pages

Navigator.push(): adds a route to a stack of routes (similar to pushing pancakes onto a stack (and popping))

Navigator.push(
context,
MaterialPageRoute(builder: (context) => SecondRoute()), // SecondRoute is the context (location of widget in widget tree)
)

Navigator.pop(): for popping screens

Names routes (screen that has multiple routes)
- Define routes in MaterialApp in main.dart
(ex.)
routes (type map, which is a collection type)
- difference between map and list: maps have a key and a value
- the key: '/first'
- value: (context) => FirstScreen() (The values are usually functions)
- The home: property is where the screen would start
- But we can also use something called "initial route", which is the key
- To navigate:
Navigator.pushNamed(context, '/key') ('key' is value associated with a particular screen)
 */

/*
Maps:
- Think of it like a phone book
- The keys are the names and the values are the numbers
- Maps are unordered, unlike lists
(ex.) Age corresponding with name
{
  Adi: 19,
  Ganesh: 18,
  Sophie: 13
}

Create map:
Map<KeyType, ValueType> mapName {
Key: value
}

Using map:
mapName[key]

(ex.)
Map<String, int> friendList = {
  'Kyle': 27,
  'Amy': 34,
}

main() void {
 print(friendList['Amy']); // if you pull value not in map, like Adi, it will give null
 friendList['Adi'] =  19; // Adding to map
 // .length method, .keys (prints out all the keys), .values (prints out all values)
}
 */
