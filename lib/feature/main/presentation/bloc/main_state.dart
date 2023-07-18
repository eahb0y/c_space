part of 'main_bloc.dart';


class MainState extends Equatable {
  final MainTab tab;

  MainState({this.tab = MainTab.employee});

  MainState copyWith({
    MainTab? tab,
}){
    return MainState(
      tab: tab ?? this.tab
    );
  }

  @override
  List<Object?> get props => [tab];
}

