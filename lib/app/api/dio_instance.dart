
import 'package:dio/dio.dart';
import 'package:limatrack_genetic/app/api/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInstance {
  //Declaration late variable

  //Late needed for nullable variable so that it can be initialized later
  late Dio _dio;
  late String _token;


  //Initialize all the required instances (dio, shared preferences, token)
  DioInstance()  {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
      )
    );
    SharedPreferences.getInstance().then((prefs) {
      _token = prefs.getString('token') ?? "";
    });

    initializeInterceptors();
  }


  //All Method of Requests
  Future<Response> getRequest({required String endpoint, bool? isAuthorize, Map<String, dynamic>? queryParameters}) async {
    Response response;

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters,
        options: Options(
            headers: {
              "Accept": "application/json",
              if(isAuthorize ?? false) "Authorization": "Bearer $_token"
            }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;

  }

  Future<Response> postRequest({required String endpoint, bool? isAuthorize, required Object data}) async {
    Response response;

    try {
      response = await _dio.post(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $_token"
              })
      );


    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> putRequest({required String endpoint,  bool? isAuthorize, required Object data}) async {
    Response response;

    try {
      response = await _dio.put(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $_token"
              })
      );

    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest({required String endpoint, bool? isAuthorize}) async {
    Response response;

    try {
      response = await _dio.delete(
          endpoint,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $_token"
              })
      );

    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }


  //Initialize Interceptors
  initializeInterceptors() {
    _dio.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            return handler.next(error);
          },

          onRequest: (request, handler) {
            print(request.method + " " + request.path);
            print(request.data);
            return handler.next(request);
          },

          onResponse: (response, handler) {
            return handler.next(response);
          }
        )
    );

  }
}