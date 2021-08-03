import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BMIbrain.dart';
import 'bottomtab.dart';
import 'card.dart';
import 'circle.dart';
import 'constant.dart';
import 'icon_content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

void main() => runApp(BMICalculator());

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int height = 180;
  int age = 24;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kactiveColors
                          : kinactiveColors,
                      cardchild: Icons2(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kactiveColors
                          : kinactiveColors,
                      cardchild: Icons2(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveColors,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kLableTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLableTextStyle,
                              )
                            ],
                          ),
                          Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                              print(height);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveColors,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleBotton(() {
                                setState(() {
                                  weight++;
                                });
                              }, FontAwesomeIcons.plus),
                              SizedBox(
                                width: 20,
                              ),
                              CircleBotton(() {
                                setState(() {
                                  weight--;
                                });
                              }, FontAwesomeIcons.minus),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveColors,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleBotton(() {
                                setState(() {
                                  age++;
                                });
                              }, FontAwesomeIcons.plus),
                              SizedBox(
                                width: 20,
                              ),
                              CircleBotton(() {
                                setState(() {
                                  age--;
                                });
                              }, FontAwesomeIcons.minus),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomtab(
                'CALCULATE',
                    () {
                  BmiBrain results = BmiBrain(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          bminnumber: results.calculateBMI(),
                          bmiinstructor: results.instructor(),
                          bmiresult: results.result(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
