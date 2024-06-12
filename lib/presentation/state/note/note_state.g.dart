// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteStateImpl _$$NoteStateImplFromJson(Map<String, dynamic> json) =>
    _$NoteStateImpl(
      listNote: (json['listNote'] as List<dynamic>?)
          ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      noteStatus: $enumDecodeNullable(_$DataStatusEnumMap, json['noteStatus']),
      filterDate: json['filterDate'] == null
          ? null
          : DateTime.parse(json['filterDate'] as String),
      noteModel: json['noteModel'] == null
          ? null
          : NoteModel.fromJson(json['noteModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NoteStateImplToJson(_$NoteStateImpl instance) =>
    <String, dynamic>{
      'listNote': instance.listNote,
      'noteStatus': _$DataStatusEnumMap[instance.noteStatus],
      'filterDate': instance.filterDate?.toIso8601String(),
      'noteModel': instance.noteModel,
    };

const _$DataStatusEnumMap = {
  DataStatus.initial: 'initial',
  DataStatus.loading: 'loading',
  DataStatus.success: 'success',
  DataStatus.error: 'error',
};
