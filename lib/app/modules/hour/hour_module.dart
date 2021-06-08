import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

import 'hour_controller.dart';
import 'hour_page.dart';

class HourModule extends ChildModule {
  @override
  List<Bind> get binds => [
      Bind((i) => PeriodRepository()),
        Bind((i) => ListVirtualClassRepository()),
        Bind(
          (i) => HourController(
            i.get<PeriodRepository>(),
            i.get<ListVirtualClassRepository>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HourPage(token: args.data)),
      ];

  static Inject get to => Inject<HourModule>.of();
}
