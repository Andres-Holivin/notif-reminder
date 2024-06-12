import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:idg/application/dependency/setup_locator.dart';
import 'package:idg/data/model/note_model.dart';
import 'package:idg/data/service/local_notification_service.dart';
import 'package:idg/presentation/state/note/note_bloc.dart';
import 'package:idg/presentation/state/note/note_state.dart';
import 'package:idg/presentation/widget/card_reminder.dart';
import 'package:idg/presentation/widget/event_calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen"),
          ),
          body: Column(
            children: [
              const EventCalender(),
              Expanded(
                  child: ListView.builder(
                itemCount: state.listNote
                        ?.where((e) =>
                            e.schedule?.day == state.filterDate?.day &&
                            e.schedule?.month == state.filterDate?.month &&
                            e.schedule?.year == state.filterDate?.year)
                        .length ??
                    0,
                itemBuilder: (context, index) {
                  return CardReminder(
                    noteModel: state.listNote
                            ?.where((e) =>
                                e.schedule?.day == state.filterDate?.day &&
                                e.schedule?.month == state.filterDate?.month &&
                                e.schedule?.year == state.filterDate?.year)
                            .toList()[index] ??
                        NoteModel(),
                  );
                },
              ))
            ],
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            child: FloatingActionButton(
              onPressed: () {
                context.push("/note");
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
