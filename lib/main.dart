import 'package:flutter/material.dart';
import 'package:lift_status/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'model/exercise_data.dart';

void main() => runApp(LiftStatus());

class LiftStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExerciseData(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomeScreenPage(
          title: 'Lift Status',
        ),
      ),
    );
  }
}
