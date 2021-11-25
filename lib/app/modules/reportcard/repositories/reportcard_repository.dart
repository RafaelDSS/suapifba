import 'dart:developer';
import 'package:suapifba/app/modules/reportcard/models/reportcard_model.dart';
import 'package:suapifba/app/shared/helpers/custom_dio/custom_dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class ReportcardRepository {
  final CustomDio dio;

  ReportcardRepository(this.dio);

  Future<List<ReportCardModel>> fethData(String period) async {
    try {
      final url = '${config.urlReportCard}$period/';

      final response = await dio.client.get(url);

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return reportCardModelFromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception(
      "Ocorreu um erro ao requisitar o boletim do período selecionado.",
    );
  }
}
