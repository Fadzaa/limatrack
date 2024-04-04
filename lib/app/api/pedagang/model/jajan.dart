import 'package:json_annotation/json_annotation.dart';

part  'jajan.g.dart';

@JsonSerializable()
class Jajan {
  Jajan();

  @JsonKey(name: 'id')
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

  factory Jajan.fromJson(Map<String, dynamic> json) => _$JajanFromJson(json);

  Map<String, dynamic> toJson() => _$JajanToJson(this);
}
