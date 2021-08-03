import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BMIbrain.dart';
import 'bottomtab.dart';
import 'card.dart';
import 'circle.dart';
import 'constant.dart';
import 'icon_content.dart';
import 'package:bmi_calculator/result_page.dart';


class ResultPage extends StatelessWidget {

  String bmiresult;
  String bminnumber;
  String bmiinstructor;

  ResultPage({@required this.bmiresult, @required this.bmiinstructor,@required this.bminnumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitlestyletext,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveColors,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiresult,
                    style: kResulttext,
                  ),
                  Text(
                    bminnumber,
                    style: kBMItext,
                  ),
                  Text(
                    bmiinstructor,
                    style: kBodytext,
                  ),
                ],
              ),
            ),
          ),
          bottomtab(
            'RE-CALCULATE',
            () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
