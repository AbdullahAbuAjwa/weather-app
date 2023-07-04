class Search {
  final int? id;
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? url;

  Search({
    this.id,
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.url,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
      );
}
