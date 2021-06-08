import 'package:mobx/mobx.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

import 'models/reportcard_model.dart';
import 'repositories/reportcard_repository.dart';
part 'reportcard_controller.g.dart';

class ReportcardController = _ReportcardControllerBase
    with _$ReportcardController;

abstract class _ReportcardControllerBase with Store {
  final PeriodRepository periodRepository;
  final ReportcardRepository reportcardRepository;

  _ReportcardControllerBase(this.periodRepository, this.reportcardRepository);

  @observable
  bool loading = true;

  @action
  changeLoading(bool value) => loading = value;

  @observable
  List<Period> periods;

  @action
  getPeriods(String token) async {
    periods = await periodRepository.fethData(token);
    loading = false;
  }

  @observable
  List<ReportCard> notes;

  @action
  getNotes(String token, String period) async {
    loading = true;
    notes = await reportcardRepository.fethData(token, period);
    loading = false;
  }

  validateData() {
    return notes != null;
  }
}
