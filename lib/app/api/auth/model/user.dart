import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  @JsonKey(name: 'nama_lengkap')
  String?namaLengkap;
  String? email;
  String? role;
  @JsonKey(name: 'verified_email')
  String? verifiedEmail;
  @JsonKey(name: 'profile_picture')
  String? profilePicture;
  String? latitude;
  String? longitude;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
