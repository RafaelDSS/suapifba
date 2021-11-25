import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/virtualclass/components/tabbarclass.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclasses_repository.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/stores/virtualclasses_store.dart';
import 'package:suapifba/app/modules/virtualclass/stores/vistualclass_store.dart';
import 'package:suapifba/app/modules/virtualclass/virtualclass_page.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

class VirtualClassModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PeriodRepository(i.get())),
    Bind((i) => VirtualClassesRepository(i.get())),
    Bind((i) => VirtualClassRepository(i.get())),
    Bind((i) => PeriodStore(i.get())),
    Bind((i) => VirtualClassesStore(i.get())),
    Bind((i) => VirtualClassStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const VirtualClassPage()),
    ChildRoute('/class/',
        child: (_, args) => TabBarViewClass(virtualclass: args.data))
  ];
}
