import 'package:stylesh/core/api/api_endpoints.dart';

class LogInModel {
  final String accessToken;
  final String refreshToken;

  LogInModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      accessToken: json[ApiKeys.accessToken] as String,
      refreshToken: json[ApiKeys.refreshToken] as String,
    );
  }
}