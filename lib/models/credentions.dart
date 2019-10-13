
import 'package:json_annotation/json_annotation.dart';

part 'credentions.g.dart';

@JsonSerializable()
class Credentions {
  Credentions({this.password, this.username, this.isGuard});
  factory Credentions.fromJson(Map<String, dynamic> json) => _$CredentionsFromJson(json);
  Map<String, dynamic> toJson() => _$CredentionsToJson(this);

  final String username;
  final String password;
  final bool isGuard;
}