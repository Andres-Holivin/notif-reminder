import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:idg/data/model/note_model.dart';
import 'package:idg/presentation/state/note/note_bloc.dart';
import 'package:idg/presentation/state/note/note_event.dart';
import 'package:intl/intl.dart';

class CardReminder extends StatelessWidget {
  const CardReminder({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            noteModel.isDone
                ? const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  )
                : const SizedBox(),
            Text(
              noteModel.title?.toUpperCase() ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 6),
            Text(
              noteModel.description ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer_outlined),
                    const SizedBox(width: 4),
                    Text(DateFormat.yMMMMd().format(noteModel.schedule!)),
                    const SizedBox(width: 4),
                    Text(DateFormat.Hm().format(noteModel.schedule!))
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        context.push('/note',
                            extra: {'noteModel': noteModel.toJson()});
                      },
                      child: const Icon(
                        Icons.edit,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        context
                            .read<NoteBloc>()
                            .add(DeleteNoteEvent(deleteNoteModel: noteModel));
                      },
                      child: Icon(Icons.delete, color: Colors.red[400]),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
