import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/reuseable_card.dart';
import 'constant.dart';
import 'components/buttom_button.dart';
import 'components/round_icon_button.dart';

const double buttomContainerHeight = 80;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 0;
  int repetitions = 3;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Set'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReuseableCard(kActiveCardColor, TextField()),
          ),
          Expanded(
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Date',
                    style: kLabelTextStyle,
                  ),
                  Text("${selectedDate.toLocal()}".split(' ')[0],
                      style: kNumberTextStyle),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Change date'),
                    style: ElevatedButton.styleFrom(
                      primary: kButtomButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kButtomButtonColor,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 400,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) => {
                        setState(() {
                          height = newValue.round();
                        }),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Repetitions',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(repetitions.toString(), style: kNumberTextStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              repetitions--;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              repetitions++;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          ButtomButton(
            title: 'CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
