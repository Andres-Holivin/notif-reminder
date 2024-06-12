import 'package:equatable/equatable.dart';
import 'package:idg/data/model/note_model.dart';

sealed class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChangeFormField extends NoteEvent {
  final NoteModel noteModel;
  ChangeFormField({required this.noteModel});
}

final class InsertNoteEvent extends NoteEvent {
  final NoteModel insertNoteModel;
  InsertNoteEvent({required this.insertNoteModel});
}

final class DeleteNoteEvent extends NoteEvent {
  final NoteModel deleteNoteModel;
  DeleteNoteEvent({required this.deleteNoteModel});
}

final class UpdateNoteEvent extends NoteEvent {
  final NoteModel upsertNoteModel;
  UpdateNoteEvent({required this.upsertNoteModel});
}

final class FilterNoteEvent extends NoteEvent {
  final DateTime dateTime;
  FilterNoteEvent({required this.dateTime});
}
