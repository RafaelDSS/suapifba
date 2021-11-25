import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/reportcard/models/reportcard_model.dart';
import 'package:suapifba/app/modules/reportcard/repositories/reportcard_repository.dart';

class ReportCardStore extends StreamStore<Exception, List<ReportCardModel>> {
  final ReportcardRepository reportcardRepository;

  ReportCardStore(this.reportcardRepository) : super([]);

  getNotes(String period) {
    execute(() => reportcardRepository.fethData(period));
  }
}
