import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário Acadêmico'),
      ),
      body: CalendarWidget(),
    );
  }
}

class Event {
  final DateTime date;
  final String title;

  Event(this.date, this.title);
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Map<DateTime, List<Event>> events = {
    DateTime(2023, 6, 3): [
      Event(DateTime(2023, 6, 3), 'Jogo marcado no Parque do Sabia as 18:30'),
    ],
    DateTime(2023, 9, 10): [
      Event(DateTime(2023, 9, 10),
          'Palestra :Tendências da Tecnologia da Informação'),
    ],
    DateTime(2023, 7, 7): [
      Event(DateTime(2023, 7, 7), 'Festival do Turismo'),
    ],
    DateTime(2023, 6, 31): [
      Event(DateTime(2023, 6, 31), 'Data de Entrega do Projeto Científico'),
    ],
  };

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  Widget _buildEventList(DateTime day) {
    List<Event> dayEvents = _getEventsForDay(day);

    if (dayEvents.isEmpty) {
      return Container(); // Retorna um container vazio se não houver eventos
    }

    return Column(
      children: dayEvents
          .map(
            (event) => ListTile(
              title: Text(dateFormat.format(event.date)),
              subtitle: Text(event.title),
            ),
          )
          .toList(),
    );
  }

  void _updateEvents() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime(2023),
          lastDay: DateTime(2023, 12, 31),
          focusedDay: selectedDate,
          calendarFormat: CalendarFormat.month,
          eventLoader: (date) => _getEventsForDay(date),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              selectedDate = focusedDay;
            });
            _updateEvents();
          },
        ),
        SizedBox(height: 16),
        Text(
          'Eventos do mês de ${DateFormat('MMMM yyyy').format(selectedDate)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount:
                DateTime(selectedDate.year, selectedDate.month + 1, 0).day,
            itemBuilder: (context, index) {
              DateTime day =
                  DateTime(selectedDate.year, selectedDate.month, index + 1);
              return _buildEventList(day);
            },
          ),
        ),
      ],
    );
  }
}
