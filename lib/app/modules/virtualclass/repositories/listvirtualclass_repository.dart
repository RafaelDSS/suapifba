import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/modules/virtualclass/models/listvirtualclass_model.dart';

class ListVirtualClassRepository {
  Future fethData(String token, String period) async {
    http.Response response;
    String url =
        'https://suap.ifba.edu.br/api/v2/minhas-informacoes/turmas-virtuais/$period/';

    try {
      response = await http.get(
        '$url',
        headers: {
          HttpHeaders.authorizationHeader: 'JWT $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      print(e);
    }
    final statuscode = response.statusCode;

    if (statuscode == 200) {
      List<ListVirtualClass> data =
          listVirtualClassFromJson(response.bodyBytes);
      return data;
    }
  }
}
