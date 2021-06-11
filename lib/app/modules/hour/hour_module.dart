import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

import 'hour_controller.dart';
import 'hour_page.dart';

class HourModule extends Module {
  @override
  final List<Bind> binds = [
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
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HourPage(token: args.data)),
  ];
}
