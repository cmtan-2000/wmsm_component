import 'package:wmsm_component/view/shared/bar_graph/model/inidividual_bar.dart';

class BarData {
  final double mondayY;
  final double tuesdayY;
  final double wednesdayY;
  final double thursdayY;
  final double fridayY;
  final double saturdayY;
  final double sundayY;

  BarData({
    required this.mondayY,
    required this.tuesdayY,
    required this.wednesdayY,
    required this.thursdayY,
    required this.fridayY,
    required this.saturdayY,
    required this.sundayY,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(0, mondayY),
      IndividualBar(1, tuesdayY),
      IndividualBar(2, wednesdayY),
      IndividualBar(3, thursdayY),
      IndividualBar(4, fridayY),
      IndividualBar(5, saturdayY),
      IndividualBar(6, sundayY),
    ];
    print(barData[0].y);
  }

  double maxBarData() {
    double max = 0;
    for (int i = 0; i < barData.length; i++) {
      if (barData[i].y > max) {
        max = barData[i].y;
      }
    }
    print(max);
    return max;
  }
}
