import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<MainTabChange>((event, emit) {
      emit(state.copyWith(tab: event.tab));
    });
  }
}

enum MainTab {employee, client }
