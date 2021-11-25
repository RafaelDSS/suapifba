import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/hour/hour_page.dart';
import 'package:suapifba/app/modules/hour/stores/hour_store.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclasses_repository.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

class HourModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PeriodRepository(i.get())),
    Bind((i) => VirtualClassesRepository(i.get())),
    Bind((i) => PeriodStore(i.get())),
    Bind((i) => HourStore(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HourPage()),
  ];
}
