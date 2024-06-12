import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idg/application/config/constant.dart';
import 'package:idg/data/model/note_model.dart';
part 'note_state.freezed.dart';
part 'note_state.g.dart';

@freezed
class NoteState with _$NoteState {
  factory NoteState(
      {List<NoteModel>? listNote,
      DataStatus? noteStatus,
      DateTime? filterDate,
      NoteModel? noteModel}) = _NoteState;
  const NoteState._();

  factory NoteState.fromJson(Map<String, dynamic> json) =>
      _$NoteStateFromJson(json);
}
