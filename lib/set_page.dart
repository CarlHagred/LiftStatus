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
    List responseList = exercises[exercise]["data"];
    Map convertedList = responseList[0];
    print(convertedList);
    List<Widget> listItems = [];
    int i = 0;
    /*responseList.forEach(
      (post) {
        print(post[title]);
        String name = post[title][i]["name"];
        int weight = post[title][i]["weight"];
        int reps = post[title][i]["reps"];
        listItems.add(
          ReuseableCard(
            kActiveCardColor,
            Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "$name: ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${weight}kg ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "reps: $reps",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
        //print(name);
        i++;
      },
    );
    setState(
      () {
        itemsData = listItems;
      },
    );*/
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
          'hello'), /*Container(
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
      ),*/
    );
  }
}
