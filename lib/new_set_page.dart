import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lift_status/model/sets.dart';
import 'components/reuseable_card.dart';
import 'constant.dart';
import 'components/buttom_button.dart';
import 'components/round_icon_button.dart';
import 'model/sets.dart';

const double buttomContainerHeight = 80;

class InputPage extends StatefulWidget {
  InputPage({this.title});

  final String title;
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String get title => widget.title;
  int weight = 0;
  int repetitions = 3;
  DateTime selectedDate = DateTime.now();
  final myController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(
        () {
          selectedDate = picked;
        },
      );
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
          ReuseableCard(
            kActiveCardColor,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name the set'),
                ),
              ],
            ),
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
                      primary: Colors.grey[800],
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
                      Text(weight.toString(), style: kNumberTextStyle),
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
                      value: weight.toDouble(),
                      min: 0,
                      max: 250,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) => {
                        setState(() {
                          weight = newValue.round();
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
            title: 'SAVE',
            onTap: () {
              setState(
                () {
                  var inserted = false;

                  List<dynamic> responseList = exercises[title]["data"];
                  responseList.forEach(
                    (post) {
                      for (var i = 0; i < post[post.keys.first].length; i++) {
                        if (post.keys.toString() ==
                            '(${selectedDate.toLocal().toString().split(' ')[0]})') {
                          print('hej' + post.toString());
                          inserted = true;
                          post[selectedDate.toLocal().toString().split(' ')[0]]
                              .add(
                            {
                              "name": myController.text,
                              "weight": weight,
                              "reps": repetitions,
                            },
                          );
                          break;
                        }
                      }
                    },
                  );
                  if (!inserted) {
                    List post = exercises[title]["data"];
                    print('hej' + post.toString());
                    post.add(
                      {
                        selectedDate.toLocal().toString().split(' ')[0]: [
                          {
                            "name": myController.text,
                            "weight": weight,
                            "reps": repetitions,
                          },
                        ],
                      },
                    );
                  }
                },
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
