import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idg/presentation/state/note/note_bloc.dart';
import 'package:idg/presentation/state/note/note_event.dart';
import 'package:idg/presentation/state/note/note_state.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({super.key});

  @override
  State<EventCalender> createState() => _EventCalenderState();
}

class _EventCalenderState extends State<EventCalender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    context.read<NoteBloc>().add(FilterNoteEvent(dateTime: DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        return TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeSelectionMode: RangeSelectionMode.disabled,
            eventLoader: (day) {
              return state.listNote
                      ?.where((e) =>
                          e.schedule?.day == day.day &&
                          e.schedule?.month == day.month &&
                          e.schedule?.year == day.year)
                      .toList() ??
                  [];
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              context
                  .read<NoteBloc>()
                  .add(FilterNoteEvent(dateTime: selectedDay));
            });
      },
    );
  }
}
