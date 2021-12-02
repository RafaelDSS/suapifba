import 'dart:io';
import 'package:dio/dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class ManageAuthRepository {
  final Dio dio;

  ManageAuthRepository(this.dio);

  Future<bool> verifyToken(String? token) async {
    try {
      final response = await dio.post(
        config.urlVerifyToken,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: {
          'token': token,
        },
      );

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return true;
      }
    }
    throw Exception("Ocorreu um erro ao verificar sua sessão.");
  }
}
