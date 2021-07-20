import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:lift_status/model/set.dart';

class SetData extends ChangeNotifier {
  int _goal = 0;
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
  void addExercise(String newSetName, int weight, int reps) {
    final set = Set(
      name: newSetName,
      weight: weight,
      reps: reps,
    );
    _sets.add(set);
    notifyListeners();
  }

  void deleteTask(Set set) {
    _sets.remove(set);
    notifyListeners();
  }

  int get goal{
    return _goal;
  }

  void setGoal(int goal){
    this._goal = goal;
    notifyListeners();
  }

  int get currentPercentageOfGoal{
    if(goal == 0){
      return 0;
    }
    int max = 0;
    _sets.forEach((element) {
      element.weight > max ? max = element.weight : max = max;
    });
    int totalProgress = (max / _goal * 100).toInt();
    return totalProgress;
  }
}