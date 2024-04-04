import 'package:json_annotation/json_annotation.dart';

part 'warung.g.dart';

@JsonSerializable()
class WarungModel {
  late String id;
  @JsonKey(name: 'nama_warung')
  late String namaWarung;
  @JsonKey(name: 'nama_pedagang')
  late String namaPedagang;
  late String banner;
  late String status;
  @JsonKey(name: 'jam_buka')
  late String jamBuka;
  @JsonKey(name: 'jam_tutup')
  late String jamTutup;
  @JsonKey(name: 'daerah_dagang')
  late String daerahDagang;
  @JsonKey(name: 'average_rating')
  late double averageRating;
  @JsonKey(name: 'sertifikasi_halal')
  late bool sertifikasiHalal;
  late String? latitude;
  late String? longitude;
  late String jarak;
  late List<JajananModel> jajanan;

  WarungModel();

  factory WarungModel.fromJson(Map<String, dynamic> json) =>
      _$WarungModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarungModelToJson(this);
}

@JsonSerializable()
class JajananModel {
  late String id;
  @JsonKey(name: 'pedagang_id')
  late String pedagangId;
  late String nama;
  late String deskripsi;
  late int harga;
  late String image;
  late bool tersedia;
  late String kategori;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;

  JajananModel();

  factory JajananModel.fromJson(Map<String, dynamic> json) =>
      _$JajananModelFromJson(json);

  Map<String, dynamic> toJson() => _$JajananModelToJson(this);
}
