import 'package:flutter/material.dart';
import 'new_set_page.dart';
import 'model/sets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'constant.dart';

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

  void getPostsData() {
    List<dynamic> responseList = lists[title];
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.grey[800],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 10.0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["date"],
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      post["name"],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Repetitions: ${post["reps"]}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: double.infinity,
                  child: Text(
                    "${post["weight"]}Kg",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  List<FlSpot> chartData = [];
  void getChartData() {
    List<FlSpot> responseChartList = [];
    double j = 0;
    for (var i = lists[title].length - 1; i >= 0; i--) {
      var curentIndex = lists[title][i];
      int weight = curentIndex["weight"];
      responseChartList.add(
        FlSpot(
          j,
          weight.toDouble(),
        ),
      );
      j++;
    }
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
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: false,
                      ),
                      leftTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    backgroundColor: kActiveCardColor,
                    minX: 0,
                    maxX: lists[title].length.toDouble() - 1,
                    minY: 0,
                    maxY: 250,
                    lineBarsData: [
                      LineChartBarData(
                          spots: chartData,
                          isCurved: true,
                          barWidth: 5,
                          colors: gradientColor,
                          belowBarData: BarAreaData(
                            show: true,
                            colors: gradientColor
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          )),
                    ],
                  ),
                  swapAnimationDuration:
                      Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
