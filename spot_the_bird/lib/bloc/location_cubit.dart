import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied ||
        permission != LocationPermission.deniedForever) {
      emit(LocationLoadind());

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        emit(LocationLoaded(
            latitude: position.latitude, logtitude: position.longitude));
      } catch (error) {
        print(error.toString());
        emit(const LocationError());
      }
    }
  }
}
