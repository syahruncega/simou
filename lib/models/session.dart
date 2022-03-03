// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'dart:convert';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
  Session({
    required this.meta,
    required this.data,
  });

  Meta meta;
  Data data;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  String accessToken;
  String tokenType;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.nama,
    required this.username,
    required this.fakultasId,
    required this.prodiId,
    required this.role,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nama;
  String username;
  dynamic fakultasId;
  dynamic prodiId;
  String role;
  String status;
  dynamic deletedAt;
  dynamic createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        username: json["username"],
        fakultasId: json["fakultas_id"],
        prodiId: json["prodi_id"],
        role: json["role"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "username": username,
        "fakultas_id": fakultasId,
        "prodi_id": prodiId,
        "role": role,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
