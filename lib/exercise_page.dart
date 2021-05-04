import 'package:flutter/material.dart';
import 'new_set_page.dart';
import 'model/sets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'constant.dart';
import 'components/chart.dart';
import 'components/reuseable_card.dart';

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

  var test = {"hello": "there"};

  void getPostsData() {
    List<dynamic> responseList = exercises[title]["data"];
    List<Widget> listItems = [];
    responseList.forEach(
      (post) {
        listItems.add(
          ReuseableCard(
              kActiveCardColor,
              Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      post.keys.first,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sets: ${post[post.keys.first].length}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ), () {
            //go to the set list for that date where you can see more info about the sets
          }),
        );
      },
    );
    setState(
      () {
        itemsData = listItems;
      },
    );
  }

  List<FlSpot> chartData = [];
  void getChartData() {
    List<dynamic> responseList = exercises[title]["data"];
    List<FlSpot> responseChartList = [];
    double j = 0;

    responseList.forEach(
      (post) {
        for (var i = 0; i < post[post.keys.first].length; i++) {
          print(post[post.keys.first][i]["weight"]);
        }
      },
    );

    /*for (var i = responseList.length - 1; i >= 0; i--) {
      var curentIndex = lists[title][i];
      int weight = curentIndex["weight"];
      responseChartList.add(
        FlSpot(
          j,
          weight.toDouble(),
        ),
      );
      j++;
    }*/
    setState(() {
      chartData = responseChartList;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    getChartData();
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
                    gradientColor: gradientColor),
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
          getChartData();
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
