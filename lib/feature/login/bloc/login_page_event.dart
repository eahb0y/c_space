part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {}

class SetLocation extends LoginPageEvent{
  final String currentLocation;
  SetLocation({required this.currentLocation});
  @override
  List<Object?> get props => [currentLocation];
}

