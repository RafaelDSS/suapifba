import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class AuthInterceptors extends InterceptorsWrapper {
  final localStorage = Modular.get<LocalStorageRepository>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.authorizationHeader] =
        "JWT ${await localStorage.getToken()}";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    Dio dio = Dio();

    if (err.response?.statusCode == 401) {
      final token = await localStorage.getToken();

      try {
        final response =
            await dio.post(config.urlRefreshToken, data: {"token": token});

        if (response.statusCode == 200) {
          final token = response.data["token"];
          err.requestOptions.headers["Authorization"] = "JWT " + token;
          localStorage.saveToken(token);

          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );
          final cloneReq = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
          localStorage.removeToken();
          Modular.to.navigate("/login/");
        }
      }
    }
    super.onError(err, handler);
  }
}
