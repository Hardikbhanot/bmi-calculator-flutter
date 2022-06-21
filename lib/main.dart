import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import "Calculator.dart";

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

Color activeCardColor = Color(0xFF1D1E33);
Color inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == activeCardColor) {
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = activeCardColor;
  //     }
  //   } else if (gender == Gender.female) {
  //     if (femaleCardColor == activeCardColor) {
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = activeCardColor;
  //     }
  //   }
  // }

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                      // updateColor(Gender.male);
                    });
                  },
                  child: tabWidget(
                      selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      MFWidget(icon: FontAwesomeIcons.mars, label: "MALE")),
                )),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                            // updateColor(Gender.female);
                          });
                        },
                        child: tabWidget(
                            selectedGender == Gender.female
                                ? activeCardColor
                                : inactiveCardColor,
                            MFWidget(
                                icon: FontAwesomeIcons.venus,
                                label: "FEMALE")))),
              ],
            ),
          ),
          Expanded(
            child: tabWidget(
                activeCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,

                          // divisions: 1,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                          inactiveColor: Colors.grey,
                          activeColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: tabWidget(
                    activeCardColor,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (() {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: (() {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          )
                        ])),
              ),
              Expanded(
                child: tabWidget(
                    activeCardColor,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (() {
                                  setState(() {
                                    age++;
                                  });
                                }),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: (() {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                child: Center(
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          )
                        ])),
              )
            ]),
          ),
          // ]),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Results(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}

class MFWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  MFWidget({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class tabWidget extends StatelessWidget {
  tabWidget(this.colour, this.CardChild) {}
  Color colour;
  final Widget CardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardChild,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: colour),
    );
  }
}
