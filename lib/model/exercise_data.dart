import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:lift_status/model/exercise.dart';
import 'package:lift_status/model/set.dart';

class ExerciseData extends ChangeNotifier {
  List<Exercise> _exercises = [
    Exercise(
      name: 'bench',
      sets: [
        Set(name: 'first set', weight: 100, reps: 6),
        Set(name: 'second set', weight: 80, reps: 6),
        Set(name: 'third set', weight: 120, reps: 6),
      ],
    ),
    Exercise(
      name: 'squats',
      sets: [
        Set(name: 'first set', weight: 100, reps: 6),
        Set(name: 'second set', weight: 120, reps: 6),
        Set(name: 'third set', weight: 80, reps: 6),
      ],
    ),
    Exercise(
      name: 'shoulder press',
      sets: [
        Set(name: 'first set', weight: 20, reps: 6),
        Set(name: 'second set', weight: 30, reps: 6),
        Set(name: 'third set', weight: 90, reps: 6),
      ],
    ),
  ];

  UnmodifiableListView<Exercise> get exercises {
    return UnmodifiableListView(_exercises);
  }

  List<FlSpot> setWeigtsFlSpot(Exercise exercise) {
    List<FlSpot> chartData = [];
    double j = 0;
    _exercises.elementAt(_exercises.indexOf(exercise)).sets.forEach(
      (element) {
        chartData.add(FlSpot(
          j,
          element.weight.toDouble(),
        ));
        j++;
      },
    );

    return chartData;
  }

  int get exercisesCount {
    return _exercises.length;
  }

  Exercise getExercise(int index) {
    return _exercises.elementAt(index);
  }

  void addExercise(String newExerciseName) {
    final exercise = Exercise(
      name: newExerciseName,
      sets: [],
    );
    _exercises.add(exercise);
    notifyListeners();
  }

  void updateTask(Exercise exercise) {
    _exercises.remove(exercise);
    _exercises.add(exercise);
    notifyListeners();
  }

  void deleteTask(Exercise exercise) {
    _exercises.remove(exercise);
    notifyListeners();
  }
}

var exercises = {
  "bench": {
    "pb": 120,
    "data": {
      "2021-04-16": [
        {
          "name": "first set",
          "weight": 100,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
      ],
      "2021-04-17": [
        {
          "name": "first set",
          "weight": 100,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 90,
          "reps": 6,
        },
      ],
    },
  },
  "biceps": {
    "pb": 120,
    "data": {
      "2021-04-16": [
        {
          "name": "first set",
          "weight": 100,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 120,
          "reps": 6,
        },
      ],
      "2021-04-17": [
        {
          "name": "first set",
          "weight": 100,
          "reps": 6,
        },
        {
          "name": "second set",
          "weight": 90,
          "reps": 6,
        },
      ],
    },
  }
};
