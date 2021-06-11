import 'package:mobx/mobx.dart';
import 'package:suapifba/app/modules/virtualclass/models/listvirtualclass_model.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

part 'hour_controller.g.dart';

class HourController = _HourControllerBase with _$HourController;

abstract class _HourControllerBase with Store {
  final PeriodRepository periodRepository;
  final ListVirtualClassRepository listVirtualClassRepository;

  _HourControllerBase(this.periodRepository, this.listVirtualClassRepository);

  @observable
  bool loading = true;

  @action
  changeLoading(bool value) => loading = value;

  @observable
  List<Period>? periods;

  @action
  getPeriods(String? token) async {
    periods = await periodRepository.fethData(token);
    loading = false;
  }

  @observable
  List<List>? hoursClass;

  @action
  getVirtualClasses(String token, String period) async {
    loading = true;
    List<ListVirtualClass> virtualClasses =
        await listVirtualClassRepository.fethData(token, period);
    hoursClass = processHoursClass(virtualClasses);
    loading = false;
  }

  processHoursClass(List<ListVirtualClass> classes) {
    List<List> hourFormated = [
      ['13:00 - 13:50', '', '', '', '', ''],
      ['13:50 - 14:40', '', '', '', '', ''],
      ['14:40 - 15:30', '', '', '', '', ''],
      ['15:30 - 16:20', '', '', '', '', ''],
      ['16:40 - 17:30', '', '', '', '', ''],
      ['17:30 - 18:20', '', '', '', '', ''],
    ];
    for (var item in classes) {
      List hoursDisciplina = item.horariosDeAula!.split(' / ');

      for (var hour in hoursDisciplina) {
        int day = int.parse(hour[0]) - 1;

        for (int i = 2; i < hour.length; i++) {
          int slot = int.parse(hour[i]) - 1;
          hourFormated[slot].removeAt(day);
          hourFormated[slot].insert(day, item.sigla);
        }
      }
    }
    return hourFormated;
  }

  validateData() {
    return hoursClass != null;
  }
}
