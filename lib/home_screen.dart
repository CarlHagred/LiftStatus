import 'package:lift_status/exercise.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreenPage(title: 'Lift Status'),
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key key, this.title}) : super(key: key);

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
            return Exercise(name: 'bänk');
          }));
        },
        tooltip: 'newExercise',
        child: Icon(Icons.add),
      ),
    );
  }
}
