import 'package:complete_auth/common/providers/dio_provider.dart';
import 'package:complete_auth/models/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {

    final WidgetRef _ref;

    AuthService(this._ref);
    Dio get _dio => _ref.read(dioProvider);  
    Future<LoginResponseModel> loginUser(Map<String, String> userCredentials) async{

        try{
          final response = await _dio.post("/auth/logIn", data: userCredentials);
          return LoginResponseModel.fromJson(response.data["data"]);
        }on DioException catch(e) {
          
          return Future.error(e.message.toString()); 
        }catch (e){
           return Future.error(e.toString()); 
        }
    }
}