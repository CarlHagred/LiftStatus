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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 100,
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          exercise.name.length > 10 ? '${exercise.name.substring(0, 10)}...' : exercise.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 200,
                        child: Chart(
                          num: index,
                        ),
                      ),
                    ],
                  ),
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
