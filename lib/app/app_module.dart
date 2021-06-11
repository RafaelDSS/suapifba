import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_module.dart';
import 'package:suapifba/app/modules/hour/hour_module.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_module.dart';
import 'app_widget.dart';
import 'modules/login/login_module.dart';
import 'modules/reportcard/reportcard_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/reportcard', module: ReportCardModule()),
    ModuleRoute('/virtualclass', module: VirtualClassModule()),
    ModuleRoute('/hour', module: HourModule()),
  ];
}
