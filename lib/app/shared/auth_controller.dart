import 'dart:convert';
import 'package:suapifba/app/shared/repositories/login_repository.dart';
import 'repositories/localstore_repository.dart';

import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  LocalStoreRepository repositoryStore = LocalStoreRepository();
  LoginRepository repositoryAuth = LoginRepository();
  
  verifyExpToken(String token) {
    var jwt = token.split('.');
    var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
    var expToken = payload['exp'];
    var utcNow = DateTime.now().millisecondsSinceEpoch / 1000;
    return utcNow.toInt() > expToken;
  }

  validateLogin() async {
    
  }

  Future<bool> checkLogin() async {
    List<String> dataLogin = await repositoryStore.getDataLogin();

    if (dataLogin != null){
      final matricula = dataLogin[0];
      final password = dataLogin[1];
      await repositoryAuth.fethToken(matricula, password);
      return true;
    }
    return false;
  }
  Future<String> getRoute() async {
    String route = '/login';
    bool isLogged = await checkLogin();

    if (isLogged) {
      route = '/home';
    }
    return route;
  }
}
