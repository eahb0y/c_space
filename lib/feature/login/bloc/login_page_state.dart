part of 'login_page_bloc.dart';

class LoginPageState extends Equatable {
  final bool hasLocation;
  final String locationName;

  LoginPageState({required this.hasLocation, required this.locationName});

  LoginPageState copyWith({
    bool? hasLocation,
    String? locationName,
  }) {
    return LoginPageState(
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
