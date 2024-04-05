import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  late String id;
  @JsonKey(name: 'nama_lengkap')
  late String namaLengkap;
  late String email;
  late String role;
  @JsonKey(name: 'verified_email')
  late String verifiedEmail;
  @JsonKey(name: 'profile_picture')
  late String? profilePicture;
  late String? latitude;
  late String? longitude;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
