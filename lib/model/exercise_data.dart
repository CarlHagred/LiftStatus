import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:lift_status/model/exercise.dart';
import 'package:lift_status/model/set.dart';
import 'dart:collection';

class ExerciseData extends ChangeNotifier {

  List<Exercise> _exercises = [
    Exercise(
      name: 'bench',
      sets: [
        Set(name: 'first set', weight: 100, reps: 6),
        Set(name: 'second set', weight: 100, reps: 6),
        Set(name: 'third set', weight: 100, reps: 6),
      ],
    ),
  ];

  UnmodifiableListView<Exercise> get exercises {
    return UnmodifiableListView(_exercises);
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