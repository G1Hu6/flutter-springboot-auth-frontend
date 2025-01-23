import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkInterceptorService extends Interceptor{

    final FlutterSecureStorage _storage;

    NetworkInterceptorService(this._storage);

    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    
    String? accessToken = await _storage.read(key: "accessToken");

    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";
    options.headers["Authorization"] = "Bearer $accessToken";

    super.onRequest(options, handler);
  }
}