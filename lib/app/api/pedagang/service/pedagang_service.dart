import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:limatrack_genetic/app/api/dio_instance.dart';

class PedagangService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getPedagangAll(String token, bool terdekat, double rating, bool sertifikasi_halal) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.pedagangAll,
          isAuthorize: true,
          queryParameters: {
            'terdekat': terdekat,
            'rating': rating,
            'sertifikasi_halal': sertifikasi_halal
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getPedagangById(String token, int id) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.pedagangById + '/$id',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

