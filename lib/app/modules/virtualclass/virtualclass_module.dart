import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_controller.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_page.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

class VirtualClassModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PeriodRepository()),
    Bind((i) => ListVirtualClassRepository()),
    Bind((i) => VirtualClassRepository()),
    Bind(
      (i) => VirtualClassController(
        i.get<PeriodRepository>(),
        i.get<ListVirtualClassRepository>(),
        i.get<VirtualClassRepository>(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => VirtualClassPage(token: args.data))
  ];
}
