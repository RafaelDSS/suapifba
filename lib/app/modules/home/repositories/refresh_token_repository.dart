import 'dart:io';
import 'package:dio/dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class RefreshTokenRepository {
  final Dio dio;

  RefreshTokenRepository(this.dio);

  Future<String> refreshToken(String? token) async {
    try {
      final response = await dio.post(
        config.urlRefreshToken,
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
        return response.data['token'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception("Sua sessão expirou.");
      }
    }
    throw Exception("Ocorreu um erro ao verificar sua sessão.");
  }
}
