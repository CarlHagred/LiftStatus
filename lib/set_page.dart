import 'package:flutter/material.dart';
import 'model/sets.dart';
import 'constant.dart';
import 'components/reuseable_card.dart';

class SetPage extends StatefulWidget {
  SetPage({this.title, this.exercise});

  final String title;
  final String exercise;

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  String get title => widget.title;
  String get exercise => widget.exercise;

  List<Widget> itemsData = [];

  void getPostsData() {
    Map responseList = exercises[exercise]["data"];
    List covertedList = responseList[title];
    print(covertedList);
    List<Widget> listItems = [];
    covertedList.forEach(
      (element) {
        String name = element["name"];
        int weight = element["weight"];
        int reps = element["reps"];
        listItems.add(
          ReuseableCard(
            kActiveCardColor,
            GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 10) {
                  //exercises.removeWhere((key, value) => false);
                  refresh();
                }
              },
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$name: ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "${weight}kg ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Reps: $reps",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    setState(
      () {
        itemsData = listItems;
      },
    );
  }

  void refresh() {
    getPostsData();
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
            Expanded(
              child: ListView(
                children: itemsData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
