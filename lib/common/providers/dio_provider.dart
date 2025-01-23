import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final dioProvider = Provider((ref) => Dio(BaseOptions(
    baseUrl: "https://springboot-auth-backend-production.up.railway.app")));
