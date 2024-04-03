import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';

class AuthenticationService {
  final dio = Dio();

  Future<Response> login(String email, String password) async {
    try {
      final response =  await dio.post(ApiEndPoint.login, data: {
        'email': email,
        'password': password,
      });

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> register(String name, String email, String password, String otp) async {
    try {
      final response =  await dio.post(ApiEndPoint.register, data: {
        'nama_lengkap': name,
        'email': email,
        'password': password,
        'otp': otp,
      });

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> otpVerification(String email) async {
    try {
      final response =  await dio.post(ApiEndPoint.otpVerification, data: {
        'email': email,
      });

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<Response> logout(String token) async {
    try {
      final response =  await dio.delete(
        ApiEndPoint.logout,

        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          })
      );

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}