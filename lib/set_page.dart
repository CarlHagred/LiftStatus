import 'package:flutter/material.dart';
import 'model/sets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'constant.dart';
import 'components/chart.dart';
import 'components/reuseable_card.dart';

class SetPage extends StatefulWidget {
  SetPage({this.title});

  final String title;

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
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
