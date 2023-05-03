import 'package:hive/hive.dart';
import 'package:wmsm_component/dashboard/model/step.dart';
import 'package:wmsm_component/shared/bar_graph/model/inidividual_bar.dart';

class BarData {
  final double? mondayY;
  final double? tuesdayY;
  final double? wednesdayY;
  final double? thursdayY;
  final double? fridayY;
  final double? saturdayY;
  final double? sundayY;

  BarData({
    this.mondayY,
    this.tuesdayY,
    this.wednesdayY,
    this.thursdayY,
    this.fridayY,
    this.saturdayY,
    this.sundayY,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(0, mondayY ?? 0),
      IndividualBar(1, tuesdayY ?? 0),
      IndividualBar(2, wednesdayY ?? 0),
      IndividualBar(3, thursdayY ?? 0),
      IndividualBar(4, fridayY ?? 0),
      IndividualBar(5, saturdayY ?? 0),
      IndividualBar(6, sundayY ?? 0),
    ];
  }

  Future<void> initializeWeekStepCount() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 6));
    final box = await Hive.openBox('stepCount');
    for (int i = 0; i < 7; i++) {
      final date = startOfWeek.add(Duration(days: i));
      if (date.isBefore(endOfWeek) || date.isAtSameMomentAs(endOfWeek)) {
        final key = 'stepCount-${date.year}-${date.month}-${date.day}';
        await box.put(key, Step(date: date, stepCount: 0));
      }
      print('date: $date');
    }
    await box.close();
  }

  double maxBarData() {
    double max = 0;
    for (int i = 0; i < barData.length; i++) {
      if (barData[i].y > max) {
        max = barData[i].y;
      }
    }
    return max;
  }
}
