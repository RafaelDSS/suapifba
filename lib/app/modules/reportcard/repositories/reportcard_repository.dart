import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/modules/reportcard/models/reportcard_model.dart';

class ReportcardRepository {
  Future fethData(String token, String period) async {
    http.Response response;
    final url =
        'http://suap.ifba.edu.br/api/v2/minhas-informacoes/boletim/$period/';

    try {
      response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'JWT $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      return null;
    }
    final statuscode = response.statusCode;

    if (statuscode == 200) {
      final data = reportCardFromJson(response.bodyBytes);
      return data;
    }
    return null;
  }
}
