// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedagang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pedagang _$PedagangFromJson(Map<String, dynamic> json) => Pedagang()
  ..data = (json['data'] as List<dynamic>)
      .map((e) => Jajan.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PedagangToJson(Pedagang instance) => <String, dynamic>{
      'data': instance.data,
    };
