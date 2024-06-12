import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:idg/application/config/constant.dart';
import 'package:idg/application/dependency/setup_locator.dart';
import 'package:idg/data/model/note_model.dart';
import 'package:idg/data/service/local_notification_service.dart';
import 'package:idg/presentation/state/note/note_event.dart';
import 'package:idg/presentation/state/note/note_state.dart';

class NoteBloc extends HydratedBloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState(noteStatus: DataStatus.initial)) {
    on<InsertNoteEvent>((event, emit) {
      emit(state.copyWith(noteStatus: DataStatus.loading));
      try {
        List<NoteModel> listNote = List.from(state.listNote ?? []);
        var data = event.insertNoteModel
            .copyWith(id: (listNote.isEmpty ? 0 : listNote.last.id)! + 1);
        listNote.add(data);
        emit(state.copyWith(listNote: listNote));
        getIt<LocalNotificationService>().zonedScheduleNotification(
            scheduledDate: data.schedule ?? DateTime.now(),
            payload: data.toJson().toString(),
            title: data.title ?? "",
            body: data.description ?? "",
            id: data.id ?? 1);
      } catch (e) {
        emit(state.copyWith(noteStatus: DataStatus.error));
      }
    });
    on<UpdateNoteEvent>((event, emit) {
      emit(state.copyWith(noteStatus: DataStatus.loading));
      try {
        List<NoteModel> listNote = List.from(state.listNote ?? []);
        int index = listNote
            .indexWhere((element) => element.id == event.upsertNoteModel.id);
        listNote[index] = event.upsertNoteModel;
        emit(state.copyWith(listNote: listNote));
        getIt<LocalNotificationService>()
            .cancelNotification(event.upsertNoteModel.id ?? 0);
        getIt<LocalNotificationService>().zonedScheduleNotification(
            scheduledDate: event.upsertNoteModel.schedule ?? DateTime.now(),
            payload: listNote.last.toJson().toString(),
            title: event.upsertNoteModel.title ?? "",
            body: event.upsertNoteModel.description ?? "",
            id: event.upsertNoteModel.id ?? 0);
      } catch (e) {
        emit(state.copyWith(noteStatus: DataStatus.error));
      }
    });
    on<DeleteNoteEvent>((event, emit) {
      emit(state.copyWith(noteStatus: DataStatus.loading));
      try {
        List<NoteModel> listNote = List.from(state.listNote ?? []);
        listNote
            .removeWhere((element) => element.id == event.deleteNoteModel.id);
        emit(state.copyWith(listNote: listNote));
        getIt<LocalNotificationService>()
            .cancelNotification(event.deleteNoteModel.id ?? 0);
      } catch (e) {
        emit(state.copyWith(noteStatus: DataStatus.error));
      }
    });
    on<FilterNoteEvent>((event, emit) {
      try {
        emit(state.copyWith(filterDate: event.dateTime));
      } catch (e) {
        emit(state.copyWith(noteStatus: DataStatus.error));
      }
    });
  }

  @override
  NoteState? fromJson(Map<String, dynamic> json) {
    return NoteState.fromJson(json['note']);
  }

  @override
  Map<String, dynamic>? toJson(NoteState state) {
    return {'note': state.toJson()};
  }
}
