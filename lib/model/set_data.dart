import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:lift_status/model/set.dart';

class SetData extends ChangeNotifier {
  List<Set> _sets = [
    Set(name: 'first set', weight: 20, reps: 6),
    Set(name: 'second set', weight: 30, reps: 6),
    Set(name: 'third set', weight: 90, reps: 6),
  ];

  UnmodifiableListView<Set> get sets {
    return UnmodifiableListView(_sets);
  }

  int get exercisesCount {
    return _sets.length;
  }

  Set getExercise(int index) {
    return _sets.elementAt(index);
  }

  List<FlSpot> getWeigtsFlSpot() {
    List<FlSpot> chartData = [];
    _sets.asMap().forEach((index, element) {
      chartData.add(
          FlSpot(
              index.toDouble(),
              element.weight.toDouble()
          )
      );
    });
    return chartData;
  }
}