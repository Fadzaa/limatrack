import 'package:json_annotation/json_annotation.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';

part 'list_warung_response.g.dart';

@JsonSerializable()
class WarungResponse {
  late List<WarungModel> data;

  WarungResponse();

  factory WarungResponse.fromJson(Map<String, dynamic> json) =>
      _$WarungResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WarungResponseToJson(this);
}