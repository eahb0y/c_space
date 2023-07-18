part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainTabChange extends MainEvent{
  final MainTab tab;
  const MainTabChange(this.tab);

  @override
  List<Object?> get props => [tab];
}
