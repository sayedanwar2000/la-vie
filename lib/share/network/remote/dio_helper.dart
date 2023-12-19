import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  //this function to to talk any api get
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {'Authorization': 'Bearer $token'};
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  //this function to to talk any api post
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    String? accessToken,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {'Authorization': 'Bearer $accessToken'};
    return await dio.put(url, queryParameters: query, data: data);
  }
}
