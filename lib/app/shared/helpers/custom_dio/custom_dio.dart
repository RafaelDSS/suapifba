import 'dart:io';

import 'package:dio/dio.dart';
import 'package:suapifba/app/shared/helpers/constants.dart' as config;
import 'package:suapifba/app/shared/helpers/custom_dio/interceptor_auth.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    // client.options.baseUrl = config.baseUrl;
    client.interceptors.add(AuthInterceptors());
    // client.options.connectTimeout = 20000;
    client.options.headers[HttpHeaders.contentTypeHeader] = "application/json";
    client.options.headers[HttpHeaders.acceptHeader] = "application/json";
  }
}
