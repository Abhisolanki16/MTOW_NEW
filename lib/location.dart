class Location {
  String name;
  String district;
  String state;
 
  Location(this.name, this.district, this.state);
 
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        json['Name'], json['District'], json['State']);
  }
}