import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/utils/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService locationService;

  LocationCubit(this.locationService) : super(LocationInitial());

  Future<void> fetchCurrentLocation() async {
    emit(LocationLoading());
    try {
      final position = await locationService.getCurrentLocation();
      emit(LocationSuccess(position));
    } catch (e) {
      emit(LocationFailed(e.toString()));
    }
  }
}
