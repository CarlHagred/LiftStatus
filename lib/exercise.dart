import 'package:flutter/material.dart';
import 'input_page.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({this.title});

  final String title;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
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
              'Press the plus button to add a new set',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InputPage();
          }));
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
