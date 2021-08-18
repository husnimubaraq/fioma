import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode((str)));

class User {
  User({
    this.id,
    this.createdDate,
    this.type,
    this.name,
    this.dateOfBirth,
    this.nik,
    this.position,
    this.username,
    this.phone,
    this.email,
    this.regionalName,
    this.arnetName,
    this.sessionId,
  });

  int id;
  DateTime createdDate;
  String type;
  String name;
  DateTime dateOfBirth;
  String nik;
  String position;
  String username;
  String phone;
  String email;
  String regionalName;
  String arnetName;
  String sessionId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdDate: DateTime.parse(json["created_date"]),
        type: json["type"],
        name: json["name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        nik: json["nik"],
        position: json["position"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        regionalName: json["regional_name"],
        arnetName: json["arnet_name"],
        sessionId: json["session_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_date": createdDate.toIso8601String(),
        "type": type,
        "name": name,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "nik": nik,
        "position": position,
        "username": username,
        "phone": phone,
        "email": email,
        "regional_name": regionalName,
        "arnet_name": arnetName,
        "session_id": sessionId,
      };
}
