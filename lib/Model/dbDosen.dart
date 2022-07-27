import 'dart:convert';

DosenModel dosenModelJson(String str) => DosenModel.fromJson(json.decode(str));

String dosenModelToJson(DosenModel data) => json.encode(data.toJson());

class DosenModel {
  int idDosen;
  String nama;
  String nip;
  String alamat;
  String email;
  String noTelpon;
  String kodeMataKuliah;
  String bidang;

  DosenModel(
      {this.idDosen,
      this.nama,
      this.nip,
      this.alamat,
      this.email,
      this.noTelpon,
      this.kodeMataKuliah,
      this.bidang});

  factory DosenModel.fromJson(Map<String, dynamic> json) => DosenModel(
      nama: json["nama"],
      nip: json["nip"],
      alamat: json["alamat"],
      email: json["email"],
      noTelpon: json["noTelpon"],
      kodeMataKuliah: json["kodeMataKuliah"],
      bidang: json["bidang"],
      idDosen: json["idDosen"]);

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nip": nip,
        "alamat": alamat,
        "email": email,
        "noTelpon": noTelpon,
        "kodeMataKuliah": kodeMataKuliah,
        "bidang": bidang,
        'idDosen': idDosen,
      };

  // String get firstname => code;

  // String get lastname => title;
}
