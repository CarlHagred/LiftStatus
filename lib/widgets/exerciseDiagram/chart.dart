import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lift_status/model/exercise_data.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.num,
  }) : super(key: key);

  final int num;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(
      builder: (context, taskData, child) {
        final exercise = taskData.getExercise(num);
        return LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: false,
              ),
              leftTitles: SideTitles(
                showTitles: false,
              ),
            ),
            backgroundColor: kActiveCardColor,
            minX: 0,
            maxX: exercise.sets.sets.length.toDouble() - 1,
            minY: 0,
            maxY: 250,
            lineBarsData: [
              LineChartBarData(
                  spots: exercise.sets.getWeigtsFlSpot(),
                  dotData: FlDotData(show: false),
                  isCurved: true,
                  barWidth: 5,
                  colors: kGradientColor,
                  belowBarData: BarAreaData(
                    show: true,
                    colors: kGradientColor
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  )),
            ],
          ),
          swapAnimationDuration: Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        );
      },
    );
  }
}
