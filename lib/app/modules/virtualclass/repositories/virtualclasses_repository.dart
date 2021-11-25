import 'dart:developer';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';
import 'package:suapifba/app/shared/helpers/custom_dio/custom_dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class VirtualClassesRepository {
  final CustomDio dio;

  VirtualClassesRepository(this.dio);

  Future<List<VirtualClassesModel>> fethData(String period) async {
    try {
      final url = '${config.urlVirtualClass}$period/';

      final response = await dio.client.get(url);

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return virtualClassesFromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception(
      "Houve um problema ao requisitar os dados.",
    );
  }
}
