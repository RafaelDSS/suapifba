import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclasses_repository.dart';

processHoursClass(List<VirtualClassesModel> classes) {
  List<List> hourFormated = [
    [
      '13:00 - 13:50',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
    [
      '13:50 - 14:40',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
    [
      '14:40 - 15:30',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
    [
      '15:30 - 16:20',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
    [
      '16:40 - 17:30',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
    [
      '17:30 - 18:20',
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""]
    ],
  ];
  for (var item in classes) {
    List hoursDisciplina = item.horariosDeAula!.split(' / ');

    for (var hour in hoursDisciplina) {
      int day = int.parse(hour[0]) - 1;

      for (int i = 2; i < hour.length; i++) {
        int slot = int.parse(hour[i]) - 1;
        hourFormated[slot].removeAt(day);
        hourFormated[slot].insert(day, [item.sigla, item.descricao]);
      }
    }
  }
  return hourFormated;
}

class HourStore extends StreamStore<Exception, List<List>> {
  final VirtualClassesRepository virtualClassesRepository;

  HourStore(this.virtualClassesRepository) : super([]);

  getHour(String period) {
    execute(() => virtualClassesRepository
        .fethData(period)
        .then((response) => processHoursClass(response)));
  }
}
