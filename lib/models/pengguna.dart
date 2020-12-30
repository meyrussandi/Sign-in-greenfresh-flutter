// To parse this JSON data, do
//
//     final penggunaModel = penggunaModelFromJson(jsonString);

part of 'models.dart';

PenggunaModel penggunaModelFromJson(String str) =>
    PenggunaModel.fromJson(json.decode(str));

String penggunaModelToJson(PenggunaModel data) => json.encode(data.toJson());

class PenggunaModel {
  PenggunaModel({
    this.status,
    this.message,
    this.pengguna,
  });

  int status;
  String message;
  Pengguna pengguna;

  factory PenggunaModel.fromJson(Map<String, dynamic> json) => PenggunaModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        pengguna: json["pengguna"] == null
            ? null
            : Pengguna.fromJson(json["pengguna"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "pengguna": pengguna == null ? null : pengguna.toJson(),
      };
}

class Pengguna {
  Pengguna({
    this.idPengguna,
    this.email,
    this.password,
    this.namaPengguna,
    this.noHp,
  });

  String idPengguna;
  String email;
  String password;
  String namaPengguna;
  String noHp;

  factory Pengguna.fromJson(Map<String, dynamic> json) => Pengguna(
        idPengguna: json["idPengguna"] == null ? null : json["idPengguna"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        namaPengguna:
            json["namaPengguna"] == null ? null : json["namaPengguna"],
        noHp: json["noHp"] == null ? null : json["noHp"],
      );

  Map<String, dynamic> toJson() => {
        "idPengguna": idPengguna == null ? null : idPengguna,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "namaPengguna": namaPengguna == null ? null : namaPengguna,
        "noHp": noHp == null ? null : noHp,
      };
}
