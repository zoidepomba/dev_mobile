import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário Acadêmico'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const CalendarWidget(),
    );
  }
}

class Event {
  final DateTime date;
  final String title;

  Event(this.date, this.title);
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        const SizedBox(height: 16),
        Text(
          'Eventos do mês de ${DateFormat('MMMM yyyy').format(selectedDate)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
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
