import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wmsm_component/view/shared/bar_graph/model/bar_data.dart';

class BarChartWidget extends StatelessWidget {
  final List weeklySummary;
  const BarChartWidget({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData weekBarData = BarData(
        mondayY: weeklySummary[0],
        tuesdayY: weeklySummary[1],
        wednesdayY: weeklySummary[2],
        thursdayY: weeklySummary[3],
        fridayY: weeklySummary[4],
        saturdayY: weeklySummary[5],
        sundayY: weeklySummary[6]);
    weekBarData.initializeBarData();

    return BarChart(BarChartData(
      maxY: 1000,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, getTitlesWidget: bottomTitles),
        ),
      ),
      barTouchData: BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      barGroups: weekBarData.barData
          .map(
              (data) => BarChartGroupData(x: data.x, showingTooltipIndicators: [
                    0
                  ], barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.yellow[200],
                      width: 25,
                      borderRadius: BorderRadius.circular(8),
                      // backDrawRodData: BackgroundBarChartRodData(
                      //   show: true,
                      //   toY: 1000,
                      // )
                    )
                  ]))
          .toList(),
    ));
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);

  Widget title;
  switch (value.toInt()) {
    case 0:
      title = const Text('M', style: style);
      break;
    case 1:
      title = const Text('T', style: style);
      break;
    case 2:
      title = const Text('W', style: style);
      break;
    case 3:
      title = const Text('T', style: style);
      break;
    case 4:
      title = const Text('F', style: style);
      break;
    case 5:
      title = const Text('S', style: style);
      break;
    case 6:
      title = const Text('S', style: style);
      break;
    default:
      title = const Text('');
  }
  return SideTitleWidget(child: title, axisSide: meta.axisSide);
}
