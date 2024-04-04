import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:limatrack_genetic/app/api/dio_instance.dart';

// class PedagangService {
//
//   late DioInstance _dioService;
//
//   Future<Response> getPedagangAll(String token, bool terdekat, double rating, bool sertifikasi_halal) async {
//     try {
//
//
//       final response = await _dioService.getRequest(ApiEndPoint.pedagangAll);
//
//       return response;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
//
//
// }

// Future<Response> getPedagangById(String token, int id) async {
//   try {
//     final response = await dio.get(
//         '${ApiEndPoint.pedagangById}/$id',
//       options: Options(
//         headers: {
//           "Accept": "application/json",
//           "Authorization": "Bearer $token",
//         }
//       )
//     );
//
//     return response;
//   } catch (e) {
//     throw Exception(e);
//   }
// }