import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:suapifba/app/modules/home/models/home_model.dart';


  Future fethData(String token) async {
    http.Response response;
    String url = 'http://suap.ifba.edu.br/api/v2/minhas-informacoes/meus-dados';

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
      StudentData data = StudentData.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return data;
    }
  }
}
