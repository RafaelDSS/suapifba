import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/home/repositories/manage_auth_repository.dart';
import 'package:suapifba/app/modules/home/repositories/refresh_token_repository.dart';
import 'package:suapifba/app/shared/helpers/token_expired.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';

class ManageAuthStore extends StreamStore<Exception, bool> {
  // Verificar se o token está expirado. Caso esteja expirado, mandar para tela de login, caso contrario,
  // Enviar uma requisição de refresh token e salva-lo.

  final RefreshTokenRepository refreshTokenRepository;
  final LocalStorageRepository localStorage;

  ManageAuthStore(this.localStorage, this.refreshTokenRepository)
      : super(false);

  verifyToken() {
    execute(
      () async {
        final acessToken = await localStorage.getToken();
        if (acessToken == null) {
          throw Exception("primeiro_acesso");
        } else if (verifyExpToken(acessToken)) {
          throw Exception("Sua sessão expirou.");
        }
        var token = await refreshTokenRepository.refreshToken(acessToken);
        if (token.isNotEmpty) {
          await localStorage.saveToken(token);
        }
        return true;
      },
    );
  }
}
