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

  Future<Response> register(String name, String email, String password) async {
    try {
      final response =  await dio.post(ApiEndPoint.register, data: {
        'name': name,
        'email': email,
        'password': password,
      });

       return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<dynamic> otpVerification(String email, String otp) async {
  //   try {
  //     final response =  await dio.post(ApiEndPoint.otpVerification, data: {
  //       'email': email,
  //       'otp': otp,
  //     });
  //
  //      return response.data;
  //   } catch (e) {
  //     return e;
  //   }
  // }


  Future<dynamic> logout(String email) async {
    try {
      final response =  await dio.post(ApiEndPoint.logout, data: {
        'email': email,
      });

       return response.data;
    } catch (e) {
      return e;
    }
  }
}