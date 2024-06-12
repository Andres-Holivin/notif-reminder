import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  factory NoteModel({
    int? id,
    String? title,
    String? description,
    DateTime? schedule,
    @Default(false) bool isDone,
  }) = _NoteModel;
  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
