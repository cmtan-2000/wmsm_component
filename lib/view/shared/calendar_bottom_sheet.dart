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
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.today;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDay = day;
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
        selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        focusedDay: _selectedDay,
        firstDay: DateTime(2022),
        lastDay: DateTime(2030),
        onDaySelected: _onDaySelected,
      ),
      <Widget>[
        CustomElevatedButton(
            context: context,
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: const Text("Cancel")),
        CustomElevatedButton(
            context: context,
            onPressed: () {
              Navigator.pop(context, _selectedDay);
            },
            child: const Text("Confirm")),
      ].toRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      )
    ].toColumn();
  }
}
