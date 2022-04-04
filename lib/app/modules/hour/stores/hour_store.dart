import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclasses_model.dart';
import 'package:suapifba/app/modules/virtualclass/repositories/virtualclasses_repository.dart';
import 'package:suapifba/app/modules/hour/models/hour_model.dart';

const Map nomesTurnoEhorario = {
  "M": [
    "MATUTINO",
    [
      '07:00 - 07:45',
      '07:45 - 08:30',
      '08:50 - 09:35',
      '09:35 - 10:20',
      '10:30 - 11:15',
      '11:15 - 12:00'
    ]
  ],
  "V": [
    "VESPERTINO",
    [
      '13:00 - 13:50',
      '13:50 - 14:40',
      '14:40 - 15:30',
      '15:30 - 16:20',
      '16:40 - 17:30',
      '17:30 - 18:20'
    ]
  ],
  "N": [
    "NOTURNO",
    [
      '16:50 - 17:40',
      '17:40 - 18:30',
      '18:30 - 19:20',
      '19:20 - 20:10',
      '20:20 - 21:10',
      '21:10 - 22:00'
    ]
  ]
};

HourModel processHoursClass(List<VirtualClassesModel> classes) {
  List<List> hoursFormated = [];
  String siglaTurno = classes[0].horariosDeAula![1];
  List dadosTurno = nomesTurnoEhorario[siglaTurno];
  String shift = dadosTurno[0];
  List hour = dadosTurno[1];

  for (var i = 0; i < hour.length; i++) {
    hoursFormated.add([
      hour[i],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
      ["", ""],
    ]);
  }

  for (var item in classes) {
    List hoursDisciplina = item.horariosDeAula!.split(' / ');

    for (var hour in hoursDisciplina) {
      int day = int.parse(hour[0]) - 1;

      for (int i = 2; i < hour.length; i++) {
        int slot = int.parse(hour[i]) - 1;
        hoursFormated[slot].removeAt(day);
        hoursFormated[slot].insert(day, [item.sigla, item.descricao]);
      }
    }
  }
  return HourModel(shift, hoursFormated);
}

class HourStore extends StreamStore<Exception, HourModel> {
  final VirtualClassesRepository virtualClassesRepository;

  HourStore(this.virtualClassesRepository) : super(HourModel("", []));

  getHour(String period) {
    execute(() => virtualClassesRepository
        .fethData(period)
        .then((response) => processHoursClass(response)));
  }
}
