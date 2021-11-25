import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:suapifba/app/shared/helpers/custom_dio/custom_dio.dart';
import 'package:suapifba/app/shared/models/period_model.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class PeriodRepository {
  final CustomDio dio;

  PeriodRepository(this.dio);

  Future<List<Period>> fethData() async {
    try {
      final response = await dio.client.get(config.urlPeriods);

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return periodFromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        throw Exception("Sessão expirada.");
      }
    }
    throw Exception("Ocorreu um erro ao requisitar os períodos letivos.");
  }
}
