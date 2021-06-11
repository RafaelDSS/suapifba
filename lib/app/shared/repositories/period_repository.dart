import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/shared/models/period_model.dart';

class PeriodRepository {
  Future fethData(String token) async {
    http.Response response;
    String url =
        'http://suap.ifba.edu.br/api/v2/minhas-informacoes/meus-periodos-letivos/';

    try {
      response = await http.get(
        '$url',
        headers: {
          HttpHeaders.authorizationHeader: 'JWT $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      final data = periodFromJson(response.body);
      return data;
    }
  }
}
