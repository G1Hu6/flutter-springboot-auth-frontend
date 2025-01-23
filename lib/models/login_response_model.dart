import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
    const factory LoginResponseModel({
        @JsonKey(name: "timestamp")
        required DateTime timestamp,
        @JsonKey(name: "data")
        required Data data,
        @JsonKey(name: "error")
        required dynamic error,
    }) = _LoginResponseModel;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "accessToken")
        required String accessToken,
        @JsonKey(name: "refreshToken")
        required String refreshToken,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
