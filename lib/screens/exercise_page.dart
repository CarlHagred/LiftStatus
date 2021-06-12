import 'package:flutter/material.dart';
import 'package:lift_status/screens/set_page.dart';
import 'new_set_page.dart';
import '../model/set.dart';
import 'package:fl_chart/fl_chart.dart';
import '../constant.dart';
import '../widgets/chart.dart';
import '../widgets/reuseable_card.dart';
/*
class ExercisePage extends StatefulWidget {
  ExercisePage({this.title});

  final String title;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final List<Color> gradientColor = [
    Color(0xFF64FFDA),
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
  ];
  String get title => widget.title;
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];
  List<FlSpot> chartData = [];

  void getPostsData() {
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
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Chart(
                  title: title,
                  chartData: chartData,
                  gradientColor: gradientColor,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: itemsData,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputPage(
                  title: title,
                );
              },
            ),
          );
          getPostsData();
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}

 */


