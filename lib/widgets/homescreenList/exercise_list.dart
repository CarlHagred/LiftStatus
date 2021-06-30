import 'package:flutter/material.dart';
import 'package:lift_status/model/exercise_data.dart';
import 'package:lift_status/screens/exercise_page.dart';
import 'package:lift_status/widgets/exerciseDiagram/chart.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.exercisesCount,
          itemBuilder: (context, index) {
            final exercise = taskData.exercises[index];
            return Container(
              height: 100,
              margin: EdgeInsets.all(2),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        '${exercise.name}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Chart(
                          num: index,
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[800],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExercisePage(
                          exercise: exercise,
                          num: index,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
