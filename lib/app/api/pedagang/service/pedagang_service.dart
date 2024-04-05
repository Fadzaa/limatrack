import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:limatrack_genetic/app/api/dio_instance.dart';

class PedagangService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getPedagangAll() async {
    try {
      Future.delayed(const Duration(seconds: 2), () {
        print('Delay 2 detik');
      });
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.pedagangAll,
          isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getPedagangNearest() async {
    try {
      Future.delayed(const Duration(seconds: 2), () {
        print('Delay 2 detik');
      });
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.pedagangAll,
        isAuthorize: true,
        queryParameters: {
          'terdekat': true
        }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getPedagangHalal() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.pedagangAll,
          isAuthorize: true,
          queryParameters: {
            'sertifikasi_halal': true
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getPedagangRating() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.pedagangAll,
          isAuthorize: true,
          queryParameters: {
            'rating': 4.5
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getPedagangById( String id) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.pedagangById}/$id',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

