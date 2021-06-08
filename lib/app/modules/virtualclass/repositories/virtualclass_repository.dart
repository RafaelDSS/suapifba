import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';


  Future fethData(String token, String code) async {
    http.Response response;
    String url = 'https://suap.ifba.edu.br/api/v2/minhas-informacoes/turmas-virtuais/$code/';

    IOClient ioClient = httpClient();

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
      VirtualClass data = virtualClassFromJson(response.bodyBytes);
      return data;
    }
  }
}
