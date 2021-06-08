import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';
import 'package:suapifba/app/modules/home/home_module.dart';
import 'package:suapifba/app/modules/home/repositories/home_repository.dart';
import 'package:suapifba/app/shared/repositories/login_repository.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<LoginRepository>())),
        Bind((i) => LoginRepository()),
        Bind((i) => HomeRepository()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Login()),
        // Router('/home', module: HomeModule())
      ];

  static Inject get to => Inject<LoginModule>.of();
}
