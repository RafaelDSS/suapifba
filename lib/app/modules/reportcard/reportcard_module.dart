import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/reportcard/reportcard_controller.dart';
import 'package:suapifba/app/modules/reportcard/reportcard_page.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

import 'repositories/reportcard_repository.dart';

class ReportCardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PeriodRepository()),
        Bind((i) => ReportcardRepository()),
        Bind((i) => ReportcardController(
            i.get<PeriodRepository>(), i.get<ReportcardRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ReportCard(token: args.data)),
      ];
}
