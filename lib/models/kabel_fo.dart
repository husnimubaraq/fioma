import 'dart:convert';

List<KabelFO> kabelFoFromJson(String str) =>
    List<KabelFO>.from(json.decode(str).map((x) => KabelFO.fromJson(x)));

String kabelFoToJson(List<KabelFO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KabelFO {
  KabelFO({
    this.id,
    this.createdDate,
    this.name,
    this.ruas,
    this.regionalName,
    this.arnetName,
    this.stoName,
    this.totalCore,
    this.jenisFo,
    this.jenisKabel,
    this.kabelPanjang,
    this.kabelPabrikan,
    this.kabelTahun,
    this.mitraPelaksana,
    this.data,
  });

  int id;
  DateTime createdDate;
  String name;
  String ruas;
  String regionalName;
  String arnetName;
  String stoName;
  String totalCore;
  String jenisFo;
  String jenisKabel;
  double kabelPanjang;
  String kabelPabrikan;
  String kabelTahun;
  String mitraPelaksana;
  String data;

  factory KabelFO.fromJson(Map<String, dynamic> json) => KabelFO(
        id: json["id"],
        createdDate: DateTime.parse(json["created_date"]),
        name: json["name"],
        ruas: json["ruas"],
        regionalName: json["regional_name"],
        arnetName: json["arnet_name"],
        stoName: json["sto_name"],
        totalCore: json["total_core"],
        jenisFo: json["jenis_fo"],
        jenisKabel: json["jenis_kabel"],
        kabelPanjang: json["kabel_panjang"].toDouble(),
        kabelPabrikan: json["kabel_pabrikan"],
        kabelTahun: json["kabel_tahun"],
        mitraPelaksana: json["mitra_pelaksana"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_date": createdDate.toIso8601String(),
        "name": name,
        "ruas": ruas,
        "regional_name": regionalName,
        "arnet_name": arnetName,
        "sto_name": stoName,
        "total_core": totalCore,
        "jenis_fo": jenisFo,
        "jenis_kabel": jenisKabel,
        "kabel_panjang": kabelPanjang,
        "kabel_pabrikan": kabelPabrikan,
        "kabel_tahun": kabelTahun,
        "mitra_pelaksana": mitraPelaksana,
        "data": data == null ? null : data,
      };
}
