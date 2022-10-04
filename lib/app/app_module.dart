import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_module.dart';
import 'package:suapifba/app/modules/hour/hour_module.dart';
import 'package:suapifba/app/modules/news/news_module.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_module.dart';
import 'package:suapifba/app/shared/helpers/custom_dio/custom_dio.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';
import 'modules/login/login_module.dart';
import 'modules/reportcard/reportcard_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LocalStorageRepository()),
    Bind.singleton((i) => CustomDio(Dio())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/reportcard/', module: ReportCardModule()),
    ModuleRoute('/virtualclass/', module: VirtualClassModule()),
    ModuleRoute('/hour/', module: HourModule()),
    ModuleRoute('/news/', module: NewsModule()),
  ];
}
