import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class ManageAuthRepository {
  final LocalStorageRepository localStorage;
  final Dio dio;

  ManageAuthRepository(this.localStorage, this.dio);

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
    } catch (e) {
      log(e.toString());
    }
    throw Exception("Ocorreu um erro ao verificar sua sessão.");
  }
}
