import 'package:flutter/material.dart';
import 'package:lift_status/home_screen.dart';

void main() => runApp(LiftStatus());

class LiftStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreenPage(
        title: 'Lift Status',
      ),
    );
  }
}
