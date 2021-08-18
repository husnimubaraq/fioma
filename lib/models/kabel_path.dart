import 'dart:convert';

KabelPath kabelPathFromJson(String str) => KabelPath.fromJson(json.decode(str));

String kabelPathToJson(KabelPath data) => json.encode(data.toJson());

class KabelPath {
  KabelPath({
    this.initialPosition,
    this.pathInfo,
  });

  String initialPosition;
  List<String> pathInfo;

  factory KabelPath.fromJson(Map<String, dynamic> json) => KabelPath(
        initialPosition: json["initial_position"],
        pathInfo: List<String>.from(json["path_info"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "initial_position": initialPosition,
        "path_info": List<dynamic>.from(pathInfo.map((x) => x)),
      };
}
