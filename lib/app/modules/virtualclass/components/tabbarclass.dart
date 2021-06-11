import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/components/aulatab.dart';
import 'package:suapifba/app/modules/virtualclass/components/materialtab.dart';
import 'package:suapifba/app/modules/virtualclass/components/participantestab.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class TabBarViewClass extends StatefulWidget {
  final VirtualClass? virtualclass;

  TabBarViewClass({this.virtualclass});

  @override
  _TabBarViewClassState createState() => _TabBarViewClassState();
}

class _TabBarViewClassState extends State<TabBarViewClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Turma Virtual - ${widget.virtualclass!.componenteCurricular!.split(' - ')[0]}'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Participantes',
              ),
              Tab(
                text: 'Aulas',
              ),
              Tab(
                text: 'Materiais',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ParticipantesTabView(
              participantes: widget.virtualclass!.participantes,
            ),
            AulaTabView(
              aulas: widget.virtualclass!.aulas,
            ),
            MaterialTabView(
              materiais: widget.virtualclass!.materiaisDeAula,
            )
          ],
        ),
      ),
    );
  }
}
