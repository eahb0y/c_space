part of '../../main_page/bloc/main_page_bloc.dart';

abstract class WelcomeScreenEvent extends Equatable {}

class SetLocation extends WelcomeScreenEvent{
  final String currentLocation;
  SetLocation({required this.currentLocation});
  @override
  List<Object?> get props => [currentLocation];
}

class InitialEvent extends WelcomeScreenEvent{
  @override
  List<Object?> get props => [];

}
