import 'package:flutter/material.dart';
import 'package:lift_status/model/exercise_data.dart';
import 'package:provider/provider.dart';

class SetList extends StatelessWidget {
  const SetList({
    Key key,
    @required this.num,
  }) : super(key: key);

  final int num;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.exercisesCount,
          itemBuilder: (context, index) {
            final set = taskData.getExercise(num).sets.sets[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 100,
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        set.name.length > 10 ? '${set.name.substring(0, 10)}...' : set.name,
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
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight: ${set.weight}    '),
                                Text('Reps: ${set.reps} '),
                              ],
                            ),
                            Text(set.date != null ?  'Date: ${set.date}' : ''),
                          ],
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
