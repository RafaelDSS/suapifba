import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class VirtualClassRepository {
  Future fethData(String? token, String? code) async {
    late http.Response response;
    final url =
        'https://suap.ifba.edu.br/api/v2/minhas-informacoes/turmas-virtuais/$code/';

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
      VirtualClass data = virtualClassFromJson(response.bodyBytes);
      return data;
    }
  }
}
