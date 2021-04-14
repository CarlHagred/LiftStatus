import 'package:lift_status/exercise.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({this.title});

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
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
            /*TODO Lägg till ternary operator med funktion som kollar om litsan av övningar är tom. är den det ska texten nedan visas och annars ska övningarna visas. */
            Text(
              'Press the plus button to add exercises',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ExercisePage(title: 'bänk');
          }));
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
