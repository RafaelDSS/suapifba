import 'package:mobx/mobx.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/listvirtualclass_repository.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclass_repository.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

import 'models/listvirtualclass_model.dart';
part 'virtualclass_controller.g.dart';

class VirtualClassController = _VirtualClassControllerBase
    with _$VirtualClassController;

abstract class _VirtualClassControllerBase with Store {
  final PeriodRepository periodRepository;
  final ListVirtualClassRepository listVirtualClassRepository;
  final VirtualClassRepository virtualClassRepository;

  _VirtualClassControllerBase(this.periodRepository,
      this.listVirtualClassRepository, this.virtualClassRepository);
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
  List<ListVirtualClass> virtualClasses;

  @action
  getVirtualClasses(String token, String period) async {
    loading = true;
    virtualClasses = await listVirtualClassRepository.fethData(token, period);
    loading = false;
  }

  @action
  getVirtualClass(String token, String code) async {
    loading = true;
    final virtualClass = await virtualClassRepository.fethData(token, code);
    loading = false;
    return virtualClass;
  }

  validateData() {
    return virtualClasses != null;
  }
}
