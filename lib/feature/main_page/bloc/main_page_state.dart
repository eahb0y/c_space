part of '../../main_page/bloc/main_page_bloc.dart';

class WelcomeScreenState extends Equatable {
  final bool hasLocation;
  final String locationName;

  WelcomeScreenState({required this.hasLocation, required this.locationName});

  WelcomeScreenState copyWith({
    bool? hasLocation,
    String? locationName,
  }) {
    return WelcomeScreenState(
      hasLocation: hasLocation ?? this.hasLocation,
      locationName: locationName ?? this.locationName,
    );
  }

  @override
  List<Object?> get props => [
        hasLocation,
        locationName,
      ];
}
