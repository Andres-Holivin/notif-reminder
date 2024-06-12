// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteState _$NoteStateFromJson(Map<String, dynamic> json) {
  return _NoteState.fromJson(json);
}

/// @nodoc
mixin _$NoteState {
  List<NoteModel>? get listNote => throw _privateConstructorUsedError;
  DataStatus? get noteStatus => throw _privateConstructorUsedError;
  DateTime? get filterDate => throw _privateConstructorUsedError;
  NoteModel? get noteModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteStateCopyWith<NoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) =
      _$NoteStateCopyWithImpl<$Res, NoteState>;
  @useResult
  $Res call(
      {List<NoteModel>? listNote,
      DataStatus? noteStatus,
      DateTime? filterDate,
      NoteModel? noteModel});

  $NoteModelCopyWith<$Res>? get noteModel;
}

/// @nodoc
class _$NoteStateCopyWithImpl<$Res, $Val extends NoteState>
    implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listNote = freezed,
    Object? noteStatus = freezed,
    Object? filterDate = freezed,
    Object? noteModel = freezed,
  }) {
    return _then(_value.copyWith(
      listNote: freezed == listNote
          ? _value.listNote
          : listNote // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>?,
      noteStatus: freezed == noteStatus
          ? _value.noteStatus
          : noteStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus?,
      filterDate: freezed == filterDate
          ? _value.filterDate
          : filterDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noteModel: freezed == noteModel
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteModelCopyWith<$Res>? get noteModel {
    if (_value.noteModel == null) {
      return null;
    }

    return $NoteModelCopyWith<$Res>(_value.noteModel!, (value) {
      return _then(_value.copyWith(noteModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoteStateImplCopyWith<$Res>
    implements $NoteStateCopyWith<$Res> {
  factory _$$NoteStateImplCopyWith(
          _$NoteStateImpl value, $Res Function(_$NoteStateImpl) then) =
      __$$NoteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NoteModel>? listNote,
      DataStatus? noteStatus,
      DateTime? filterDate,
      NoteModel? noteModel});

  @override
  $NoteModelCopyWith<$Res>? get noteModel;
}

/// @nodoc
class __$$NoteStateImplCopyWithImpl<$Res>
    extends _$NoteStateCopyWithImpl<$Res, _$NoteStateImpl>
    implements _$$NoteStateImplCopyWith<$Res> {
  __$$NoteStateImplCopyWithImpl(
      _$NoteStateImpl _value, $Res Function(_$NoteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listNote = freezed,
    Object? noteStatus = freezed,
    Object? filterDate = freezed,
    Object? noteModel = freezed,
  }) {
    return _then(_$NoteStateImpl(
      listNote: freezed == listNote
          ? _value._listNote
          : listNote // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>?,
      noteStatus: freezed == noteStatus
          ? _value.noteStatus
          : noteStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus?,
      filterDate: freezed == filterDate
          ? _value.filterDate
          : filterDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noteModel: freezed == noteModel
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteStateImpl extends _NoteState {
  _$NoteStateImpl(
      {final List<NoteModel>? listNote,
      this.noteStatus,
      this.filterDate,
      this.noteModel})
      : _listNote = listNote,
        super._();

  factory _$NoteStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteStateImplFromJson(json);

  final List<NoteModel>? _listNote;
  @override
  List<NoteModel>? get listNote {
    final value = _listNote;
    if (value == null) return null;
    if (_listNote is EqualUnmodifiableListView) return _listNote;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DataStatus? noteStatus;
  @override
  final DateTime? filterDate;
  @override
  final NoteModel? noteModel;

  @override
  String toString() {
    return 'NoteState(listNote: $listNote, noteStatus: $noteStatus, filterDate: $filterDate, noteModel: $noteModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteStateImpl &&
            const DeepCollectionEquality().equals(other._listNote, _listNote) &&
            (identical(other.noteStatus, noteStatus) ||
                other.noteStatus == noteStatus) &&
            (identical(other.filterDate, filterDate) ||
                other.filterDate == filterDate) &&
            (identical(other.noteModel, noteModel) ||
                other.noteModel == noteModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listNote),
      noteStatus,
      filterDate,
      noteModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteStateImplCopyWith<_$NoteStateImpl> get copyWith =>
      __$$NoteStateImplCopyWithImpl<_$NoteStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteStateImplToJson(
      this,
    );
  }
}

abstract class _NoteState extends NoteState {
  factory _NoteState(
      {final List<NoteModel>? listNote,
      final DataStatus? noteStatus,
      final DateTime? filterDate,
      final NoteModel? noteModel}) = _$NoteStateImpl;
  _NoteState._() : super._();

  factory _NoteState.fromJson(Map<String, dynamic> json) =
      _$NoteStateImpl.fromJson;

  @override
  List<NoteModel>? get listNote;
  @override
  DataStatus? get noteStatus;
  @override
  DateTime? get filterDate;
  @override
  NoteModel? get noteModel;
  @override
  @JsonKey(ignore: true)
  _$$NoteStateImplCopyWith<_$NoteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
