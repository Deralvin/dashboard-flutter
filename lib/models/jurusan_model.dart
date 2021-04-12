// To parse this JSON data, do
//
//     final jurusanModel = jurusanModelFromJson(jsonString);

import 'dart:convert';

List<JurusanModel> jurusanModelFromJson(String str) => List<JurusanModel>.from(json.decode(str).map((x) => JurusanModel.fromJson(x)));

String jurusanModelToJson(List<JurusanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JurusanModel {
  JurusanModel({
    this.asal,
    this.tujuan,
    this.kotaAsal,
    this.kotaTujuan,
    this.harga,
    this.hargaCoret,
  });

  String asal;
  String tujuan;
  String kotaAsal;
  String kotaTujuan;
  int harga;
  int hargaCoret;

  factory JurusanModel.fromJson(Map<String, dynamic> json) => JurusanModel(
    asal: json["asal"],
    tujuan: json["tujuan"],
    kotaAsal: json["kota_asal"],
    kotaTujuan: json["kota_tujuan"],
    harga: json["harga"],
    hargaCoret: json["harga_coret"],
  );

  Map<String, dynamic> toJson() => {
    "asal": asal,
    "tujuan": tujuan,
    "kota_asal": kotaAsal,
    "kota_tujuan": kotaTujuan,
    "harga": harga,
    "harga_coret": hargaCoret,
  };
}
