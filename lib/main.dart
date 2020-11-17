import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MonthCellCustomization());

class MonthCellCustomization extends StatefulWidget {
  @override
  MonthCellCustomizationState createState() => MonthCellCustomizationState();
}

class MonthCellCustomizationState extends State<MonthCellCustomization> {
  Color _bgColor,_trailingDatesBGColor, _leadingDatesBGColor,_todayBGColor;

  @override
  void initState() {
    _bgColor = Color(0xFFc5858);
    _trailingDatesBGColor = Color(0xFFfd8c04);
    _leadingDatesBGColor = Color(0xFFedf285);
    _todayBGColor=Colors.cyan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: _getDataSource(),
            monthViewSettings: MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                  todayBackgroundColor: _todayBGColor,
                    backgroundColor: _bgColor,
                    trailingDatesBackgroundColor: _trailingDatesBGColor,
                    leadingDatesBackgroundColor: _leadingDatesBGColor)),
            onViewChanged: calendarViewChanged,
          ),
        )));
  }

  void calendarViewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      setState(() {
        var midDate = viewChangedDetails
            .visibleDates[viewChangedDetails.visibleDates.length ~/ 2];
        if (midDate.month == 1) {
          _bgColor = Colors.amber;
          _trailingDatesBGColor = Color(0xFFedf285);
          _leadingDatesBGColor = Color(0xFF30475e);
        } else if (midDate.month == 2) {
          _bgColor = Colors.purple;
          _trailingDatesBGColor = Color(0xFF30475e);
          _leadingDatesBGColor = Color(0xFFf05454);
        } else if (midDate.month == 3) {
          _bgColor = Colors.indigoAccent;
          _trailingDatesBGColor = Colors.cyan;
          _leadingDatesBGColor = Color(0xFFffdada);
        }else if (midDate.month == 4) {
          _bgColor = Colors.greenAccent;
          _trailingDatesBGColor = Color(0xFFffdada);
          _leadingDatesBGColor = Colors.deepPurple;
        }else if (midDate.month == 5) {
          _bgColor = Color(0xFFffdada);
          _trailingDatesBGColor = Colors.cyan;
          _leadingDatesBGColor = Colors.deepPurple;
        }else if (midDate.month == 6) {
          _bgColor = Colors.purple;
          _trailingDatesBGColor = Color(0xFFf05454);
          _leadingDatesBGColor = Color(0xFFffdada);
        }else if (midDate.month == 7) {
          _bgColor = Colors.purple;
          _trailingDatesBGColor = Color(0xFFf05454);
          _leadingDatesBGColor = Color(0xFFf3bad6);
        }else if (midDate.month == 8) {
          _bgColor = Color(0xFFf05454);
          _trailingDatesBGColor = Colors.lightGreenAccent;
          _leadingDatesBGColor = Colors.deepPurple;
        }else if (midDate.month == 9) {
          _bgColor =Color(0xFFf05454);
          _trailingDatesBGColor = Colors.cyan;
          _leadingDatesBGColor = Color(0xFF9088d4);
        }else if (midDate.month == 10) {
          _bgColor = Color(0xFFf05454);
          _trailingDatesBGColor = Colors.cyan;
          _leadingDatesBGColor = Color(0xFFcad315);
        }else if (midDate.month == 11) {
          _bgColor = Colors.purple;
          _trailingDatesBGColor = Colors.cyan;
          _leadingDatesBGColor = Color(0xFFd37815);
        }
        else {
          _bgColor = Colors.deepPurple;
          _trailingDatesBGColor = Colors.green;
          _leadingDatesBGColor = Colors.cyan;
        }
      });
    });
  }

  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 4)),
      endTime: DateTime.now().add(Duration(hours: 5)),
      subject: 'Meeting',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 5)),
      subject: 'Development Meeting   New York, U.S.A',
      color: Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      subject: 'Support - Web Meeting   Dubai, UAE',
      color: Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 1)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      subject: 'Project Release Meeting   Istanbul, Turkey',
      color: Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
        endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
        subject: 'Release Meeting',
        color: Colors.lightBlueAccent,
        isAllDay: true));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
      subject: 'Customer Meeting   Tokyo, Japan',
      color: Color(0xFFffb8d62),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
