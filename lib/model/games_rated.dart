

import 'dart:convert';

List<GamesRated> gamesRatedFromJson(String str) => List<GamesRated>.from(json.decode(str).map((x) => GamesRated.fromJson(x)));

String gamesRatedToJson(List<GamesRated> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GamesRated {
  GamesRated({
    required this.id,
    this.cover,
    required this.createdAt,
    this.name,
    this.summary,
  });

  int id;
  int? cover;
  int createdAt;
  String? name;
  String? summary;

  factory GamesRated.fromJson(Map<String, dynamic> json) => GamesRated(
    id: json["id"],
    cover: json["cover"],
    createdAt: json["created_at"],
    name: json["name"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cover": cover,
    "created_at": createdAt,
    "name": name,
    "summary": summary,
  };
}
