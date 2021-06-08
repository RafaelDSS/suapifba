import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_module.dart';
import 'package:suapifba/app/modules/hour/hour_module.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_module.dart';
import 'app_widget.dart';
import 'modules/login/login_module.dart';
import 'modules/reportcard/reportcard_module.dart';

class AppModule extends MainModule {
  final String route;

  AppModule(this.route);

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/reportcard', module: ReportCardModule()),
        Router('/virtualclass', module: VirtualClassModule()),
        Router('/hour', module: HourModule()),
      ];

  @override
  Widget get bootstrap => AppWidget(route);

  static Inject get to => Inject<AppModule>.of();
}
