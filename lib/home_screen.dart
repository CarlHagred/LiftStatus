import 'package:lift_status/exercise_page.dart';
import 'package:flutter/material.dart';
import 'model/sets.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({this.title});

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  double topContainer = 0;
  ScrollController controller = ScrollController();
  List<Widget> itemsData = [];
  void getPostsData() {
    List<Widget> responseList = [];
    for (var i = 0; i < exercises.length; i++) {
      responseList.add(
        Container(
          height: 50,
          margin: EdgeInsets.all(2),
          child: ElevatedButton(
            child: Center(
              child: Text(
                '${exercises.keys.elementAt(i)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[800],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ExercisePage(title: exercises.keys.elementAt(i));
                  },
                ),
              );
            },
          ),
        ),
      );
    }
    setState(() {
      itemsData = responseList;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: itemsData,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Exercise'),
                content: TextField(
                  onChanged: (value) {},
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: "Type the name of the exercise"),
                ),
                actions: [
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      if (myController.text.isNotEmpty) {
                        setState(() {
                          exercises['${myController.text}'] = {
                            "pb": 0,
                            "data": {}
                          };
                        });
                        getPostsData();
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
