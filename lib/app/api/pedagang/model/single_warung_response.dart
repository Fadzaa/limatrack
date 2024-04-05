import 'package:json_annotation/json_annotation.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';

part 'single_warung_response.g.dart';

@JsonSerializable()
class SingleWarungResponse {
  late WarungModel data;

  SingleWarungResponse();

  factory SingleWarungResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleWarungResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleWarungResponseToJson(this);
}