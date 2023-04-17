import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/view/shared/bar_graph/widget/bar_chart.dart';
import 'package:wmsm_component/view/shared/calendar_bottom_sheet.dart';
import 'package:wmsm_component/viewmodel/steps/steps_service.dart';

class steps_tab extends StatefulWidget {
  const steps_tab({super.key});

  @override
  State<steps_tab> createState() => _steps_tabState();
}

class _steps_tabState extends State<steps_tab> {
  final StepsServices stepsServices = StepsServices();
  DateTime today = DateTime.now();
  late List<double> weeklySteps;
  late int todayDay;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    weeklySteps = stepsServices.getWeeklySteps(today);
  }

//SERVICES
  String totalSteps() {
    double total = 0;
    for (var i = 0; i < weeklySteps.length; i++) {
      total += weeklySteps[i];
    }
    return total.toStringAsFixed(0);
  }

  String averageSteps() {
    double total = 0;
    for (var i = 0; i < weeklySteps.length; i++) {
      total += weeklySteps[i];
    }
    return (total / weeklySteps.length).toStringAsFixed(2);
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _calendarSelector(BuildContext context) async {
    final selectedDay = await showModalBottomSheet<DateTime>(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isDismissible: true,
      barrierColor: Colors.grey[800],
      context: context,
      builder: (BuildContext context) {
        return Flexible(
          child: CalendarBottomSheet(
            today: today,
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        today = selectedDay;
      });
    }
  }

  String getWeekDays(DateTime today) {
    List<DateTime> weekDays = [];
    DateTime firstDayOfThisWeek =
        today.subtract(Duration(days: today.weekday - 1));
    DateTime lastDayOfThisWeek = firstDayOfThisWeek.add(Duration(days: 6));
    for (var i = 0; i < 7; i++) {
      DateTime date = firstDayOfThisWeek.add(Duration(days: i));
      weekDays.add(date);
    }
    setState(() {
      todayDay = today.weekday - 1;
    });

    return "${weekDays[0].day}th - ${weekDays[6].day}th(${DateFormat('MMMM').format(weekDays[0])}${weekDays[0].year})";
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        <Widget>[
          const Text("This week steps")
              .fontSize(20)
              .fontWeight(FontWeight.bold),
          Text(getWeekDays(today)).fontSize(12),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        ),
        ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          onPressed: () {
            _calendarSelector(context);
          },
          child: <Widget>[
            const Text(
              "Calendar",
              style: TextStyle(color: Colors.black),
            ).fontSize(12),
            const Icon(Icons.keyboard_arrow_down,
                color: Colors.black, size: 12),
          ].toRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ]
          .toRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .padding(bottom: 50),
      //Chart Here
      Expanded(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: BarChartWidget(weeklySummary: weeklySteps, todayDay: todayDay),
        ).padding(bottom: 50),
      ),
      //Total and Average
      <Widget>[
        Text("Total Steps This Week").fontSize(15).fontWeight(FontWeight.bold),
        Text(totalSteps()).fontSize(15).fontWeight(FontWeight.bold),
      ].toRow(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      Divider(
        color: Colors.grey[400],
      ).paddingDirectional(vertical: 20),
      <Widget>[
        Text("Average Daily Steps This Week")
            .fontSize(15)
            .fontWeight(FontWeight.bold),
        Text(averageSteps()).fontSize(15).fontWeight(FontWeight.bold),
      ].toRow(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min);
  }
}
