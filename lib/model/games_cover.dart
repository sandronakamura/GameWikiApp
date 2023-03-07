import 'dart:convert';

List<GamesCover> gamesCoverFromJson(String str) => List<GamesCover>.from(json.decode(str).map((x) => GamesCover.fromJson(x)));

String gamesCoverToJson(List<GamesCover> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GamesCover {
  GamesCover({
    required this.id,
    required this.imageId,
  });

  int id;
  String imageId;

  factory GamesCover.fromJson(Map<String, dynamic> json) => GamesCover(
    id: json["id"],
    imageId: json["image_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_id": imageId,
  };
}
