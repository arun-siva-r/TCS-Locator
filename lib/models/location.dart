  class Location {
    String? area;
    String? geo;
    String? location;
    List<dynamic>? officeType;
    List<dynamic>? additionalInfo;
    String? address;
    String? phone;
    Map<String, dynamic>? geometry;
    String? email;
    List<dynamic>? keywords;
    List<dynamic>? websites;
    String? id;


    Location({this.area, this.geo, this.location, this.officeType, this.additionalInfo,
      this.address, this.phone, this.geometry, this.email, this.keywords, this.websites, this.id});

    Location.fromJson(Map<String, dynamic> json) {
      area = json['area'];
      geo = json['geo'];
      location = json['location'];
      officeType = json['officeType'];
      additionalInfo = json['additionalInfo'];
      address = json['address'];
      phone = json['phone'];
      geometry = json['geometry'];
      email = json['email'];
      keywords = json['keywords'];
      websites = json['websites'];
      id = json['id'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['area'] = area;
      data['geo'] = geo;
      data['location'] = location;
      data['officeType'] = officeType;
      data['additionalInfo'] = additionalInfo;
      data['address'] = address;
      data['phone'] = phone;
      data['geometry'] = geometry;
      data['email'] = email;
      data['keywords'] = keywords;
      data['websites'] = websites;
      data['id'] = id;
      return data;
    }

    Location copyWith(
        {
          String? area,
          String? geo,
          String? location,
          List<String>? officeType,
          List<String>? additionalInfo,
          String? address,
          String? phone,
          Map<String, dynamic>? geometry,
          String? email,
          List<String>? keywords,
          List<Websites>? websites,
          String? id,
  }) {
      return Location(
          area: area ?? this.area,
          geo: geo??this.geo,
          location: location??this.location,
          officeType: officeType??this.officeType,
          additionalInfo: additionalInfo??this.additionalInfo,
          address: address ?? this.address,
          phone: phone??this.phone,
          geometry: geometry??this.geometry,
          email: email ?? this.email,
          keywords: keywords??this.keywords,
          websites: websites??this.websites,
          id: id??this.id
      );
    }
  }

  class Geometry {
    String? lat;
    String? lan;

    Geometry({this.lat, this.lan});

    Geometry.fromJson(Map<String, dynamic> json){
      lat = json['lat'];
      lan = json['lan'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['lat'] = lat;
      data['lan'] = lan;
      return data;
    }

    Geometry copyWith({String? lat, String? lan}) {
      return Geometry(lat: lat ?? this.lat, lan: lan ?? this.lan);
    }
  }

  class Websites{
    String? name;
    String? url;

    Websites({this.name, this.url});

    Websites.fromJson(Map<String, dynamic> json){
    name=json['name'];
    url=json['url'];
    }

    Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
    }

    Websites copyWith({String? name, String? url}){
    return Websites(name: name??this.name, url: url??this.url);
    }
  }
