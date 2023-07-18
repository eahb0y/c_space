import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc()
      : super(LoginPageState(hasLocation: false, locationName: '')) {
    on<SetLocation>(_createLocation);
  }

  Future<void> _createLocation(
      SetLocation event, Emitter<LoginPageState> emit) async {
    sl<LocalSource>().setLocation(event.currentLocation);
    emit(LoginPageState(
        hasLocation: true, locationName: event.currentLocation));
  }
}
