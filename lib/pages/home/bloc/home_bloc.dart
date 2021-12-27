import 'package:bloc/bloc.dart';

import 'package:green_notes/repo.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final folderRepo = GreenRepository().filesResults;
  
  HomeBloc() : super(HomeInitial()) {
    on<NoteRequest>(_noteRequest);
  }

  Future<void> _noteRequest(
    NoteRequest event,
    Emitter<HomeState> emit,
  ) async {
    try {
     final res =  GreenRepository().filesResults;
      emit(HomeLoadingSucceful(folders: res));
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
