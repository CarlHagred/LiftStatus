import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  Exercise({this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ExercisePage(title: name),
    );
  }
}

class ExercisePage extends StatefulWidget {
  ExercisePage({Key key, this.title}) : super(key: key);

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
              'Press the plus button to add exercises',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
