import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/shared/models/period_model.dart';
import 'package:suapifba/app/shared/repositories/period_repository.dart';

class AuthStore extends StreamStore<Exception, List<Period>> {
  final PeriodRepository periodRepository;

  AuthStore(this.periodRepository) : super([]);

  getPeriods(String token) {
    execute(() => periodRepository.fethData());
  }
}
