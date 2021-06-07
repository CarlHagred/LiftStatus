import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../constant.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.title,
    @required this.chartData,
    @required this.gradientColor,
  }) : super(key: key);

  final String title;
  final List<FlSpot> chartData;
  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
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
        maxX: chartData.length.toDouble() - 1,
        minY: 0,
        maxY: 250,
        lineBarsData: [
          LineChartBarData(
              spots: chartData,
              isCurved: true,
              barWidth: 5,
              colors: gradientColor,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColor
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              )),
        ],
      ),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
