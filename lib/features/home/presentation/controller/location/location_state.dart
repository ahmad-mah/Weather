part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  const LocationSuccess(this.position);
  final Position position;

  @override
  List<Object> get props => [position];
}

class LocationFailed extends LocationState {
  const LocationFailed(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
