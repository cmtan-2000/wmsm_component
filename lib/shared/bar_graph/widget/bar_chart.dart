import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wmsm_component/shared/bar_graph/model/bar_data.dart';

class BarChartWidget extends StatefulWidget {
  final List weeklySummary;
  final int todayDay;
  const BarChartWidget(
      {super.key, required this.weeklySummary, required this.todayDay});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  int get dayToday => widget.todayDay;

  @override
  Widget build(BuildContext context) {
    BarData weekBarData = BarData(
        mondayY: widget.weeklySummary[0],
        tuesdayY: widget.weeklySummary[1],
        wednesdayY: widget.weeklySummary[2],
        thursdayY: widget.weeklySummary[3],
        fridayY: widget.weeklySummary[4],
        saturdayY: widget.weeklySummary[5],
        sundayY: widget.weeklySummary[6]);
    weekBarData.initializeBarData();
    weekBarData.initializeWeekStepCount();
    double maxY = weekBarData.maxBarData();
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: BarChart(BarChartData(
        maxY: maxY,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitlesWithDayToday(dayToday)),
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
                rod.toY.toString(),
                TextStyle(
                  color:
                      rod.fromY == widget.todayDay ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        barGroups: weekBarData.barData
            .map((data) =>
                BarChartGroupData(x: data.x, showingTooltipIndicators: [
                  0
                ], barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: data.x.toInt() == widget.todayDay
                        ? Colors.yellow[600]
                        : Colors.grey[350],
                    width: 25,
                    borderRadius: BorderRadius.circular(8),
                  )
                ]))
            .toList(),
      )),
    );
  }
}

Widget Function(double, TitleMeta) bottomTitlesWithDayToday(int dayToday) {
  return (value, meta) {
    return bottomTitles(value, meta, dayToday);
  };
}

Widget bottomTitles(double value, TitleMeta meta, int dayToday) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);

  const activeStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11);
  Widget title;
  switch (value.toInt()) {
    case 0:
      title = Text('M', style: dayToday == 0 ? activeStyle : style);
      break;
    case 1:
      title = Text('T', style: dayToday == 1 ? activeStyle : style);
      break;
    case 2:
      title = Text('W', style: dayToday == 2 ? activeStyle : style);
      break;
    case 3:
      title = Text('T', style: dayToday == 3 ? activeStyle : style);
      break;
    case 4:
      title = Text('F', style: dayToday == 4 ? activeStyle : style);
      break;
    case 5:
      title = Text('S', style: dayToday == 5 ? activeStyle : style);
      break;
    case 6:
      title = Text('S', style: dayToday == 6 ? activeStyle : style);
      break;
    default:
      title = Text('');
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: title);
}
