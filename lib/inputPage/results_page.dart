import 'input_page.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reuseable_card.dart';
import 'buttom_button.dart';

class ResultsPage extends StatelessWidget {
  double bmi = 85.2;

  ResultsPage({this.bmiResult, this.resultText});
  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitelTextStyle,
              ),
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'You have a higher than normal body weight. Try to exercise more.',
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtomButton(
            title: 'RE_CALCULATE',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
          )
        ],
      ),
    );
  }
}
