import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

class PeriodStore extends StreamStore<Exception, List<Period>> {
  final PeriodRepository periodRepository;

  PeriodStore(this.periodRepository) : super([]);

  getPeriods() {
    execute(() => periodRepository.fethData());
  }
}
