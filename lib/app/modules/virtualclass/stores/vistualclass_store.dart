import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclass_repository.dart';

class VirtualClassStore extends StreamStore<Exception, VirtualClassModel> {
  final VirtualClassRepository virtualClassRepository;

  VirtualClassStore(this.virtualClassRepository) : super(VirtualClassModel());

  getVirtualClass(String virtualClassId) {
    execute(() => virtualClassRepository.fethData(virtualClassId));
  }
}
