import 'package:beep_mobile/base/models/token.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'token.g.dart';

@HiveType(typeId: 2)
class Token extends TokenBaseModel with HiveObjectMixin {
  @HiveField(0)
  String? accessToken;
  @HiveField(1)
  String? refreshToken;
  @HiveField(2)
  DateTime? expiryDate;

  Token(this.accessToken, this.refreshToken, this.expiryDate);
  Token.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    expiryDate = JwtDecoder.getExpirationDate(accessToken!);
  }

  @override
  String toString() {
    String res = "accessToken : ${accessToken.toString()} "
        "refreshToken : ${refreshToken.toString()} "
        "expiryDate : ${expiryDate.toString()} ";

    return res;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['expiryDate'] = expiryDate;
    return data;
  }
}
