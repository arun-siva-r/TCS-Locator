abstract class LocationEvent {}

class FetchLocations extends LocationEvent {}

class SearchLocations extends LocationEvent {
  final String query;
  SearchLocations(this.query);
}

class FilterLocations extends LocationEvent{
  final String query;
  FilterLocations(this.query);
}