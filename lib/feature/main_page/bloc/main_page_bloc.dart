import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenEvent, WelcomeScreenState> {
  WelcomeScreenBloc()
      : super(WelcomeScreenState(hasLocation: false, locationName: '')) {
    on<SetLocation>(_createLocation);
  }

  Future<void> _createLocation(
      SetLocation event, Emitter<WelcomeScreenState> emit) async {
    print("looog setlocation");
    print(event.currentLocation);
    sl<LocalSource>().setLocation(event.currentLocation);
    emit(WelcomeScreenState(
        hasLocation: true, locationName: event.currentLocation));
  }
}
