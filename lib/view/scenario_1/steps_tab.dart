import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wmsm_component/view/custom/widgets/custom_elevatedbutton.dart';
import 'package:wmsm_component/view/shared/bar_graph/widget/bar_chart.dart';
import 'package:wmsm_component/view/shared/calendar_bottom_sheet.dart';

class steps_tab extends StatefulWidget {
  const steps_tab({super.key});

  @override
  State<steps_tab> createState() => _steps_tabState();
}

class _steps_tabState extends State<steps_tab> {
  DateTime today = DateTime.now();
  List<double> weeklySteps = [5, 50, 550, 510, 30, 10, 20];

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
        return CalendarBottomSheet(today: today);
      },
    );

    if (selectedDay != null) {
      setState(() {
        today = selectedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        <Widget>[
          const Text("This week steps")
              .fontSize(20)
              .fontWeight(FontWeight.bold),
          const Text("10th - 16th(April 2023)").fontSize(12),
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
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: BarChartWidget(weeklySummary: weeklySteps),
      )
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max);
  }
}
