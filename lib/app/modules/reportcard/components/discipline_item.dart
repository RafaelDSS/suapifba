import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/reportcard/reportcard_controller.dart';

class DisciplineItem extends StatelessWidget {
  final ReportcardController? controller;

  DisciplineItem({this.controller});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: controller!.notes!.map(
        (item) {
          return ExpansionTile(
            leading: Icon(Icons.note),
            title: Text(
              item.disciplina!,
              style: TextStyle(
                color: Colors.grey[700],
                // shadows: [
                //   Shadow(
                //     blurRadius: 2,
                //     color: Colors.black38,
                //     offset: Offset(1.2, 1.2),
                //   )
                // ],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            children: <Widget>[
              Card(
                elevation: 0.5,
                child: Container(
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Situação: ${item.situacao}'),
                          Text('Faltas: ${item.numeroFaltas}')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Média: ${item.mediaDisciplina}'),
                          Text(
                            'Frequência: ${item.percentualCargaHorariaFrequentada}%',
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
