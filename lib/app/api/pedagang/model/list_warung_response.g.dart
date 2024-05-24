// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_warung_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarungResponse _$WarungResponseFromJson(Map<String, dynamic> json) =>
    WarungResponse()
      ..data = (json['data'] as List<dynamic>)
          .map((e) => WarungModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WarungResponseToJson(WarungResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
