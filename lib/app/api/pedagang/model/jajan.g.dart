// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jajan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jajan _$JajanFromJson(Map<String, dynamic> json) => Jajan()
  ..id = json['id'] as String
  ..pedagangId = json['pedagang_id'] as String
  ..nama = json['nama'] as String
  ..deskripsi = json['deskripsi'] as String
  ..harga = json['harga'] as int
  ..image = json['image'] as String
  ..tersedia = json['tersedia'] as bool
  ..kategori = json['kategori'] as String
  ..createdAt = json['created_at'] as String
  ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$JajanToJson(Jajan instance) => <String, dynamic>{
      'id': instance.id,
      'pedagang_id': instance.pedagangId,
      'nama': instance.nama,
      'deskripsi': instance.deskripsi,
      'harga': instance.harga,
      'image': instance.image,
      'tersedia': instance.tersedia,
      'kategori': instance.kategori,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
