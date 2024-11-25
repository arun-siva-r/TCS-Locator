import '../models/location.dart';
import '../services/location_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    List<Location> locationsList = [];
    on<FetchLocations>((event, emit) async {
      emit(LocationLoading());
      try {
        locationsList = await LocationServices.fetchLocations();
        emit(LocationLoaded(locationsList));
      } catch (e) {
        emit(LocationError('Failed to load locations'));
      }
    });
    on<SearchLocations>((event, emit) {
      final filteredLocations = locationsList
          .where((location) =>
              location.area!
                  .toLowerCase()
                  .contains(event.query.toLowerCase()) ||
              location.geo!.toLowerCase().contains(event.query.toLowerCase()) ||
              location.location!
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();
     emit(LocationLoaded(filteredLocations));
    });
    on<FilterLocations>((event, emit) {
      final filteredLocations = event.query == "All"
          ? locationsList
          : locationsList
              .where((location) => location.geo == event.query)
              .toList();
      emit(LocationLoaded(filteredLocations));
    });
  }
}
