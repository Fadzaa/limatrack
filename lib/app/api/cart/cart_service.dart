
import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:limatrack_genetic/app/api/cart/cart_response.dart';
import '../dio_instance.dart';

class CartService {
  final DioInstance _dioInstance = DioInstance();

  Future<CartResponse> storeCart(String pedagangId, String jajananId, int jumlah, int totalHarga) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: '${ApiEndPoint.baseUrl}/pedagang/$pedagangId/jajanan/$jajananId/cart',
          isAuthorize: true,
          data: {
            'jumlah': jumlah,
            'total_harga': totalHarga
          }
      );

      return CartResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CartResponse> showCurrentCart(String pedagangId, String jajananId) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.baseUrl}/pedagang/$pedagangId/jajanan/$jajananId/cart/show-current',
          isAuthorize: true
      );

      return CartResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CartResponse> putCart(String pedagangId, String jajananId, String cartId, int jumlah, int totalHarga) async {
    try {
      final response = await _dioInstance.putRequest(
          endpoint: '${ApiEndPoint.baseUrl}/pedagang/$pedagangId/jajanan/$jajananId/cart/$cartId',
          data: {
            'jumlah': jumlah,
            'total_harga': totalHarga
          }
      );

      return CartResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}