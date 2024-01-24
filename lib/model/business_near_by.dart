class BusinessNearBy {
  List<Places>? places;

  BusinessNearBy({this.places});

  BusinessNearBy.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  List<String>? types;
  String? internationalPhoneNumber;
  String? formattedAddress;
  Location? location;
  String? websiteUri;
  DisplayName? displayName;

  Places(
      {this.types,
      this.internationalPhoneNumber,
      this.formattedAddress,
      this.location,
      this.websiteUri,
      this.displayName});

  Places.fromJson(Map<String, dynamic> json) {
    types = json['types'].cast<String>();
    internationalPhoneNumber = json['internationalPhoneNumber'];
    formattedAddress = json['formattedAddress'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    websiteUri = json['websiteUri'];
    displayName = json['displayName'] != null
        ? new DisplayName.fromJson(json['displayName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['types'] = this.types;
    data['internationalPhoneNumber'] = this.internationalPhoneNumber;
    data['formattedAddress'] = this.formattedAddress;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['websiteUri'] = this.websiteUri;
    if (this.displayName != null) {
      data['displayName'] = this.displayName!.toJson();
    }
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class DisplayName {
  String? text;
  String? languageCode;

  DisplayName({this.text, this.languageCode});

  DisplayName.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageCode = json['languageCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['languageCode'] = this.languageCode;
    return data;
  }
}
