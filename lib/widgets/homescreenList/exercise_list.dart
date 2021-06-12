import 'package:flutter/material.dart';
import 'package:lift_status/model/exercise_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.exercisesCount,
          itemBuilder: (context, index) {
            final task = taskData.exercises[index];
            return Container(
              height: 50,
              margin: EdgeInsets.all(2),
              child: ElevatedButton(
                child: Center(
                  child: Text(
                    '${task.name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[800],
                ),
                onPressed: () {
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExercisePage(title: task);
                      },
                    ),
                  );*/
                },
              ),
            );
          },
        );
      },
    );
  }
}
