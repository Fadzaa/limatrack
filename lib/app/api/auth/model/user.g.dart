// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = json['id'] as String
  ..namaLengkap = json['nama_lengkap'] as String
  ..email = json['email'] as String
  ..role = json['role'] as String
  ..verifiedEmail = json['verified_email'] as String
  ..profilePicture = json['profile_picture'] as String?
  ..latitude = json['latitude'] as String?
  ..longitude = json['longitude'] as String?
  ..createdAt = json['created_at'] as String
  ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'nama_lengkap': instance.namaLengkap,
      'email': instance.email,
      'role': instance.role,
      'verified_email': instance.verifiedEmail,
      'profile_picture': instance.profilePicture,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
