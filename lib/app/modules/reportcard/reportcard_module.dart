import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/reportcard/reportcard_page.dart';
import 'package:suapifba/app/modules/reportcard/stores/reportcard_store.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';
import 'package:suapifba/app/shared/stores/period_store.dart';

import 'repositories/reportcard_repository.dart';

class ReportCardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PeriodRepository(i.get())),
    Bind((i) => ReportcardRepository(i.get())),
    Bind((i) => PeriodStore(i.get())),
    Bind((i) => ReportCardStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ReportCard()),
  ];
}
