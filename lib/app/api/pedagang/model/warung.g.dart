// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warung.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarungModel _$WarungModelFromJson(Map<String, dynamic> json) => WarungModel()
  ..id = json['id'] as String
  ..namaWarung = json['nama_warung'] as String
  ..namaPedagang = json['nama_pedagang'] as String
  ..banner = json['banner'] as String
  ..status = json['status'] as String
  ..jamBuka = json['jam_buka'] as String
  ..jamTutup = json['jam_tutup'] as String
  ..daerahDagang = json['daerah_dagang'] as String
  ..averageRating = (json['average_rating'] as num).toDouble()
  ..sertifikasiHalal = json['sertifikasi_halal'] as bool
  ..latitude = json['latitude'] as String?
  ..longitude = json['longitude'] as String?
  ..jarak = json['jarak'] as String
  ..jajanan = (json['jajanan'] as List<dynamic>)
      .map((e) => JajananModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$WarungModelToJson(WarungModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_warung': instance.namaWarung,
      'nama_pedagang': instance.namaPedagang,
      'banner': instance.banner,
      'status': instance.status,
      'jam_buka': instance.jamBuka,
      'jam_tutup': instance.jamTutup,
      'daerah_dagang': instance.daerahDagang,
      'average_rating': instance.averageRating,
      'sertifikasi_halal': instance.sertifikasiHalal,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'jarak': instance.jarak,
      'jajanan': instance.jajanan,
    };

JajananModel _$JajananModelFromJson(Map<String, dynamic> json) => JajananModel()
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

Map<String, dynamic> _$JajananModelToJson(JajananModel instance) =>
    <String, dynamic>{
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
