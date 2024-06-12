import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idg/application/dependency/setup_locator.dart';
import 'package:idg/data/model/note_model.dart';
import 'package:idg/data/service/local_notification_service.dart';
import 'package:idg/presentation/state/note/note_bloc.dart';
import 'package:idg/presentation/state/note/note_event.dart';
import 'package:idg/presentation/state/note/note_state.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, this.noteModel});
  final NoteModel? noteModel;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController dateInput = TextEditingController(),
      timeInput = TextEditingController(),
      titleInput = TextEditingController(),
      descriptionInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late NoteModel noteModel;

  @override
  void initState() {
    noteModel = widget.noteModel ?? NoteModel(schedule: DateTime.now());
    dateInput.text = DateFormat("dd/MM/yyyy").format(noteModel.schedule!);
    timeInput.text = DateFormat("HH:mm").format(noteModel.schedule!);
    titleInput.text = noteModel.title ?? "";
    descriptionInput.text = noteModel.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: titleInput,
                        decoration: const InputDecoration(
                          hintText: "Tile",
                        ),
                        onSaved: (value) {
                          noteModel = noteModel.copyWith(title: value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: descriptionInput,
                        minLines: 12,
                        maxLines: 16,
                        decoration: const InputDecoration(
                          hintText: "Description",
                        ),
                        onSaved: (value) {
                          noteModel = noteModel.copyWith(description: value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Reminder",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              readOnly: true,
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                    initialDate: noteModel.schedule
                                                ?.compareTo(DateTime.now()) ==
                                            -1
                                        ? DateTime.now()
                                        : noteModel.schedule!);
                                if (date != null) {
                                  setState(() {
                                    DateTime resDate = noteModel.schedule!
                                        .copyWith(
                                            day: date.day,
                                            month: date.month,
                                            year: date.year);
                                    noteModel =
                                        noteModel.copyWith(schedule: resDate);
                                    dateInput.text = DateFormat("dd/MM/yyyy")
                                        .format(noteModel.schedule!);
                                  });
                                }
                              },
                              controller: dateInput,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              focusNode: AlwaysDisabledFocusNode(),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        noteModel.schedule ?? DateTime.now()));
                                if (time != null) {
                                  setState(() {
                                    DateTime resDate = noteModel.schedule!
                                        .copyWith(
                                            hour: time.hour,
                                            minute: time.minute);
                                    noteModel =
                                        noteModel.copyWith(schedule: resDate);
                                    timeInput.text =
                                        DateFormat("HH:mm").format(resDate);
                                  });
                                }
                              },
                              controller: timeInput,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.timer_sharp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        clipBehavior: Clip.hardEdge,
                        onPressed: () {
                          formKey.currentState?.save();
                          if (noteModel.id != null) {
                            context.read<NoteBloc>().add(
                                UpdateNoteEvent(upsertNoteModel: noteModel));
                          } else {
                            context.read<NoteBloc>().add(
                                InsertNoteEvent(insertNoteModel: noteModel));
                          }
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
