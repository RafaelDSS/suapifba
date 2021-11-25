import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclasses_repository.dart';

class VirtualClassesStore
    extends StreamStore<Exception, List<VirtualClassesModel>> {
  final VirtualClassesRepository virtualClassesRepository;

  VirtualClassesStore(this.virtualClassesRepository) : super([]);

  getVirtualClasses(String period) {
    execute(() => virtualClassesRepository.fethData(period));
  }
}
