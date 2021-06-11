import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suapifba/app/shared/repositories/localstore_repository.dart';

class LoginRepository {
  LocalStoreRepository repository = LocalStoreRepository();

  Future fethToken(matricula, password) async {
    http.Response response;
    String url = 'https://suap.ifba.edu.br/api/v2/autenticacao/token/';

    Map body = {"username": matricula, "password": password};

    try {
      response = await http.post('$url',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
          body: json.encode(body));
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      String token = json.decode(response.body)["token"];
      repository.saveDataLogin(matricula, password);
      repository.saveToken(token);
      return token;
    }
    return null;
  }
}
