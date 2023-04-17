import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wmsm_component/view/custom/widgets/custom_elevatedbutton.dart';

class CalendarBottomSheet extends StatefulWidget {
  final DateTime today;
  const CalendarBottomSheet({Key? key, required this.today}) : super(key: key);

  @override
  _CalendarBottomSheetState createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime today;

  @override
  void initState() {
    super.initState();
    today = widget.today;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TableCalendar(
        rowHeight: 50,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          tableBorder: TableBorder(
            top: BorderSide(color: Colors.grey[300]!),
            bottom: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: lastDay(),
        onDaySelected: _onDaySelected,
      ),
      <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          child: CustomElevatedButton(
              context: context,
              onPressed: () {
                Navigator.pop(context, null);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: const Text("Cancel",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 16))),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          child: CustomElevatedButton(
              context: context,
              onPressed: () {
                Navigator.pop(context, today);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.yellow[500],
              ),
              child: const Text("Confirm",
                  style: TextStyle(color: Colors.black, fontSize: 16))),
        ),
      ]
          .toRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
          .padding(top: 20)
    ].toColumn();
  }
}

DateTime lastDay() {
  DateTime now = DateTime.now();
  int daysUntilSunday = 7 - now.weekday;
  DateTime endOfWeek = now.add(Duration(days: daysUntilSunday));
  return endOfWeek;
}
