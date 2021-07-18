import 'package:flutter/material.dart';
import 'package:lift_status/model/exercise.dart';
import 'package:lift_status/widgets/setList/set_list.dart';
import '../widgets/exerciseDiagram/chart.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({this.exercise, this.num});

  final Exercise exercise;
  final int num;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String get title => widget.exercise.name;
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Chart(
                num: widget.num,
              ),
            ),
            Expanded(child: SetList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /*await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputPage(
                  title: title,
                );
              },
            ),
          );
          getPostsData();*/
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}

/* void getPostsData() {
    Map responseList = exercises[title]["data"];
    List<FlSpot> responseChartList = [];
    List<Widget> listItems = [];
    double j = 0;
    responseList.forEach(
      (key, value) {
        for (int i = 0; i < value.length; i++) {
          responseChartList.add(
            FlSpot(
              j,
              value[i]["weight"].toDouble(),
            ),
          );
          j++;
        }
        listItems.add(
          ReuseableCard(
            kActiveCardColor,
            Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    key,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sets: ${value.length}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SetPage(
                      title: key,
                      exercise: title,
                    );
                  },
                ),
              );
            },
          ),
        );
        setState(
          () {
            chartData = responseChartList;
            itemsData = listItems;
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }*/
