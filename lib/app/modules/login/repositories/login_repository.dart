import 'dart:io';
import 'package:dio/dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class LoginRepository {
  final Dio dio;

  LoginRepository(this.dio);

  Future<String> fethToken(matricula, password) async {
    try {
      final response = await dio.post(
        config.urlAuth,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: {
          "username": matricula,
          "password": password,
        },
      );

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return response.data["token"];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception("Suas informações de login estão incorretas.");
      }
      throw Exception(
          "Você deve está com algum problema de conexão ou o servidor do SUAP está fora do ar.");
    }
    throw Exception("Ocorreu um error ao fazer seu login.");
  }
}
