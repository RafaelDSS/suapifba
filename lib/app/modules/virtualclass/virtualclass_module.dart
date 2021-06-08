import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_controller.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_page.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

class VirtualClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
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
  List<Router> get routers =>
      [Router('/', child: (_, args) => VirtualClassPage(token: args.data))];
}
