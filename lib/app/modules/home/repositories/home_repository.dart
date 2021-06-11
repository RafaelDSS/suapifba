import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/modules/home/models/home_model.dart';

class HomeRepository {
  Future fethData(String? token) async {
    late http.Response response;
    final url = 'http://suap.ifba.edu.br/api/v2/minhas-informacoes/meus-dados';

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
      StudentData data =
          StudentData.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return data;
    }
  }
}
