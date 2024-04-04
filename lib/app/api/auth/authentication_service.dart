import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:limatrack_genetic/app/api/dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {
            'email': email,
            'password': password
          }
      );

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> register(String name, String email, String password, String otp) async {
    try {
      final response =  await _dioInstance.postRequest(
          endpoint: ApiEndPoint.register,
          data: {
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
      final response =  await _dioInstance.postRequest(
          endpoint: ApiEndPoint.otpVerification,
          data: {
            'email': email,
          },
      );

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> logout() async {
    try {
      final response =  await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout,
          isAuthorize: true
      );

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}