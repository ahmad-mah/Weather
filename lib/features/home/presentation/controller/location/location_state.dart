part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final Position position;
  const LocationSuccess(this.position);

  @override
  List<Object> get props => [position];
}

class LocationFailed extends LocationState {
  final String message;
  const LocationFailed(this.message);

  @override
  List<Object> get props => [message];
}
