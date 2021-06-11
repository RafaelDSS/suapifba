import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:suapifba/app/shared/repositories/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository repository;

  LoginControllerBase(this.repository);

  @observable
  String? matricula;

  @action
  changeMatricula(String value) {
    matricula = value;
  }

  @observable
  String? password;

  @action
  changePassword(String value) {
    password = value;
  }

  @observable
  bool rememberMe = false;

  @action
  changeRememberMe(bool value) {
    rememberMe = value;
  }

  @observable
  bool isbuttonpress = false;

  @action
  submitForm() async {
    isbuttonpress = true;
    String? token = await repository.fethToken(matricula, password);
    if (token == null) {
      isbuttonpress = false;
    } else {
      Modular.to.pushReplacementNamed('/home');
    }
  }
}
