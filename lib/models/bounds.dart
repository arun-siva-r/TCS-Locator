  class Bound{
    int? breakPoint;
    int? zoom;
    Bounds? bounds;
    String? id;

    Bound({this.breakPoint, this.zoom, this.bounds, this.id});

    Bound.fromJson(Map<String, dynamic> json){
      breakPoint=json['breakPoint'];
      zoom=json['zoom'];
      bounds=json['bounds'];
      id=json['id'];
    }

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = <String, dynamic>{};
      data['breakPoint'] = breakPoint;
      data['zoom'] = zoom;
      data['bounds'] = bounds;
      data['id'] = id;
      return data;
    }

    Bound copyWith({int? breakPoint, int? zoom, Bounds? bounds, String? id}){
      return Bound(breakPoint: breakPoint??this.breakPoint, zoom: zoom??this.zoom, bounds: bounds??this.bounds,id: id??this.id);
    }
  }

  class Bounds{
    double? south;
    double? west;
    double? north;
    double? east;

    Bounds({this.south, this.west, this.north, this.east});

    Bounds.fromJson(Map<String, dynamic> json){
      south=json['south'];
      west=json['west'];
      north = json['north'];
      east = json['east'];
    }

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = <String, dynamic>{};
      data['south'] = south;
      data['west'] = west;
      data['north'] = north;
      data['east'] = east;
      return data;
    }

    Bounds copyWith({double? south, double? west, double? north, double? east}){
      return Bounds(south: south??this.south, west: west??this.west, north: north??this.north, east: east??this.east);
    }
  }