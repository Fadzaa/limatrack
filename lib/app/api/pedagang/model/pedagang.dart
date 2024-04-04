import 'package:json_annotation/json_annotation.dart';

import 'jajan.dart';

part  'pedagang.g.dart';

@JsonSerializable()
class Pedagang {
  Pedagang();

  @JsonKey(name: "data")
  late List<Jajan> data;

  factory Pedagang.fromJson(Map<String, dynamic> json) => _$PedagangFromJson(json);

  Map<String, dynamic> toJson() => _$PedagangToJson(this);



}