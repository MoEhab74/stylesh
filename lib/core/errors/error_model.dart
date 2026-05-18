import 'package:stylesh/core/api/api_endpoints.dart';

class ErrorModel {
  final String message;
  final int? statusCode;

  ErrorModel({required this.message, this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json[ApiKeys.message],
    statusCode: json[ApiKeys.statusCode],
  );
}
