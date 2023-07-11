import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenEvent, WelcomeScreenState> {
  WelcomeScreenBloc()
      : super(WelcomeScreenState(hasLocation: false, locationName: '')) {
    on<SetLocation>(_createLocation);
    on<InitialEvent>(checkLocalStorage);
  }

  Future<void> _createLocation(
      SetLocation event, Emitter<WelcomeScreenState> emit) async {
    await state._locationStorage.add(event.currentLocation);
    String currentLocalLocation = await state._locationStorage.getAt(0);
    emit(WelcomeScreenState(
        hasLocation: true, locationName: currentLocalLocation));
  }

  Future<void> checkLocalStorage(
      InitialEvent event, Emitter<WelcomeScreenState> emit) async {
    if (state._locationStorage.isNotEmpty) {
      String currentLocalLocation = state._locationStorage.getAt(0);
      emit(WelcomeScreenState(
          hasLocation: true, locationName: currentLocalLocation));
    } else {
      emit(WelcomeScreenState(hasLocation: false, locationName: ''));
    }
  }
}
