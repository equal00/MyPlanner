import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async {
  await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPlanner App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TableCalendarScreen(),
    );
  }
}

class TableCalendarScreen extends StatefulWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);

  @override
  TableCalendarScreenState createState() => TableCalendarScreenState();
}

class TableCalendarScreenState extends State<TableCalendarScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '전체적인 일정',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: TableCalendar(
        locale: 'ko_KR',
        firstDay: DateTime.utc(2024, 1, 1), // 시작 날짜
        lastDay: DateTime.utc(2034, 12, 31), // 종료 날짜
        focusedDay: DateTime.now(), // 현재 날짜 ㅍ시

        // 다른날짜 터치 시 발생하는 이벤트
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          setState(
            () {
              this.selectedDay = selectedDay;
              this.focusedDay = focusedDay;
            },
          );
        },
        selectedDayPredicate: (DateTime day) {
          return isSameDay(selectedDay, day);
        },

        // 달력의 head 스타일
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
          ),
          headerPadding: EdgeInsets.symmetric(vertical: 4.0),
          leftChevronIcon: Icon(
            Icons.arrow_left,
            size: 40.0,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_right,
            size: 40.0,
          ),
        ),

        // 달력 내부의 스타일
        calendarStyle: const CalendarStyle(
          canMarkersOverflow: false,

          // 사용자가 선택한 날짜 스타일
          selectedTextStyle:
              TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0),

          // 주말 스타일
          weekendTextStyle: TextStyle(
            color: Color(0xFFD1180B),
          ),

          // 사용자가 지정한 휴일 스타일
          holidayTextStyle: TextStyle(
            color: Color(0xFFD1180B),
          ),

          // firstDay와 lastDay에 포함되지 않는 날짜 (아직 구현 X)
          disabledTextStyle: TextStyle(
            color: Color(0xFFBFBFBF),
          ),
        ),
      ),
      bottomNavigationBar: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.home,
            size: 40,
          )
        ],
      ),
    );
  }
}
