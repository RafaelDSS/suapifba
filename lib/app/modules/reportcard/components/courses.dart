import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/reportcard/models/reportcard_model.dart';

class Courses extends StatelessWidget {
  final List<ReportCardModel>? reportCard;

  const Courses({Key? key, this.reportCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: reportCard!.map(
        (item) {
          return ExpansionTile(
            leading: const Icon(Icons.note),
            title: Text(
              item.disciplina!,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            children: <Widget>[
              Card(
                elevation: 0.5,
                child: SizedBox(
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Situação: ${item.situacao.toString()}'),
                          Text('Faltas: ${item.numeroFaltas}')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Média: ${item.mediaDisciplina}'),
                          Text(
                            'Frequência: ${item.percentualCargaHorariaFrequentada?.round()}%',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ).toList()),
    );
  }
}
