import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_page.dart';
import 'package:suapifba/app/modules/login/login_controller.dart';
import 'package:suapifba/app/shared/repositories/login_repository.dart';

import 'home_controller.dart';
import 'repositories/home_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginRepository()),
        Bind((i) => LoginController(i.get<LoginRepository>())),
        Bind((i) => HomeRepository()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Home()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
