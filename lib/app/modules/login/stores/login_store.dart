import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';
import 'package:suapifba/app/modules/login/repositories/login_repository.dart';

class LoginStore extends StreamStore<Exception, bool> {
  final LoginRepository loginRepository;
  final LocalStorageRepository localStorage;

  LoginStore(this.loginRepository, this.localStorage) : super(false);

  login(String matricula, String senha) {
    execute(() async => localStorage.saveToken(
          await loginRepository.fethToken(matricula, senha),
        ));
  }
}
