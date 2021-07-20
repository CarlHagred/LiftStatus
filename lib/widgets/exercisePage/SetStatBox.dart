import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lift_status/model/set_data.dart';
import 'package:lift_status/screens/exercise_page.dart';
import '../../widgets/exerciseDiagram/chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SetStatBox extends StatelessWidget {
  SetStatBox({
    Key key,
    @required this.sets,
    @required this.widget,
  }) : super(key: key);

  final SetData sets;
  final ExercisePage widget;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[800],
      ),
      height: 250,
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 5.0,
                  percent: sets.currentPercentageOfGoal * 0.01,
                  center: Text("${sets.currentPercentageOfGoal}%"),
                  progressColor: Colors.green,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Add Goal'),
                            content: TextField(
                              maxLength: 10,
                              onChanged: (value) {},
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText:
                                  "Type the weight goal you want achieve"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Add'),
                                onPressed: () {
                                  if (myController.text.isNotEmpty) {
                                    sets.setGoal(
                                        int.parse(myController.text));
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Change Goal'))
              ],
            ),
          ),
          Container(
            height: 230,
            width: 250,
            child: Chart(
              num: widget.num,
            ),
          ),
        ],
      ),
    );
  }
}
