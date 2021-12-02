import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/home/repositories/manage_auth_repository.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';

class ManageAuthStore extends StreamStore<Exception, bool> {
  final ManageAuthRepository manageAuthRepository;
  final LocalStorageRepository localStorage;

  ManageAuthStore(this.localStorage, this.manageAuthRepository) : super(false);

  verifyToken() {
    execute(
      () async {
        final acessToken = await localStorage.getToken();
        if (acessToken == null) {
          throw Exception("Usuário não tem nenhuma sessão ativa.");
        }
        return manageAuthRepository.verifyToken(acessToken);
      },
    );
  }
}
