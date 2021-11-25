import 'dart:developer';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';
import 'package:suapifba/app/shared/helpers/custom_dio/custom_dio.dart';

import 'package:suapifba/app/shared/helpers/constants.dart' as config;

class VirtualClassRepository {
  final CustomDio dio;

  VirtualClassRepository(this.dio);

  Future<VirtualClassModel> fethData(String? virtualClassId) async {
    try {
      final url = '${config.urlVirtualClass}$virtualClassId/';
      final response = await dio.client.get(url);

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return virtualClassFromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception(
      "Houve um problema ao requisitar os dados da sala virtual selecionada.",
    );
  }
}
